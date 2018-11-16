//
//  PurseImportHomeViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/8.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseImportHomeViewController.h"
#import "PurseImportWordViewController.h"
#import "PurseImportListViewController.h"

@interface PurseImportHomeViewController ()

@property (strong, nonatomic) UIButton *importWordButton;
@property (strong, nonatomic) UIButton *importKeyButton;
@property (strong, nonatomic) UILabel *titleLable;

@end

@implementation PurseImportHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

- (void)creatUI {
    self.view.backgroundColor = GetColor(@"#FAFAFA");
    
    [self.view addSubview:self.titleLable];
    [self.view addSubview:self.importWordButton];
    [self.view addSubview:self.importKeyButton];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(92.5*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(22*2));
    }];
    
    [self.importWordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable.mas_bottom).mas_offset(adaptHeight1334(9.5*2));
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
    
    [self.importKeyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.importWordButton.mas_bottom).mas_offset(adaptHeight1334(20*2));
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
}

- (void)importWordButtonAction {
    PurseImportWordViewController *controller = [[PurseImportWordViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)importKeyButtonAction {
    PurseImportListViewController *controller = [[PurseImportListViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _titleLable.textColor = GetColor(@"#999999");
        _titleLable.text = Text(@"请选择导入类型");
    }
    return _titleLable;
    
}

- (UIButton *)importWordButton {
    if (!_importWordButton) {
        _importWordButton = [[UIButton alloc] init];
        [_importWordButton setTitle:Text(@"导入助记词") forState:normal];
        [_importWordButton setTitleColor:[UIColor colorWithString:@"#44C9F9"] forState:UIControlStateNormal];
        [_importWordButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        _importWordButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_importWordButton addTarget:self action:@selector(importWordButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _importWordButton;
}

- (UIButton *)importKeyButton {
    if (!_importKeyButton) {
        _importKeyButton = [[UIButton alloc] init];
        [_importKeyButton setTitle:Text(@"导入私钥") forState:normal];
        [_importKeyButton setTitleColor:[UIColor colorWithString:@"#44C9F9"] forState:UIControlStateNormal];
        [_importKeyButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        _importKeyButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_importKeyButton addTarget:self action:@selector(importKeyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _importKeyButton;
}



@end
