//
//  RemittanceViewController.m
//  Wallet
//  转账界面
//  Created by 狮子头 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "RemittanceViewController.h"
#import "WalletPriceManager.h"
#import "CoinManager.h"

@interface RemittanceViewController ()

@property (strong, nonatomic) UILabel *blanceLabel;

@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *coinLabel;
@property (strong, nonatomic) UILabel *chargesLabel;

@property (strong, nonatomic) UITextField *addressTextView;
@property (strong, nonatomic) UITextField *coinTextView;
@property (strong, nonatomic) UILabel *chargesContentLabel;

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) WalletPriceManager *manager;

@end

@implementation RemittanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatUI];
}

- (void)loadMarketPrice {
    
    self.manager = [WalletPriceManager sharedInstance];
    [self.manager addObserver:self forKeyPath:@"BTCBalance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"ETHBalance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"BTCBalance"] && [self.type isEqualToString:@"BTC"]) {
        self.blanceLabel.text = [NSString stringWithFormat:@"%@(%@)", self.manager.BTCBalance, self.type];
    }
    if ([keyPath isEqualToString:@"ETHBalance"] && [self.type isEqualToString:@"ETH"]) {
        self.blanceLabel.text = [NSString stringWithFormat:@"%@(%@)", self.manager.ETHBalance, self.type];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)creatUI {
    
    self.view.backgroundColor = GetColor(@"#FAFAFA");
    
    [self.view addSubview:self.backView];
    [self.view addSubview:self.button];
    [self.view addSubview:self.blanceLabel];
    [self.backView addSubview:self.addressLabel];
    [self.backView addSubview:self.coinLabel];
    [self.backView addSubview:self.addressTextView];
    [self.backView addSubview:self.coinTextView];
    [self.backView addSubview:self.chargesContentLabel];
    [self.backView addSubview:self.chargesLabel];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(117*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(15*2));
        make.right.equalTo(self.view).mas_offset(adaptWidth750(-15*2));
        make.height.mas_equalTo(adaptHeight1334(225*2));
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.mas_bottom).mas_offset(adaptHeight1334(41*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(27*2));
        make.right.equalTo(self.view).mas_offset(adaptWidth750(-27*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
    }];
    
    [self.blanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(adaptHeight1334(83*2));
        make.centerX.equalTo(self.view);
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).mas_offset(adaptHeight1334(34*2));
        make.left.equalTo(self.backView).mas_equalTo(adaptWidth750(20*2));
    }];
    
    [self.coinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressLabel.mas_bottom).mas_offset(adaptHeight1334(58.5*2));
        make.left.equalTo(self.addressLabel);
    }];
    
    [self.chargesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coinLabel.mas_bottom).mas_offset(adaptHeight1334(58.5*2));
        make.left.equalTo(self.coinLabel);
    }];
    
    [self.chargesContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chargesLabel);
        make.left.equalTo(self.chargesLabel.mas_right).mas_offset(adaptWidth750(29*2));
    }];
    
    [self.addressTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressLabel);
        make.left.equalTo(self.chargesContentLabel);
        make.width.mas_equalTo(adaptWidth750(246*2));
    }];
    
    [self.coinTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coinLabel);
        make.left.equalTo(self.chargesContentLabel);
        make.width.mas_equalTo(adaptWidth750(246*2));
    }];
    
    UIView *lineTop = [[UIView alloc] init];
    UIView *lineBottom = [[UIView alloc] init];
    lineTop.backgroundColor = GetColor(@"#E9E9E9");
    lineBottom.backgroundColor = GetColor(@"#E9E9E9");
    
    [self.backView addSubview:lineTop];
    [self.backView addSubview:lineBottom];
    
    [lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).mas_offset(adaptHeight1334(75*2));
        make.left.equalTo(self.backView).mas_offset(adaptWidth750(13*2));
        make.right.equalTo(self.backView).mas_equalTo(adaptWidth750(-13*2));
        make.height.mas_equalTo(0.5);
    }];
    
    [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).mas_offset(adaptHeight1334(150*2));
        make.left.equalTo(self.backView).mas_offset(adaptWidth750(13*2));
        make.right.equalTo(self.backView).mas_equalTo(adaptWidth750(-13*2));
        make.height.mas_equalTo(0.5);
    }];
    
    self.blanceLabel.text = self.coinSting;
}

- (void)buttonAction {

    if ([self.addressTextView.text isEqualToString:@""]) {
        [MBProgressHUD showSuccess:@"请输入地址"];
        return;
    }
    if ([self.coinTextView.text isEqualToString:@""]) {
        [MBProgressHUD showSuccess:@"请输入金额"];
        return;
    }
    if (self.coinTextView.text.floatValue >  self.blanceLabel.text.floatValue) {
        [MBProgressHUD showSuccess:@"余额不足"];
        return;
    }
    if ([self.type isEqualToString:@"BTC"]) {
        [WalletPriceManager remittanceBTC:self.addressTextView.text money:self.coinTextView.text pwd:@"111111"];
        
    } else {
        CoinWalletModel *model = [CoinManager sharedInstance].wallentModel;
        [WalletPriceManager remittanceETH:self.addressTextView.text money:self.coinTextView.text keyStrore:model.eth_keystore pwd:model.password];
    }
}

#pragma mark -
#pragma mark - 懒加载

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = UIColor.whiteColor;
        _backView.layer.cornerRadius = adaptHeight1334(8*2);
        _backView.layer.masksToBounds = YES;
    }
    return _backView;
}

- (UILabel *)blanceLabel {
    if (!_blanceLabel) {
        _blanceLabel = [[UILabel alloc] init];
        _blanceLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _blanceLabel.textColor = GetColor(@"#444444");
        _blanceLabel.text = Text(@"余额 ----");
    }
    return _blanceLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _addressLabel.textColor = GetColor(@"#999999");
        _addressLabel.text = Text(@"地址");
    }
    return _addressLabel;
}

- (UILabel *)coinLabel {
    if (!_coinLabel) {
        _coinLabel = [[UILabel alloc] init];
        _coinLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _coinLabel.textColor = GetColor(@"#999999");
        _coinLabel.text = Text(@"金额");
    }
    return _coinLabel;
}

- (UILabel *)chargesLabel {
    if (!_chargesLabel) {
        _chargesLabel = [[UILabel alloc] init];
        _chargesLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _chargesLabel.textColor = GetColor(@"#999999");
        _chargesLabel.text = Text(@"手续费");
    }
    return _chargesLabel;
}

- (UILabel *)chargesContentLabel {
    if (!_chargesContentLabel) {
        _chargesContentLabel = [[UILabel alloc] init];
        _chargesContentLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _chargesContentLabel.textColor = GetColor(@"#444444");
        _chargesContentLabel.text = Text(@"根据最新标准扣除手续费");
    }
    return _chargesContentLabel;
}

- (UITextField *)addressTextView {
    if (!_addressTextView) {
        _addressTextView = [[UITextField alloc] init];
        _addressTextView.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _addressTextView.textColor = GetColor(@"#444444");
        _addressTextView.placeholder = Text(@"请输入转账地址");
    }
    return _addressTextView;
}

- (UITextField *)coinTextView {
    if (!_coinTextView) {
        _coinTextView = [[UITextField alloc] init];
        _coinTextView.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _coinTextView.textColor = GetColor(@"#444444");
        _coinTextView.placeholder = Text(@"请输入转账金额");
    }
    return _coinTextView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:Text(@"下一步") forState:normal];
        [_button setTitleColor:[UIColor colorWithString:@"#6072F5"] forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
