//
//  HSEther.m
//  HSEther
//
//  Created by 侯帅 on 2018/4/20.
//  Copyright © 2018年 com.houshuai. All rights reserved.
//

#import "HSEther.h"
#import <ethers/Account.h>
#import "Signer.h"
#import "CloudKeychainSigner.h"
#import <ethers/SecureData.h>
#import <ethers/EtherscanProvider.h>//查询代币余额
#import "Wallet.h"

@interface HSEther()
{
    ArrayPromise *_addressInspectionPromise;
    BigNumber *_fuzzyEstimate;
    BigNumber *_gasPriceEstimate;
}
//转账相关
@property (nonatomic, readonly) Transaction *transaction;

@property (nonatomic, readonly) Signer *signer;

@property (nonatomic, copy) NSString *address, *count, *remark, *gasPrice, *gasLimit, *password;

@property (nonatomic, assign) BOOL feeReady;

@property (nonatomic, strong) BigNumber *gasEstimate;

@end

@implementation HSEther

+(void)hs_importWithWord:(NSString *)word Pwd:(NSString *)pwd block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey))block {
    Account *account = [Account accountWithMnemonicPhrase:word];
    [account encryptSecretStorageJSON:pwd callback:^(NSString *json) {
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        //地址
        NSString *addressStr = [NSString stringWithFormat:@"0x%@",dic[@"address"]];
        //私钥
        NSString *privateKeyStr = [SecureData dataToHexString:account.privateKey];
        //助记词account.mnemonicPhrase
        //助记keyStore 就是json字符串
        
        block(addressStr,json,account.mnemonicPhrase,privateKeyStr);
    }];
}


+(void)hs_createWithPwd:(NSString *)pwd block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey))block{
    Account *account = [Account randomMnemonicAccount];
    [account encryptSecretStorageJSON:pwd callback:^(NSString *json) {
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        //地址
        NSString *addressStr = [NSString stringWithFormat:@"0x%@",dic[@"address"]];
        //私钥
        NSString *privateKeyStr = [SecureData dataToHexString:account.privateKey];
        //助记词account.mnemonicPhrase
        //助记keyStore 就是json字符串
        
        block(addressStr,json,account.mnemonicPhrase,privateKeyStr);
    }];
}

+(void)hs_inportMnemonics:(NSString *)mnemonics pwd:(NSString *)pwd block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey,BOOL suc,HSWalletError error))block{
    if (mnemonics.length < 1) {
        block(@"",@"",@"",@"",NO,HSWalletErrorMnemonicsLength);
        return;
    }
    if (pwd.length < 1) {
        block(@"",@"",@"",@"",NO,HSWalletErrorPwdLength);
        return;
    }
    NSArray *arrayMnemonics = [mnemonics componentsSeparatedByString:@" "];
    if (arrayMnemonics.count != 12) {
        block(@"",@"",@"",@"",NO,HSWalletErrorMnemonicsCount);
        return;
    }
    for (NSString *m in arrayMnemonics) {
        if (![Account isValidMnemonicWord:m]) {
            NSString *msg = [NSString stringWithFormat:@"助记词 %@ 有误", m];
            NSLog(@"%@",msg);
            block(@"",@"",@"",@"",NO,HSWalletErrorMnemonicsValidWord);
            return;
        }
    }
    if (![Account isValidMnemonicPhrase:mnemonics]) {
        block(@"",@"",@"",@"",NO,HSWalletErrorMnemonicsValidPhrase);
        return;
    }
    //1 创建
    Account *account = [Account accountWithMnemonicPhrase:mnemonics];
    if (pwd == nil || [pwd isEqualToString:@""]) {
        block(account.address.checksumAddress,@"没有keystore，请传入密码即可生成私钥",account.mnemonicPhrase,@"没有私钥，请传入密码即可生成私钥",YES,HSWalletImportMnemonicsSuc);
    }else{
        //2 生成keystore
        [account encryptSecretStorageJSON:pwd callback:^(NSString *json) {
            NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
            NSError *err;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&err];
            //3 获取地址 （account.address也可以）
            NSString *addressStr = [NSString stringWithFormat:@"0x%@",dic[@"address"]];
            //4 获取私钥
            NSString *privateKeyStr = [SecureData dataToHexString:account.privateKey];
            //5 获取助记词 account.mnemonicPhrase
            //6 获取keyStore 就是json字符串
            //7 block 回调
            block(addressStr,json,account.mnemonicPhrase,privateKeyStr,YES,HSWalletImportMnemonicsSuc);
            
        }];
    }
    
}

