//
//  WLNYingSunView.h
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNYingSunView : FlexCustomBaseView

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UITextField *txt;
@property (nonatomic, assign) NSInteger yingsunTag; //1止盈,2 止损

@property (nonatomic, strong) UIView *zhiyingView;
@property (nonatomic, strong) UIView *zhisunView;


@property (nonatomic, strong) void (^didDoneBlock)(NSInteger yingsunTag,NSString* num);

- (void)show;

+ (instancetype)shared;



@end

NS_ASSUME_NONNULL_END
