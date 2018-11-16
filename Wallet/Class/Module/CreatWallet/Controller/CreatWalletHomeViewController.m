//
//  CreatWalletHomeViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/26.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "CreatWalletHomeViewController.h"
#import "CreatWalletHomeButton.h"
#import "PrivacyClauseLabel.h"
#import "CreatWalletViewController.h"
#import "ImportValletViewController.h"
#import "PrivacyClauseViewController.h"
#import "PurseImportHomeViewController.h"

@interface CreatWalletHomeViewController ()

@property (strong, nonatomic) CreatWalletHomeButton *creatButton;
@property (strong, nonatomic) CreatWalletHomeButton *importButton;
@property (strong, nonatomic) PrivacyClauseLabel *privacylabel;
@property (strong, nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIImageView *iconImageView;

@end

@implementation CreatWalletHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)configUI {
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.creatButton];
    [self.view addSubview:self.importButton];
    [self.view addSubview:self.privacylabel];
    [self.view addSubview:self.iconImageView];
    
    [self.creatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(274*2));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(394*2));
    }];
    
    [self.importButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(274*2));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.creatButton.mas_bottom).mas_offset(adaptHeight1334(24*2));
    }];
    
    [self.privacylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(-adaptHeight1334(18*2));
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(50*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(20*2));
        make.height.mas_equalTo(adaptHeight1334(20*2));
        make.width.mas_equalTo(adaptWidth750(18*2));
    }];
}

- (void)CreatButtonAction:(UIButton *)sender {
    sender.selected = NO;
    self.title = ZBLocalized(@"CreateWallet.text");
    [self.navigationController pushViewController:CreatWalletViewController.new animated:YES];
}

- (void)ImportButtonAction:(UIButton *)sender {
    sender.selected = NO;
    self.title = ZBLocalized(@"ImportWallet.text");
    [self.navigationController pushViewController:PurseImportHomeViewController.new animated:YES];
}

- (void)Tap:(id)sender {
    self.title = ZBLocalized(@"CreateWallet.text");
    [self.navigationController pushViewController:PrivacyClauseViewController.new animated:YES];
}


- (CreatWalletHomeButton *)creatButton {
    if (!_creatButton) {
        _creatButton = [[CreatWalletHomeButton alloc] init];
        [_creatButton setTitle:ZBLocalized(@"CreateWallet.text") forState:normal];
        [_creatButton addTarget:self action:@selector(CreatButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _creatButton;
}

- (CreatWalletHomeButton *)importButton {
    if (!_importButton) {
        _importButton = [[CreatWalletHomeButton alloc] init];
        [_importButton setTitle:ZBLocalized(@"ImportWallet.text") forState:normal];
        [_importButton addTarget:self action:@selector(ImportButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _importButton;
}

- (PrivacyClauseLabel *)privacylabel {
    if (!_privacylabel) {
        _privacylabel = [[PrivacyClauseLabel alloc] init];
        _privacylabel.text = ZBLocalized(@"Privacy.text");
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tap:)];
        [_privacylabel addGestureRecognizer:tap];
    }
    return _privacylabel;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithImage:GetImage(@"create_home_bg")];
        _bgImageView.frame = self.view.bounds;
    }
    return _bgImageView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:GetImage(@"logo")];
    }
    return _iconImageView;
}

@end
