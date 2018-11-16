//
//  BTCWrapper.m
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#define BTC_BIP44_Path     @"m/44'/0'/0'/0/0"

#import "BTCWrapper.h"
#import "CoinNetWorkManager.h"

static NSString const *BTC_API_URL = @"https://blockchain.info";
static BOOL const isProduction = YES;

@implementation BTCWrapper

+(void)createAccountWithBlock:(NSString *)passPhrase password:(NSString *)password completed:(void(^)(NSString *private,NSString *address,NSString *words))block
{
    BTCMnemonic *mnemonic = [BTCWrapper generateMnemonicPassphrase:passPhrase withPassword:password];
    BTCKeychain *keyPr = mnemonic.keychain;
    BTCKey *key = [keyPr keyWithPath:BTC_BIP44_Path];
    
    if (isProduction) {
        block(key.privateKeyAddress.string,key.address.string,[BTCWrapper getPassphraseByMnemonic:mnemonic]);
    }else{
        block(key.privateKeyAddressTestnet.string,key.addressTestnet.string,[BTCWrapper getPassphraseByMnemonic:mnemonic]);
    }
    
}

+(void)importPrivateKey:(NSString *)privateKey
                success:(void(^)(NSString *private,NSString *address))successblock
                  error:(void(^)(void))errorblock{
    BTCPrivateKeyAddress *privateKeyAddress;
    if (isProduction) {
        privateKeyAddress = [BTCPrivateKeyAddress addressWithString:privateKey];
    }else{
        privateKeyAddress = [BTCPrivateKeyAddressTestnet addressWithString:privateKey];
    }
    
    if (privateKeyAddress == nil) {
        errorblock();
        return;
    }
    
    successblock(privateKeyAddress.string,privateKeyAddress.publicAddress.string);
    
    
}


+(BTCMnemonic *)generateMnemonicPassphrase:(NSString *)phrase withPassword:(NSString *)password{
    BTCMnemonic *mnemonic;
    if (phrase != nil) {
        NSArray *words = [phrase componentsSeparatedByString:@" "];
        mnemonic = [[BTCMnemonic alloc] initWithWords:words password:password wordListType:BTCMnemonicWordListTypeEnglish];
    }else{
        mnemonic = [[BTCMnemonic alloc] initWithEntropy:BTCRandomDataWithLength(16) password:password wordListType:BTCMnemonicWordListTypeEnglish];
    }
    return mnemonic;
}


+(NSString *)getPassphraseByMnemonic:(BTCMnemonic *)mnemonic{
    return [mnemonic.words componentsJoinedByString:@" "];
}



+(void)getBalanceWithAddress:(NSString *)address
                       block:(void(^)(NSDictionary *dict,BOOL suc))block{
    NSString *urlStr = [NSString stringWithFormat:@"%@/balance?active=%@",BTC_API_URL,address];
    [[CoinNetWorkManager shareNetworkingManager] requestWithMethod:@"GET"
                                                 headParameter:nil
                                                 bodyParameter:nil
                                                  relativePath:urlStr
                                                       success:^(id responseObject) {
                                                           block(responseObject,YES);
                                                       } failure:^(NSString *errorMsg) {
                                                           block(nil,NO);
                                                       }];
}



+(void)getTxlistWithAddress:(NSString *)address
                   withPage:(NSInteger)page
                      block:(void(^)(NSArray *array,BOOL suc))block{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/rawaddr/%@?offset=%zi&limit=10",BTC_API_URL,address,page-1];
    [[CoinNetWorkManager shareNetworkingManager] requestWithMethod:@"GET"
                                                 headParameter:nil
                                                 bodyParameter:nil
                                                  relativePath:urlStr
                                                       success:^(id responseObject) {
                                                           block([responseObject objectForKey:@"txs"],YES);
                                                       } failure:^(NSString *errorMsg) {
                                                           block(nil,NO);
                                                       }];
    
    
    
}


+ (NSArray *)unspentOutputs:(NSArray *)responseOutputArray {
    NSMutableArray *outputs = [NSMutableArray array];
    for (NSDictionary* item in responseOutputArray) {
        BTCTransactionOutput* txout = [[BTCTransactionOutput alloc] init];
        
        txout.value = [item[@"value"] longLongValue];
        txout.script = [[BTCScript alloc] initWithString:item[@"script"]];
        txout.index = [item[@"output_index"] intValue];
        txout.transactionHash = (BTCReversedData(BTCDataFromHex(item[@"transaction_hash"])));
        [outputs addObject:txout];
    }
    return outputs;
}




//+(void)sendToAddress:(NSString *)toAddress money:(NSString *)money fromAddress:(NSString *)fromAddress privateKey:(NSString *)privateKey feePerByte:(BTCAmount)feePerByte block:(void(^)(NSString *hashStr,BOOL suc))block{

