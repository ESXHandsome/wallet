//
//  ReceivablesViewController.m
//  Wallet
//  收款
//  Created by 狮子头 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "ReceivablesViewController.h"

@interface ReceivablesViewController ()

@property (strong, nonatomic) UIView *topBackView;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *addressTitle;
@property (strong, nonatomic) UIButton *button;

@end

@implementation ReceivablesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)creatUI {
    
    self.view.backgroundColor = GetColor(@"#FAFAFA");

    [self.view addSubview:self.topBackView];
    [self.topBackView addSubview:self.addressLabel];
    [self.topBackView addSubview:self.addressTitle];
    [self.view addSubview:self.button];
    
    [self.topBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(117*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(15*2));
        make.right.equalTo(self.view).mas_offset(adaptWidth750(-15*2));
        make.height.mas_equalTo(adaptHeight1334(75*2));
    }];
    
    [self.addressTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topBackView).mas_offset(adaptWidth750(20*2));
        make.centerY.equalTo(self.topBackView);
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressTitle.mas_right).mas_equalTo(adaptWidth750(10*2));
        make.centerY.equalTo(self.topBackView);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.topBackView.mas_bottom).mas_offset(adaptHeight1334(40*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
    }];
}

#pragma mark -
#pragma mark - 按钮事件

- (void)buttonAction {
    if (!self.addressLabel.text) {
        [MBProgressHUD showSuccess:@"暂无数据"];
        return;
    }
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.addressLabel.text;
    [MBProgressHUD showSuccess:@"复制成功"];
}

#pragma mark -
#pragma mark - 懒加载

- (UIView *)topBackView {
    if (!_topBackView) {
        _topBackView = [[UIView alloc] init];
        _topBackView.backgroundColor = UIColor.whiteColor;
        _topBackView.layer.cornerRadius = adaptHeight1334(8*2);
    }
    return _topBackView;
}

- (UILabel *)addressTitle {
    if (!_addressTitle) {
        _addressTitle = [[UILabel alloc] init];
        _addressTitle.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _addressTitle.textColor = GetColor(@"#999999");
        _addressTitle.text = Text(@"地址");
    }
    return _addressTitle;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _addressLabel.textColor = GetColor(@"#444444");
        _addressLabel.text = self.addressString;
    }
    return _addressLabel;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:Text(@"复制公钥") forState:normal];
        [_button setTitleColor:[UIColor colorWithString:@"#6072F5"] forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end
