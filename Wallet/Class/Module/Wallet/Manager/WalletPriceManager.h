//
//  WalletPriceManager.h
//  Wallet
//
//  Created by 狮子头 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WalletPriceManager : NSObject

+ (instancetype)sharedInstance;

- (void)getCoinPrice;
- (void)getCoinBalance;
- (void)getWalletInformation;
+ (void)remittanceETH:(NSString *)toAddress money:(NSString *)money keyStrore:(NSString *)keyStore pwd:(NSString *)pwd;
+ (void)remittanceBTC:(NSString *)toAddress money:(NSString *)money pwd:(NSString *)pwd;

@property (strong, nonatomic) NSString *BTCPrice; /// 当前BTC价格
@property (strong, nonatomic) NSString *ETHPrice; /// 当前ETH价格

@property (strong, nonatomic) NSString *BTCBalance; /// 当前BTC余额
@property (strong, nonatomic) NSString *ETHBalance; /// 当前ETH余额

@property (strong, nonatomic) NSString *BTCBalancePrice; ///当前BTC余额价格
@property (strong, nonatomic) NSString *ETHBalancePrice; ///当前ETH余额价格

@end

NS_ASSUME_NONNULL_END
