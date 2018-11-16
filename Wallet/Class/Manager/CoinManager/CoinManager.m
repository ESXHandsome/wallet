//
//  CoinManager.m
//  Wallet
//
//  Created by Ying on 2018/10/30.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "CoinManager.h"
#import "HSEther.h"
#import "BTCWrapper.h"
#import "UserConfigManager.h"

@implementation CoinWalletModel

@end

@implementation CoinManager

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

/**添加钱包*/
- (BOOL)addWallent:(NSString *)passWord name:(nonnull NSString *)walletName complete:(void(^)(void))complete {
    if (![UserConfigManager isBuild]) {
        if (!walletName) {
            walletName = @"Wallet";
        }
    } else {
        if (!walletName) {
            NSInteger count = [UserConfigManager getUserConfigDic].allKeys.count;
            walletName = [NSString stringWithFormat:@"Wallet%ld",(long)count];
        }
        if ([[UserConfigManager getUserConfigDic].allKeys containsObject:walletName]) {
            return NO;
        }
    }
    
    __block NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:walletName forKey:@"walletName"];
    [dic setValue:@"" forKey:@"iconName"];
    [dic setValue:passWord forKey:@"password"];
    [HSEther hs_createWithPwd:passWord block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
        
        [dic setValue:privateKey forKey:@"ETH_PRIVATE_KEY"];
        [dic setValue:address forKey:@"ETH_ADDRESS"];
        [dic setValue:mnemonicPhrase forKey:@"ETH_PHRASE"];
        [dic setValue:keyStore forKey:@"ETH_KEYSTORE"];
        
        [BTCWrapper createAccountWithBlock:mnemonicPhrase password:passWord completed:^(NSString * _Nonnull private, NSString * _Nonnull address, NSString * _Nonnull words) {
            [dic setValue:private forKey:@"BTC_PRIVATE_KEY"];
            [dic setValue:address forKey:@"BTC_ADDRESS"];
            [dic setValue:words forKey:@"BTC_PHRASE"];
            [dic setValue:@"YES" forKey:@"isMainWallet"];
            [[NSUserDefaults standardUserDefaults] setValue:walletName forKey:@"CurrentWalletName"];
            [UserConfigManager saveUserConfig:@{walletName:dic}.copy];
            complete();
        }];
    }];
    return YES;
}

/*根据私钥导入钱包*/
+ (void)importWalletWithKey:(NSString *)key pwd:(NSString *)pwd walletName:(NSString *)walletName complete:(void(^)(NSString *error))complete {
    __block NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:walletName forKey:@"walletName"];
    [dic setValue:@"" forKey:@"iconName"];
    [dic setValue:pwd forKey:@"password"];
    if([key containsString:@"0x"]) {
        /*ETH*/
        [HSEther hs_importWalletForPrivateKey:key pwd:pwd block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey, BOOL suc, HSWalletError error) {
            if (error == HSWalletImportPrivateKeySuc) {
                [dic setValue:privateKey forKey:@"ETH_PRIVATE_KEY"];
                [dic setValue:address forKey:@"ETH_ADDRESS"];
                [dic setValue:mnemonicPhrase forKey:@"ETH_PHRASE"];
                [dic setValue:keyStore forKey:@"ETH_KEYSTORE"];
                
                [BTCWrapper createAccountWithBlock:mnemonicPhrase password:pwd completed:^(NSString * _Nonnull private, NSString * _Nonnull address, NSString * _Nonnull words) {
                    [dic setValue:private forKey:@"BTC_PRIVATE_KEY"];
                    [dic setValue:address forKey:@"BTC_ADDRESS"];
                    [dic setValue:words forKey:@"BTC_PHRASE"];
                    [dic setValue:@"YES" forKey:@"isMainWallet"];
                    [[NSUserDefaults standardUserDefaults] setValue:walletName forKey:@"CurrentWalletName"];
                    [UserConfigManager saveUserConfig:@{walletName:dic}.copy];
                    complete(@"1");
                }];
            } else {
                complete(@"0");
            }
        }];
    } else {
        /*BTC*/
        [BTCWrapper importPrivateKey:key success:^(NSString * _Nonnull private, NSString * _Nonnull address) {
            [dic setValue:private forKey:@"BTC_PRIVATE_KEY"];
            [dic setValue:address forKey:@"BTC_ADDRESS"];
            [dic setValue:@"" forKey:@"BTC_PHRASE"];
            [dic setValue:@"YES" forKey:@"isMainWallet"];
            [HSEther hs_createWithPwd:pwd block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
                [dic setValue:privateKey forKey:@"ETH_PRIVATE_KEY"];
                [dic setValue:address forKey:@"ETH_ADDRESS"];
                [dic setValue:mnemonicPhrase forKey:@"ETH_PHRASE"];
                [dic setValue:keyStore forKey:@"ETH_KEYSTORE"];
                [[NSUserDefaults standardUserDefaults] setValue:walletName forKey:@"CurrentWalletName"];
                [UserConfigManager saveUserConfig:@{walletName:dic}.copy];
                complete(@"1");
            }];
        } error:^{
            complete(@"0");
        }];
    }
}

