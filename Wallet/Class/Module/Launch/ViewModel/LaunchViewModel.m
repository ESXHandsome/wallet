//
//  LaunchViewModel.m
//  Wallet
//
//  Created by Ying on 2018/10/22.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "LaunchViewModel.h"
#import "HSEther.h"
#import "BTCWrapper.h"
#import "UserConfigManager.h"
#import "CoinManager.h"

@interface LaunchViewModel ()

@end

@implementation LaunchViewModel

- (void)configAppLaunch {
    /**启动配置逻辑,写在这里*/
    CoinManager *manager = [CoinManager sharedInstance];
    if (manager.hasWallet) {
        /**不是新用户*/
        [self.delegate isOldUser];
    } else {
        /**是新用户*/
        [self.delegate isNewUser];
    }

}


@end
