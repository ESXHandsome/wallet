//
//  RemittanceHomeViewController.m
//  Wallet
//  转账首页
//  Created by 狮子头 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "RemittanceHomeViewController.h"
#import "RemittanceViewController.h"
#import "ReceivablesViewController.h"
#import "WalletPriceManager.h"

@interface RemittanceHomeViewController ()

@property (strong, nonatomic) UIView *topBackView;          ///头部底层视图
@property (strong, nonatomic) UIView *bottomBackView;       ///底层底部视图
@property (strong, nonatomic) UIImageView *iconImageView;   ///货币图标
@property (strong, nonatomic) UILabel *blanceLabel;         ///余额
@property (strong, nonatomic) UILabel *coinBlanceLabel;     ///货币余额
@property (strong, nonatomic) UILabel *transactionRecord;   ///交易记录
@property (strong, nonatomic) UILabel *tipLable;            ///暂无交易提示
@property (strong, nonatomic) UIButton *remittanceButton;   ///转账按钮
@property (strong, nonatomic) UIButton *receivablesButton;  ///收款按钮
@property (strong, nonatomic) WalletPriceManager *manager;

@end

@implementation RemittanceHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self creatUI];
    [self loadMarketPrice];
}

- (void)loadMarketPrice {
    self.manager = [WalletPriceManager sharedInstance];
    [self.manager addObserver:self forKeyPath:@"BTCBalance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"ETHBalance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"BTCBalancePrice" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"ETHBalancePrice" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    if ([keyPath isEqualToString:@"ETHBalance"] && [self.type isEqualToString:@"ETH"]) {
        self.blanceLabel.text = self.manager.ETHBalance;
    }
    if ([keyPath isEqualToString:@"BTCBalance"] && [self.type isEqualToString:@"BTC"]) {
        self.blanceLabel.text = self.manager.BTCBalance;
    }
    if ([keyPath isEqualToString:@"ETHBalancePrice"] && [self.type isEqualToString:@"ETH"]) {
        self.coinBlanceLabel.text = self.manager.ETHBalancePrice;
    }
    if ([keyPath isEqualToString:@"BTCBalancePrice"] && [self.type isEqualToString:@"BTC"]) {
        self.coinBlanceLabel.text = self.manager.BTCBalancePrice;
    }
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
    [self.view addSubview:self.bottomBackView];
    [self.topBackView addSubview:self.iconImageView];
    [self.topBackView addSubview:self.coinBlanceLabel];
    [self.topBackView addSubview:self.blanceLabel];
    [self.bottomBackView addSubview:self.transactionRecord];
    [self.bottomBackView addSubview:self.tipLable];
    [self.view addSubview:self.remittanceButton];
    [self.view addSubview:self.receivablesButton];
    
    [self.topBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(NAVIGATION_BAR_HEIGHT);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(adaptHeight1334(140*2));
    }];
    
    [self.bottomBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topBackView.mas_bottom).mas_offset(adaptHeight1334(10.5*2));
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(adaptHeight1334(-52*2));
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topBackView).mas_offset(adaptHeight1334(26.5*2));
        make.centerX.equalTo(self.topBackView);
        make.width.mas_equalTo(adaptWidth750(48*2));
        make.height.mas_equalTo(adaptHeight1334(48*2));
    }];
    
    [self.coinBlanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).mas_offset(adaptHeight1334(7*2));
        make.centerX.equalTo(self.topBackView);
    }];
    
    [self.blanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coinBlanceLabel.mas_bottom).mas_offset(adaptHeight1334(2*2));
        make.centerX.equalTo(self.topBackView);
    }];
    
    [self.transactionRecord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomBackView).mas_offset(adaptHeight1334(14.5*2));
        make.left.equalTo(self.bottomBackView).mas_offset(adaptWidth750(20*2));
    }];
    
    [self.tipLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomBackView).mas_offset(adaptHeight1334(57.5*2));
        make.centerX.equalTo(self.bottomBackView);
    }];
    
    [self.remittanceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomBackView.mas_bottom);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    [self.receivablesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomBackView.mas_bottom);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    self.iconImageView.image = self.image;
    self.coinBlanceLabel.text = [NSString stringWithFormat:@"%@(%@)",self.coinString, self.type];
    self.blanceLabel.text = self.priceString;
}

