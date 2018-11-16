//
//  PurseForgotPwdViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseForgotPwdViewController.h"

@interface PurseForgotPwdViewController ()


@property (strong, nonatomic) UILabel *textLabel; ///内容输入框
@property (strong, nonatomic) UIButton *backupButton; ///返回按钮
@property (strong, nonatomic) UIView *textBackgroundView; ///输入框背景图

@end

@implementation PurseForgotPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

#pragma mark -
#pragma mark - Private method

- (void)creatUI {
   
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.textBackgroundView];
    [self.textBackgroundView addSubview:self.textLabel];
    [self.view addSubview:self.backupButton];
    
    [self.textBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(90.5*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(15*2));
        make.height.mas_equalTo(adaptHeight1334(116*2));
        make.width.mas_equalTo(adaptWidth750(346*2));
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textBackgroundView).mas_offset(adaptHeight1334(11.5*2));
        make.left.equalTo(self.textBackgroundView).mas_offset(adaptWidth750(23*2));
        make.width.mas_equalTo(adaptWidth750(299*2));
    }];
    
    [self.backupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textLabel.mas_bottom).mas_equalTo(adaptHeight1334(36*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
}

#pragma mark -
#pragma mark - Action

- (void)backupButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark - Lazy load

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        NSString *testString = @"Drips不储存用户密码，无法提供找回或重制功能。\n如果忘记密码，用户只能通过自己备份的钱包助记词或私钥，重新导入后设置新密码。\n注意！删除钱包前，请务必确认已备份好钱包助记词或私钥，否则将丢失您的钱包资产。";
        _textLabel.textColor = GetColor(@"#4E637B");
        _textLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _textLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:adaptFontSize(10)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_textLabel setAttributedText:setString];
    }
    return _textLabel;
}

- (UIView *)textBackgroundView {
    if (!_textBackgroundView) {
        _textBackgroundView = [[UIView alloc] init];
        _textBackgroundView.backgroundColor = [GetColor(@"#7CC1FF") colorWithAlphaComponent:0.1];
    }
    return _textBackgroundView;
}

- (UIButton *)backupButton {
    if (!_backupButton) {
        _backupButton = [[UIButton alloc] init];
        [_backupButton setTitle:@"知道了，返回" forState:normal];
        [_backupButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_backupButton addTarget:self action:@selector(backupButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _backupButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_backupButton setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _backupButton;
}

@end
