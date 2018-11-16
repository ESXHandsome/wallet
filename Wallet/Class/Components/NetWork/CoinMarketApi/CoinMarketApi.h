//
//  CoinMarketApi.h
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNetApi.h"

typedef enum : NSUInteger {
    BTC ,
    ETH
} CoinType;


NS_ASSUME_NONNULL_BEGIN

@interface CoinMarketApi : BaseNetApi

+ (void)httpRequestToCoinMarket:(CoinType)type
                        success:(SuccessBlock)success
                         failed:(FailureBlock)failed;

@end

NS_ASSUME_NONNULL_END
