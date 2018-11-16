//
//  SetTouchID.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoinManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface SetTouchID : NSObject

@property (strong, nonatomic) CoinWalletModel *model;
+ (instancetype)sharedInstance;
-(void)initOpenTouchID ;
@end

NS_ASSUME_NONNULL_END