#pragma mark -
#pragma mark - 按钮点击事件

- (void)remittanceButtonAction {
    RemittanceViewController *controller = [[RemittanceViewController alloc] init];
    controller.coinSting = self.coinBlanceLabel.text;
    controller.type = self.type;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)receiveablesButtonAction {
    ReceivablesViewController *controller = [[ReceivablesViewController alloc] init];
    controller.addressString = self.addressString;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark - 懒加载

- (UIView *)topBackView {
    if (!_topBackView) {
        _topBackView = [[UIView alloc] init];
        _topBackView.backgroundColor = UIColor.whiteColor;
    }
    return _topBackView;
}

- (UIView *)bottomBackView {
    if (!_bottomBackView) {
        _bottomBackView = [[UIView alloc] init];
        _bottomBackView.backgroundColor = UIColor.whiteColor;
    }
    return _bottomBackView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = adaptHeight1334(48);
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.backgroundColor = GetColor(@"#FAFAFA");
    }
    return _iconImageView;
}

- (UILabel *)coinBlanceLabel {
    if (!_coinBlanceLabel) {
        _coinBlanceLabel = [[UILabel alloc] init];
        _coinBlanceLabel.font = [UIFont systemFontOfSize:adaptFontSize(16*2)];
        _coinBlanceLabel.textColor = UIColor.blackColor;
        _coinBlanceLabel.text = @"--";
    }
    return _coinBlanceLabel;
}

- (UILabel *)blanceLabel {
    if (!_blanceLabel) {
        _blanceLabel = [[UILabel alloc] init];
        _blanceLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _blanceLabel.textColor = GetColor(@"#444444");
        _blanceLabel.text = @"--";
    }
    return _blanceLabel;
}

- (UILabel *)transactionRecord {
    if (!_transactionRecord) {
        _transactionRecord = [[UILabel alloc] init];
        _transactionRecord.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _transactionRecord.textColor = GetColor(@"#444444");
        _transactionRecord.text = Text(@"交易记录");
    }
    return _transactionRecord;
}

- (UILabel *)tipLable {
    if (!_tipLable) {
        _tipLable = [[UILabel alloc] init];
        _tipLable.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _tipLable.textColor = GetColor(@"#999999");
        _tipLable.text = Text(@"暂无记录");
    }
    return _tipLable;
}

- (UIButton *)remittanceButton {
    if (!_remittanceButton) {
        _remittanceButton = [[UIButton alloc] init];
        [_remittanceButton setBackgroundImage:GetImage(@"转账Button") forState:normal];;
        [_remittanceButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -_remittanceButton.imageView.bounds.size.width + adaptWidth750(15), 0, _remittanceButton.imageView.bounds.size.width)];
        [_remittanceButton setTitle:Text(@"转账") forState:normal];
        _remittanceButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_remittanceButton setImage:GetImage(@"转账icon") forState:normal];
        [_remittanceButton addTarget:self action:@selector(remittanceButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _remittanceButton;
}

- (UIButton *)receivablesButton {
    if (!_receivablesButton) {
        _receivablesButton = [[UIButton alloc] init];
        [_receivablesButton setBackgroundImage:GetImage(@"收款Button") forState:normal];
        [_receivablesButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -_receivablesButton.imageView.bounds.size.width + adaptWidth750(15), 0, _receivablesButton.imageView.bounds.size.width)];
        [_receivablesButton setTitle:Text(@"收款") forState:normal];
        _receivablesButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_receivablesButton setImage:GetImage(@"收款icon") forState:normal];
        [_receivablesButton addTarget:self action:@selector(receiveablesButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _receivablesButton;
}

@end
