//
//  PurseChangeWalletNameViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseChangeWalletNameViewController.h"

@interface PurseChangeWalletNameViewController ()

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIButton *button;

@end

@implementation PurseChangeWalletNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

- (void)creatUI {
    self.view.backgroundColor = GetColor(@"#FAFAFA");
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(74*2));
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(adaptHeight1334(54*2));
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom).mas_offset(adaptHeight1334(54*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(27*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
}

- (void)buttonAction {
    if (self.textField.text.length == 0) {
        [MBProgressHUD showError:@"钱包名不能为空"];
        return;
    }
    if (self.textField.text.length > 15) {
        [MBProgressHUD showError:@"名称过长，请控制在15个字符"];
        return;
    }
    NSString *oldWalletName = self.model.walletName;
    self.model.walletName = self.textField.text;
    [[CoinManager sharedInstance] upDateWallet:oldWalletName model:self.model];
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate finishChangeWalletName];
}

-(UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.placeholder = self.model.walletName;
        _textField.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        //设置左边视图的宽度(占位)
        _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, adaptWidth750(20*2), 0)];
        //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.backgroundColor =[ UIColor colorWithString:@"#FFFFFF"];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textField;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:Text(@"确认") forState:normal];
        [_button setBackgroundImage:GetImage(@"rectangleclick") forState:normal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_button setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _button;
}

@end
