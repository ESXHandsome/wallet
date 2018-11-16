//
//  WalletPriceManager.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "WalletPriceManager.h"
#import "HSEther.h"
#import "BTCWrapper.h"
#import "CoinManager.h"
#import "CoinMarketApi.h"

@implementation WalletPriceManager

+ (void)remittanceETH:(NSString *)toAddress money:(NSString *)money keyStrore:(NSString *)keyStore pwd:(NSString *)pwd {
    [HSEther hs_sendToAssress:toAddress money:money symbolETH:nil decimal:@"18" currentKeyStore:keyStore pwd:pwd block:^(NSString *hashStr, BOOL suc, HSWalletError error) {
        if (suc) {
            NSLog(@"成功");
        }
    }];
}

+ (void)remittanceBTC:(NSString *)toAddress money:(NSString *)money pwd:(NSString *)pwd {
    CoinWalletModel *model = [CoinManager sharedInstance].wallentModel;
    [BTCWrapper sendToAddress:toAddress money:money fromAddress:model.btc_address privateKey:model.btc_privateKey fee:0.0001 block:^(NSString * _Nonnull hashStr, BOOL suc) {
        if (suc) {
            NSLog(@"成功转账BTC");
        } else {
            NSLog(@"未成功转账BTC");
        }
    }];
}


+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)getWalletInformation {
    [self getCoinPrice];
    [self getCoinBalance];
}

- (void)getCoinPrice {
    
    [CoinMarketApi httpRequestToCoinMarket:BTC success:^(id responseDict) {
        NSString *price = responseDict;
        self.BTCPrice = [NSString stringWithFormat:@"%@(CNY)",price];
    } failed:^(NSInteger errorCode) {
        self.BTCPrice = @"---";
    }];
    [CoinMarketApi httpRequestToCoinMarket:ETH success:^(id responseDict) {
        self.ETHPrice = [NSString stringWithFormat:@"%@(CNY)",responseDict];;
    
    } failed:^(NSInteger errorCode) {
        self.BTCPrice = @"---";
    }];
}

- (void)getCoinBalance {
    [BTCWrapper getBalanceWithAddress:[CoinManager sharedInstance].wallentModel.btc_address block:^(NSDictionary * _Nonnull dict, BOOL suc) {
        NSString *string = [CoinManager sharedInstance].wallentModel.btc_address;
        NSDictionary *dic = [dict objectForKey:string];
        NSString *balance = dic[@"final_balance"];
        if (!balance) return ;
        self.BTCBalance = [NSString stringWithFormat:@"%.5f",balance.floatValue * 0.00000001];
    }];
    
    [HSEther hs_getBalanceWithTokens:@[] withAddress:[CoinManager sharedInstance].wallentModel.eth_address block:^(NSArray *arrayBanlance, BOOL suc) {
        NSString *balance = arrayBanlance.firstObject;
        self.ETHBalance = [NSString stringWithFormat:@"%.5f",balance.floatValue * 0.00000001];
    }];
}

- (void)setBTCPrice:(NSString *)BTCPrice {
    if (![BTCPrice isEqualToString:_BTCPrice]) {
        _BTCPrice = BTCPrice;
        if (!_BTCBalance) return;
        float price = _BTCPrice.floatValue * _BTCBalance.floatValue;
        _BTCBalancePrice = [NSString stringWithFormat:@"%.5f",price];
    }
}

- (void)setETHPrice:(NSString *)ETHPrice {
    if (![ETHPrice isEqualToString:_ETHPrice]) {
        _ETHPrice = ETHPrice;
        if (!_ETHBalance) return;
        float price = _ETHPrice.floatValue * _ETHBalance.floatValue;
        _ETHBalancePrice = [NSString stringWithFormat:@"%.5f",price];
    }
}

- (void)setBTCBalance:(NSString *)BTCBalance {
    if (![BTCBalance isEqualToString:_BTCBalance]) {
        _BTCBalance = BTCBalance;
        if (!_BTCPrice) return;
        float price = _BTCPrice.floatValue * _BTCBalance.floatValue;
        self.BTCBalancePrice = [NSString stringWithFormat:@"%.5f",price];
    }
}

- (void)setETHBalance:(NSString *)ETHBalance {
    if (![ETHBalance isEqualToString:_ETHBalance]) {
        _ETHBalance = ETHBalance;
        if (!_ETHPrice) return;
        float price = _ETHPrice.floatValue * _ETHBalance.floatValue;
        self.ETHBalancePrice = [NSString stringWithFormat:@"%.5f",price];
    }
}

@end