/*根据助记词导入钱包*/
+ (void)importWalletWithWord:(NSString *)word pwd:(NSString *)pwd walletName:(NSString *)walletName complete:(void(^)(NSString *error))complete {
    __block NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:walletName forKey:@"walletName"];
    [dic setValue:@"" forKey:@"iconName"];
    [dic setValue:pwd forKey:@"password"];
    [HSEther hs_inportMnemonics:word pwd:pwd block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey, BOOL suc, HSWalletError error) {
        if (error == HSWalletImportMnemonicsSuc) {
            [dic setValue:privateKey forKey:@"ETH_PRIVATE_KEY"];
            [dic setValue:address forKey:@"ETH_ADDRESS"];
            [dic setValue:mnemonicPhrase forKey:@"ETH_PHRASE"];
            [dic setValue:keyStore forKey:@"ETH_KEYSTORE"];
        
            
            [BTCWrapper createAccountWithBlock:mnemonicPhrase password:pwd completed:^(NSString * _Nonnull private, NSString * _Nonnull address, NSString * _Nonnull words) {
                [dic setValue:private forKey:@"BTC_PRIVATE_KEY"];
                [dic setValue:address forKey:@"BTC_ADDRESS"];
                [dic setValue:words forKey:@"BTC_PHRASE"];
                [dic setValue:@"YES" forKey:@"isMainWallet"];
                [[NSUserDefaults standardUserDefaults] setValue:walletName forKey:@"CurrentWalletName"];
                [UserConfigManager saveUserConfig:@{walletName:dic}.copy];
                complete(@"1");
            }];
        } else {
            complete(@"0");
        }
        
    }];
}

/**删除钱包*/
- (void)deleteWallet:(NSString *)walletName {
    [UserConfigManager removeUserConfigDicForKey:walletName];
}

/**更改钱包*/
- (void)upDateWallet:(NSString *)walletName model:(CoinWalletModel *)model {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:model.walletName forKey:@"walletName"];
    [dic setValue:model.iconName forKey:@"iconName"];
    [dic setValue:model.password forKey:@"password"];
    [dic setValue:model.eth_privateKey forKey:@"ETH_PRIVATE_KEY"];
    [dic setValue:model.eth_address forKey:@"ETH_ADDRESS"];
    [dic setValue:model.eth_phrase forKey:@"ETH_PHRASE"];
    [dic setValue:model.eth_keystore forKey:@"ETH_KEYSTORE"];
    [dic setValue:model.btc_privateKey forKey:@"BTC_PRIVATE_KEY"];
    [dic setValue:model.btc_address forKey:@"BTC_ADDRESS"];
    [dic setValue:model.btc_phrase forKey:@"BTC_PHRASE"];
    [dic setValue:model.isMainWallet forKey:@"isMainWallet"];
    if(![model.walletName isEqualToString:walletName]) {
        [UserConfigManager removeUserConfigDicForKey:walletName];
        if ([walletName isEqualToString:self.currentWalletName]) {
            self.currentWalletName = model.walletName;
        }
        walletName = model.walletName;
    }
    [UserConfigManager updataUserConfigDic:dic key:walletName];
}

