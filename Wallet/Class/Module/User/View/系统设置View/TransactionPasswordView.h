//
//  TransactionPasswordView.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, AbnormalButton) {
    AlertButtonLeft = 0,
    AlertButtonRight
};


#pragma mark - 协议

@class TransactionPasswordView;

@protocol TransactionPasswordViewDelegate <NSObject>

- (void)declareAbnormalAlertView:(TransactionPasswordView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface TransactionPasswordView : UIView
@property (nonatomic,weak) id<TransactionPasswordViewDelegate> delegate;
- (instancetype)initWithTitle:(NSString *)title delegate:(id)delegate;
- (void)cancelButtonClicked;
/** show出这个弹窗 */
- (void)show;
-(void)dismiss;

@end

NS_ASSUME_NONNULL_END