+(void)hs_importKeyStore:(NSString *)keyStore
                     pwd:(NSString *)pwd
                   block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey,BOOL suc,HSWalletError error))block{
    if (pwd.length < 1) {
        block(@"",@"",@"",@"",NO,HSWalletErrorPwdLength);
        return;
    }
    if (keyStore.length < 1) {
        block(@"",@"",@"",@"",NO,HSWalletErrorKeyStoreLength);
        return;
    }
    //1 解密keystory
    [Account decryptSecretStorageJSON:keyStore password:pwd callback:^(Account *account, NSError *NSError) {
        if (NSError) {
            //2.1 解密失败
            NSLog(@"keyStore解密失败%@",NSError.localizedDescription);
            block(@"",@"",@"",@"",NO,HSWalletErrorKeyStoreValid);
            return ;
        }else{
            if (pwd == nil || [pwd isEqualToString:@""]) {
                block(account.address.checksumAddress,@"没有keystore，请传入密码即可生成私钥",account.mnemonicPhrase,@"没有私钥，请传入密码即可生成私钥",YES,HSWalletImportKeyStoreSuc);
            }else{
                //2.2 解密成功
                [account encryptSecretStorageJSON:pwd callback:^(NSString *json) {
                    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
                    //3 获取地址 （account.address也可以）
                    NSString *addressStr = [NSString stringWithFormat:@"0x%@",dic[@"address"]];
                    //4 获取私钥
                    NSString *privateKeyStr = [SecureData dataToHexString:account.privateKey];
                    //5 获取助记词 account.mnemonicPhrase
                    //6 获取keyStore 就是json字符串
                    //7 block 回调
                    block(addressStr,json,account.mnemonicPhrase,privateKeyStr,YES,HSWalletImportKeyStoreSuc);
                }];
            }
            
            
        }
    }];
}

+(void)hs_importWalletForPrivateKey:(NSString *)privateKey
                                pwd:(NSString *)pwd
                              block:(void(^)(NSString *address,NSString *keyStore,NSString *mnemonicPhrase,NSString *privateKey,BOOL suc,HSWalletError error))block{
    if (privateKey.length < 1) {
        block(@"",@"",@"",@"",NO,HSWalletErrorPrivateKeyLength);
        return;
    }
    if (pwd.length < 1) {
        block(@"",@"",@"",@"",NO,HSWalletErrorPwdLength);
        return;
    }
    //1 解密私钥
    Account *account = [Account accountWithPrivateKey:[SecureData hexStringToData:[privateKey hasPrefix:@"0x"]?privateKey:[@"0x" stringByAppendingString:privateKey]]];
    
    //2 生成keystore
    [account encryptSecretStorageJSON:pwd callback:^(NSString *json) {
        NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
        //3 获取地址 （account.address也可以）
        NSString *addressStr = [NSString stringWithFormat:@"0x%@",dic[@"address"]];
        //4 获取私钥
        NSString *privateKeyStr = [SecureData dataToHexString:account.privateKey];
        //5 获取助记词 account.mnemonicPhrase
        //6 获取keyStore 就是json字符串
        //7 block 回调
        block(addressStr,json,account.mnemonicPhrase,privateKeyStr,YES,HSWalletImportPrivateKeySuc);
    }];
}


+(void)hs_getBalanceWithTokens:(NSArray<NSString *> *)arrayToken
                   withAddress:(NSString *)address
                         block:(void(^)(NSArray *arrayBanlance,BOOL suc))block{
    
    if (address.length != @"0x4f3B600378BD40b93B85DFd8A4aDf7c05E719672".length) {
        NSLog(@"%@ 地址错误",address);
        block([NSArray array],NO);
        return;
    }
    
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@{@"contractAddress":address,@"symbol":@"eth",@"type":@"eth"}];
    for (NSString *tokenStr in arrayToken) {
        [array addObject:@{@"contractAddress":tokenStr,@"symbol":@"",@"type":@"eth"}];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"HSCoinListArrayM"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    EtherscanProvider *e = [[EtherscanProvider alloc]initWithChainId:ChainIdHomestead];
    Address *a = [Address addressWithString:address];
    [[e getTokenBalance:a] onCompletion:^(ArrayPromise *promise) {
        if (!promise.result || promise.error) {
            NSLog(@"%@ hs_getBalanceWithTokens 获取失败",address);
            
            block([NSArray array],NO);
        }else{
            NSMutableArray *arrayBalance = [NSMutableArray array];
            for (Erc20Token *obj in promise.value) {
                [arrayBalance addObject:obj.balance.decimalString];
            }
            block(arrayBalance,YES);
        }
    }];
    
}