- (void)updataWallet:(NSString *)walletName key:(NSString *)key value:(NSString *)value {
    NSDictionary *dic = [UserConfigManager getUserConfigDic][walletName];
    [dic setValue:value forKey:key];
    if (![dic[@"walletName"] isEqualToString:walletName]) {
        [UserConfigManager removeUserConfigDicForKey:walletName];
        if ([walletName isEqualToString:self.currentWalletName]) {
            self.currentWalletName = dic[@"walletName"];
        }
        walletName = dic[@"walletName"];
    }
    [UserConfigManager updataUserConfigDic:dic key:walletName];
}


- (void)setCurrentWalletName:(NSString *)currentWalletName {
    [[NSUserDefaults standardUserDefaults] setObject:currentWalletName forKey:@"CurrentWalletName"];
    NSMutableDictionary *dic = self.allWalletDic.mutableCopy;
    for (NSMutableDictionary *value in self.allWalletDic.allValues) {
        if ([value[@"walletName"] isEqualToString:currentWalletName]) {
            [value setValue:@"YES" forKey:@"isMainWallet"];
            [dic setValue:value forKey:currentWalletName];
        } else if ([value[@"isMainWallet"] isEqualToString:@"YES"]) {
            [value setValue:@"" forKey:@"isMainWallet"];
            [dic setValue:value forKey:value[@"walletName"]];
        }
    }
    [UserConfigManager saveUserConfig:dic];
}

- (NSDictionary *)currentWalletDic {
    NSDictionary *dic = [self allWalletDic][self.currentWalletName];
    return dic;
}

- (NSDictionary *)allWalletDic {
    return [UserConfigManager getUserConfigDic];
}

- (NSString *)currentWalletName {
    NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"CurrentWalletName"];
    return name;
}

- (CoinWalletModel *)wallentModel {
    _wallentModel = [[CoinWalletModel alloc] init];
    NSDictionary *dic = self.currentWalletDic;
    _wallentModel.walletName = dic[@"walletName"];
    _wallentModel.iconName = dic[@"iconName"];
    _wallentModel.password = dic[@"password"];
    _wallentModel.eth_privateKey = dic[@"ETH_PRIVATE_KEY"];
    _wallentModel.eth_address = dic[@"ETH_ADDRESS"];
    _wallentModel.eth_phrase = dic[@"ETH_PHRASE"];
    _wallentModel.eth_keystore = dic[@"ETH_KEYSTORE"];
    _wallentModel.btc_privateKey = dic[@"BTC_PRIVATE_KEY"];
    _wallentModel.btc_address = dic[@"BTC_ADDRESS"];
    _wallentModel.btc_phrase = dic[@"BTC_PHRASE"];
    _wallentModel.isMainWallet = dic[@"isMainWallet"];
    return _wallentModel;
}

- (CoinWalletModel *)dicChangeToCoinWalletModel:(NSDictionary *)dic {
    CoinWalletModel *model = [[CoinWalletModel alloc] init];
    model.walletName = dic[@"walletName"];
    model.iconName = dic[@"iconName"];
    model.password = dic[@"password"];
    model.eth_privateKey = dic[@"ETH_PRIVATE_KEY"];
    model.eth_address = dic[@"ETH_ADDRESS"];
    model.eth_phrase = dic[@"ETH_PHRASE"];
    model.eth_keystore = dic[@"ETH_KEYSTORE"];
    model.btc_privateKey = dic[@"BTC_PRIVATE_KEY"];
    model.btc_address = dic[@"BTC_ADDRESS"];
    model.btc_phrase = dic[@"BTC_PHRASE"];
    model.isMainWallet = dic[@"isMainWallet"];
    return model;
}

- (BOOL)hasWallet {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"CurrentWalletName"]) {
        return YES;
    }
    return NO;
}



@end
