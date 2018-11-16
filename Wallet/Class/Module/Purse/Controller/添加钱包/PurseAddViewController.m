//
//  PurseAddViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseAddViewController.h"
#import "CreatWalletViewController.h"
#import "PurseImportHomeViewController.h"

@interface PurseAddViewController ()

@property (strong, nonatomic) UIButton *creatButton;
@property (strong, nonatomic) UIButton *importButton;
@property (strong, nonatomic) UILabel *titleLable;

@end

@implementation PurseAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

- (void)creatUI {
    self.view.backgroundColor = GetColor(@"#FAFAFA");
    
    [self.view addSubview:self.titleLable];
    [self.view addSubview:self.creatButton];
    [self.view addSubview:self.importButton];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(92.5*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(22*2));
    }];
    
    [self.creatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable.mas_bottom).mas_offset(adaptHeight1334(9.5*2));
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
    
    [self.importButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.creatButton.mas_bottom).mas_offset(adaptHeight1334(20*2));
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
}

- (void)creatButtonAction {
    [self.navigationController pushViewController:CreatWalletViewController.new animated:YES];
}

- (void)importButtonAction {
    [self.navigationController pushViewController:PurseImportHomeViewController.new animated:YES];
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _titleLable.textColor = GetColor(@"#999999");
        _titleLable.text = Text(@"请选择添加类型");
    }
    return _titleLable;

}

- (UIButton *)creatButton {
    if (!_creatButton) {
        _creatButton = [[UIButton alloc] init];
        [_creatButton setTitle:Text(@"创建钱包") forState:normal];
        [_creatButton setTitleColor:[UIColor colorWithString:@"#44C9F9"] forState:UIControlStateNormal];
        [_creatButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        _creatButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_creatButton addTarget:self action:@selector(creatButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _creatButton;
}

- (UIButton *)importButton {
    if (!_importButton) {
        _importButton = [[UIButton alloc] init];
        [_importButton setTitle:Text(@"导入钱包") forState:normal];
        [_importButton setTitleColor:[UIColor colorWithString:@"#44C9F9"] forState:UIControlStateNormal];
        [_importButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        _importButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_importButton addTarget:self action:@selector(importButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _importButton;
}


@end
