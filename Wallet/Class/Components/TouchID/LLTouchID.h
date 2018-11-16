//
//  LLTouchID.h
//  Wallet
//
//  Created by Ying on 2018/10/25.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLTouchID : NSObject

+ (void)validateTouchID;

@end

UIKIT_EXTERN NSString *const LLValidateTouchIDSuccess; ///验证成功
UIKIT_EXTERN NSString *const LLValidateTouchIDCancel; ///验证失败
UIKIT_EXTERN NSString *const LLValidateTouchIDInputPassword; ///输入密码
UIKIT_EXTERN NSString *const LLValidateTouchIDFailed; ///验证失败
UIKIT_EXTERN NSString *const LLValidateTouchIDNoAvailabel; ///设备不可用
UIKIT_EXTERN NSString *const LLValidateTouchIDNoEnrolled; ///没设置指纹
UIKIT_EXTERN NSString *const LLValidateTouchIDNoPasswordSet; ///没设置密码
UIKIT_EXTERN NSString *const LLValidateTouchIDLockout; ///设备锁屏

NS_ASSUME_NONNULL_END
