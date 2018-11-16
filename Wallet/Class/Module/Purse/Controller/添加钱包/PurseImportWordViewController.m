//
//  PurseImportWordViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/8.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseImportWordViewController.h"
#import "CreatWalletViewController.h"
#import "ImportWalletManager.h"
#import <ethers/Account.h>

@interface PurseImportWordViewController ()

@end

@implementation PurseImportWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatUI];
}

- (void)creatUI {
    self.view.backgroundColor = GetColor(@"#FAFAFA");
    
    [self.view addSubview:self.tipsLabel];
    [self.view addSubview:self.textBackView];
    [self.textBackView addSubview:self.textView];
    [self.view addSubview:self.button];
    [self.view addSubview:self.tailLabel];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(87*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(32*2));
        make.width.mas_equalTo(adaptWidth750(311*2));
    }];
    
    [self.textBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipsLabel.mas_bottom).mas_offset(adaptHeight1334(18*2));
        make.left.equalTo(self.view).mas_equalTo(adaptWidth750(17*2));
        make.height.mas_equalTo(adaptHeight1334(134*2));
        make.width.mas_equalTo(adaptWidth750(342*2));
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textBackView).mas_offset(adaptHeight1334(18*2));
        make.left.equalTo(self.textBackView).mas_equalTo(adaptWidth750(28*2));
        make.bottom.equalTo(self.textBackView).mas_equalTo(-adaptHeight1334(18*2));
        make.right.equalTo(self.textBackView).mas_equalTo(-adaptWidth750(28*2));
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textBackView.mas_bottom).mas_offset(adaptHeight1334(36*2));
        make.left.equalTo(self.view).mas_equalTo(adaptWidth750(27*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
    }];
    
    [self.tailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).mas_offset(-adaptHeight1334(18*2));
    }];
}

#pragma mark -
#pragma mark - 点击事件

- (void)buttonAction {
    NSString *word = self.textView.text;
    if (word.length < 1) {
        [self showAlet:@"助记词不能为空"];
        return;
    }
    NSArray *words = [word componentsSeparatedByString:@" "];
    if (words.count != 12) {
        [self showAlet:@"助词个数不对"];
        return;
    }
    
    for (NSString *m in words) {
        if (![Account isValidMnemonicWord:m]) {
            NSString *msg = [NSString stringWithFormat:@"助记词 %@ 有误",m];
            [self showAlet:msg];
            return;
        }     
    }
    
    CreatWalletViewController *controller = [[CreatWalletViewController alloc] init];
    controller.isImportWord = YES;
    [ImportWalletManager sharedInstance].phrase = self.textView.text;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)tailLabelDidClick {
    
}

- (void)showAlet:(NSString *)message {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:Text(@"错误") message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:Text(@"确定") style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:action];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark -
#pragma mark - 懒加载

- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _tipsLabel.textColor = GetColor(@"#444444");
        _tipsLabel.text = Text(@"请输入备份的钱包助记词（12个英文单词），按空格分隔");
        _tipsLabel.numberOfLines = 0;
    }
    return _tipsLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:adaptFontSize(16*2)];
        _textView.textColor = GetColor(@"#444444");
    }
    return _textView;
}

- (UIView *)textBackView {
    if (!_textBackView) {
        _textBackView = [[UIView alloc] init];
        _textBackView.backgroundColor = GetColor(@"#FFFFFF");
    }
    return _textBackView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:Text(@"立即导入") forState:normal];
        [_button setTitleColor:GetColor(@"#6072F5") forState:normal];
        [_button setBackgroundImage:GetImage(@"") forState:normal];
        [_button setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UILabel *)tailLabel {
    if (!_tailLabel) {
        _tailLabel = [[UILabel alloc] init];
        _tailLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _tailLabel.textColor = GetColor(@"#6072F5");
        _tailLabel.text = Text(@"什么是助记词");
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tailLabelDidClick)];
        _tailLabel.userInteractionEnabled = YES;
        [_tailLabel addGestureRecognizer:tap];
    }
    return _tailLabel;
}

@end
