//
//  PurseImportWordViewController.h
//  Wallet
//
//  Created by 狮子头 on 2018/11/8.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PurseImportWordViewController : UIViewController

@property (strong, nonatomic) UILabel *tipsLabel; ///提示文字
@property (strong, nonatomic) UITextView *textView; ///输入框
@property (strong, nonatomic) UIView *textBackView; ///输入框背景
@property (strong, nonatomic) UIButton *button;  ///立即导入按钮
@property (strong, nonatomic) UILabel *tailLabel; ///什么是助词

- (void)buttonAction;
- (void)tailLabelDidClick;

@end

NS_ASSUME_NONNULL_END
