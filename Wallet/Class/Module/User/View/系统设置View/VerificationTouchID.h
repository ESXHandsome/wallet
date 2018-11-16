//
//  VerificationTouchID.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ButtonAbnormal) {
    AlertLeftButton = 0,
    AlertRightButton
};


#pragma mark - 协议

@class VerificationTouchID;

@protocol VerificationTouchIDDelegate <NSObject>

- (void)declareAbnormalAlertView:(VerificationTouchID *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface VerificationTouchID : UIView
@property (nonatomic,weak) id<VerificationTouchIDDelegate> delegate;
- (instancetype)initWithTitle:(NSString *)title delegate:(id)delegate;

/** show出这个弹窗 */
- (void)show;

@end

NS_ASSUME_NONNULL_END
