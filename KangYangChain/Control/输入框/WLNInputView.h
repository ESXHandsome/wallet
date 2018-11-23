//
//  WLNInputView.h
//  KangYangChain
//
//  Created by edz on 2018/11/8.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNInputView : FlexCustomBaseView<UITextViewDelegate>


@property (nonatomic, assign) CGRect startRect;

@property (nonatomic, strong) UITextView *inputTxt;

@property (nonatomic, strong) void (^didInputStr)(NSString *str);

@property (nonatomic, strong) UIView *backView;



@end

NS_ASSUME_NONNULL_END
