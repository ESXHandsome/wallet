//
//  LaunchViewModel.h
//  Wallet
//
//  Created by Ying on 2018/10/22.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LaunchViewModelDelegate <NSObject>

/**
    起始配置成功
 */
- (void)launchConfigSuccessed;
- (void)isNewUser;
- (void)isOldUser;

@end

@interface LaunchViewModel : NSObject

@property (weak, nonatomic) id<LaunchViewModelDelegate> delegate;

/**
    APP起始配置
 */
- (void)configAppLaunch;

@end

NS_ASSUME_NONNULL_END