+(void)hs_sendToAssress:(NSString *)toAddress money:(NSString *)money symbolETH:(BOOL )symbolETH decimal:(NSString *)decimal currentKeyStore:(NSString *)keyStore pwd:(NSString *)pwd block:(void(^)(NSString *hashStr,BOOL suc,HSWalletError error))block{
    
    NSData *jsonData = [keyStore dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    //3 获取地址 （account.address也可以）
    NSString *addressStr = [NSString stringWithFormat:@"0x%@",dic[@"address"]];
    //1.3 设置转账参数
    __block Transaction *transaction = [Transaction transactionWithFromAddress:[Address addressWithString:addressStr]];
    
    __block BigNumber *_gasPriceEstimate;
    __block NSString *address, *count, *remark, *gasPrice, *gasLimit, *password;
    NSLog(@"创建锁...");
    Wallet *wallet = [Wallet walletWithKeychainKey:@"sharedWallet"];
    Signer *signer = [wallet hs_getSignerAccountJson:keyStore name:@"signerhs"];
    [signer lock];
    NSLog(@"或者当前节点转账gasPrice...");
    [[signer.provider getGasPrice] onCompletion:^(BigNumberPromise *promise) {
        if (promise.error) {
            NSLog(@"gasPrice 获取当前节点转账gasPrice失败\n%@",promise.error);
            block(@"",NO,HSWalletErrorNotGasPrice);
            return;
        }else{
            //数据获取成功，重新设置
            _gasPriceEstimate = promise.value;
            gasPrice = [_gasPriceEstimate div:[BigNumber bigNumberWithDecimalString:@"1000000000"]].decimalString;
            //+1操作
            gasPrice = [NSString stringWithFormat:@"%ld",gasPrice.integerValue + 1];
            NSLog(@"得到gasPrice = %@",gasPrice);
            transaction.chainId = signer.transactionCount;
            transaction.nonce = signer.transactionCount;//数量
            transaction.gasLimit = [BigNumber bigNumberWithDecimalString:symbolETH?@"30000":@"60000"];
            transaction.toAddress = [Address addressWithString:toAddress];
            
            if (symbolETH) {//eth 交易
                transaction.data = [SecureData secureDataWithCapacity:0].data;
                //交易数量
                transaction.value = [self getTransactionValue:money decimal:decimal];
                if (transaction.value.integerValue == 0) {
                    NSLog(@"转账金额太小\n%@",money);
                    block(@"",NO,HSWalletErrorMoneyMin);
                    return;
                }
            }else{
                
            }
            
            if ([transaction.value compare:signer.balance] != NSOrderedDescending) {
                
            }else {
                block(@"余额不足",NO,HSWalletErrorNSOrderedDescending);
                return;
            }
            
        }
    }];
    
}

//计算交易数量
+ (BigNumber*)getTransactionValue:(NSString*)text decimal:(NSString *)decimal{
    // Normalize to use a decimal place
    if ([[NSLocale currentLocale].decimalSeparator isEqualToString:@","]) {
        text = [text stringByReplacingOccurrencesOfString:@"," withString:@"."];
    }
    
    if (text.length == 0 || [text isEqualToString:@"."]) { text = @"0"; }
    NSInteger i = text.doubleValue * pow(10.0, decimal.floatValue);
    BigNumber *b = [BigNumber bigNumberWithInteger:i];
    NSLog(@"原来 = %@",[Payment parseEther:text]);
    NSLog(@"1现在 = %@",b);
    if (b == nil || [b isKindOfClass:[NSNull class]]) {
        NSLog(@"转账金额太小");
        text = @"0";
        return [Payment parseEther:text];
    }else{
        return b;
    }
}




@end