+(void)sendToAddress:(NSString *)toAddress money:(NSString *)money fromAddress:(NSString *)fromAddress privateKey:(NSString *)privateKey fee:(BTCAmount)fee block:(void(^)(NSString *hashStr,BOOL suc))block{
    
    
    BTCPrivateKeyAddress *privateKeyAddress;
    if (isProduction) {
        privateKeyAddress = [BTCPrivateKeyAddress addressWithString:privateKey];
    }else{
        privateKeyAddress = [BTCPrivateKeyAddressTestnet addressWithString:privateKey];
    }
    
    BTCKey *key = privateKeyAddress.key;
    
    BTCBlockchainInfo *info = [[BTCBlockchainInfo alloc] init];
    
    NSError *error = nil;
    
    NSArray *utxos = [info unspentOutputsWithAddresses:@[[BTCAddress addressWithString:fromAddress]] error:&error];
    
    NSLog(@"%@",utxos);
    BTCAmount amount = money.doubleValue * pow(10.0, 8);
    
    
    // Sort utxo in order of amount.
    utxos = [utxos sortedArrayUsingComparator:^(BTCTransactionOutput* obj1, BTCTransactionOutput* obj2) {
        if ((obj1.value - obj2.value) < 0) return NSOrderedAscending;
        else return NSOrderedDescending;
    }];
    
    // Find enough outputs to spend the total amount.
    
    NSMutableArray *txouts = [NSMutableArray array];
    
    BTCAmount balance = 0;
    BTCAmount totalAmount = amount;
    
    if (!txouts || balance < totalAmount) {
        block(@"",NO);
    } else {
        BTCTransaction *tx = [[BTCTransaction alloc] init];
        
        BTCAmount spentCoins = 0;
        
        // Add all outputs as inputs
        for (BTCTransactionOutput *txout in txouts) {
            BTCTransactionInput *txin = [[BTCTransactionInput alloc] init];
            txin.previousHash = txout.transactionHash;
            txin.previousIndex = txout.index;
            [tx addInput:txin];
            
            spentCoins += txout.value;
        }
        
        
        
        // Add required outputs - payment and change
        BTCTransactionOutput *paymentOutput = [[BTCTransactionOutput alloc]initWithValue:amount address:[BTCPublicKeyAddress addressWithString:toAddress]];
        
        BTCTransactionOutput *changeOutput = [[BTCTransactionOutput alloc]initWithValue:(spentCoins - totalAmount) address:[BTCPublicKeyAddress addressWithString:fromAddress]];
        [tx addOutput:paymentOutput];
        [tx addOutput:changeOutput];
        
        // Sign all inputs. We now have both inputs and outputs defined, so we can sign the transaction.
        for (int i = 0; i < txouts.count; i++) {
            BTCTransactionOutput *txout = txouts[i]; // output from a previous tx which is referenced by this txin.
            BTCTransactionInput *txin = tx.inputs[i];
            
            BTCScript *sigScript = [[BTCScript alloc] init];
            NSData* hash = [tx signatureHashForScript:txout.script inputIndex:i hashType:BTCSignatureHashTypeAll error:&error];
            
            if (!hash) {
                block(@"",NO);
                return;
            } else {
                NSData *signature = [key signatureForHash:hash];
                
                NSMutableData *signatureForScript = [signature mutableCopy];
                unsigned char hashtype = BTCSignatureHashTypeAll;
                [signatureForScript appendBytes:&hashtype length:1];
                [sigScript appendData:signatureForScript];
                [sigScript appendData:key.publicKey];
                
                txin.signatureScript = sigScript;
            }
        }
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        NSString* urlstring = [NSString stringWithFormat:@"%@/pushtx",BTC_API_URL];
        
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST"
                                                                                     URLString:urlstring
                                                                                    parameters:nil error:nil];
        
        NSData *body =  [[NSString stringWithFormat:@"tx=%@", BTCHexFromData([tx data])] dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
        //发起请求
        [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            if (!error) {
                NSLog(@"Reply JSON: %@", responseObject);
                
                NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                if ( [str hasPrefix:@"Transaction Submitted"]) {
                    block(nil,YES);
                }else{
                    block(nil,NO);
                }
            } else {
                block(nil,NO);
            }
            
        }] resume];
    }
}





- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * __nullable credential))completionHandler {
    
    // 判断是否是信任服务器证书
    if(challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
        // 告诉服务器，客户端信任证书
        // 创建凭据对象
        NSURLCredential *credntial = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        // 通过completionHandler告诉服务器信任证书
        completionHandler(NSURLSessionAuthChallengeUseCredential,credntial);
    }
}




@end
