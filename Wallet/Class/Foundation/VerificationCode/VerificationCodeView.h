//
//  VerificationCodeView.h
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol passcodeDelegate<NSObject>

-(void)returnFieldText:(NSString *)str;

@end

@interface VerificationCodeView : UIView

@property (nonatomic, copy, readonly) NSString *code;
@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *textlabel;
@property(weak)id<passcodeDelegate>delegate;
@property (nonatomic, strong) NSString *str;
@property (nonatomic, weak) UILabel *titlelabel;//标题
- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin  message:(NSString *)message title:(NSString *)title;
- (instancetype)initWithCountforCode:(NSInteger)count margin:(CGFloat)margin  message:(NSString *)message title:(NSString *)title type:(NSString *)types;
@end


NS_ASSUME_NONNULL_END
