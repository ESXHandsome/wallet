//
//  WalletViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "WalletViewController.h"
#import "WalletViewModel.h"
#import "WalletTableViewCell.h"
#import "WalletTableHeaderView.h"
#import "PurseViewController.h"
#import "CoinListViewController.h"
#import "UserConfigManager.h"
#import <MJRefresh.h>
#import "CoinMarketApi.h"
#import "CoinManager.h"
#import "RemittanceHomeViewController.h"
#import "WalletPriceManager.h"

@interface WalletViewController () <UITableViewDelegate, UITableViewDataSource ,WalletTableHeaderViewDelegate>

@property (strong, nonatomic) WalletPriceManager *manager;
@property (strong, nonatomic) UITableView *tableView;       ///表格视图
@property (strong, nonatomic) WalletTableHeaderView *tableHeaderView;      ///表格视图头视图
@property (strong, nonatomic) WalletViewModel *viewModel;   ///ViewModel

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self setupDownRefresh];
    [self loadMarketPrice];
}

- (void)loadMarketPrice {
    self.manager = [WalletPriceManager sharedInstance];
    [self.manager addObserver:self forKeyPath:@"BTCPrice" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"ETHPrice" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"BTCBalance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"ETHBalance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"BTCBalancePrice" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager addObserver:self forKeyPath:@"ETHBalancePrice" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.manager getWalletInformation];
}

- (void)configUI {
    self.view.backgroundColor=[UIColor whiteColor];
    /**配置视图*/
    if (@available(iOS 11.0,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /**隐藏导航栏*/
    self.navigationController.navigationBar.hidden = YES;
    [UIApplication sharedApplication].statusBarStyle = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark - KVO 监听

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"ETHPrice"]) {
        WalletTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        cell.priceLabel.text = self.manager.ETHPrice;
    }
    if ([keyPath isEqualToString:@"BTCPrice"]) {
        WalletTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.priceLabel.text = self.manager.BTCPrice;
    }
    if ([keyPath isEqualToString:@"ETHBalance"]) {
        WalletTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        cell.userCoinLabel.text = self.manager.ETHBalance;
    }
    if ([keyPath isEqualToString:@"BTCBalance"]) {
        WalletTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.userCoinLabel.text = self.manager.BTCBalance;
    }
    if ([keyPath isEqualToString:@"ETHBalancePrice"]) {
        WalletTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        cell.userPriceLabel.text = self.manager.ETHBalancePrice;
    }
    if ([keyPath isEqualToString:@"BTCBalancePrice"]) {
        WalletTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.userPriceLabel.text = self.manager.BTCBalancePrice;
    }
}

#pragma mark -
#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptHeight1334(160);
}

#pragma mark -
#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WalletTableViewCell *cell = (WalletTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"walletCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell cornerRadius:top];
    } else {
        [cell cornerRadius:bottom];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WalletTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    RemittanceHomeViewController *controller = [[RemittanceHomeViewController alloc] init];
    controller.image = cell.iconView.image;
    controller.coinString = cell.userCoinLabel.text;
    controller.priceString = cell.userPriceLabel.text;
    if (indexPath.row == 0) {
        controller.addressString = [CoinManager sharedInstance].wallentModel.eth_address;
        controller.type = @"BTC";
    }
    if (indexPath.row == 1) {
        controller.addressString = [CoinManager sharedInstance].wallentModel.btc_address;
        controller.type = @"ETH";
    }
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark - HeaderView delegate

- (void)purseButtonClicked {
    [self.navigationController pushViewController:[PurseViewController new] animated:YES];
}

- (void)addButtonClicked {
    [self.navigationController pushViewController:[CoinListViewController new] animated:YES];
}

#pragma mark -
#pragma mark - lazy load

- (WalletTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[WalletTableHeaderView alloc] init];
        _tableHeaderView.delegate = self;
    }
    return _tableHeaderView;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = [UIScreen mainScreen].bounds;
        [_tableView registerClass:[WalletTableViewCell class]
           forCellReuseIdentifier:@"walletCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = GetColor(@"#ECECEC");
        _tableView.tableHeaderView = self.tableHeaderView;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _tableView;
}

- (WalletViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[WalletViewModel alloc] init];
    }
    return _viewModel;
}

- (void)setupDownRefresh {
    
    MJRefreshGifHeader *mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    mj_header.lastUpdatedTimeLabel.hidden = YES;
    mj_header.stateLabel.hidden = YES;
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadNewData
{
   [self.tableView.mj_header endRefreshing];
}

- (void)dealloc {
    [self.manager removeObserver:self forKeyPath:@"BTCPrice"];
    [self.manager removeObserver:self forKeyPath:@"ETHPrice"];
    
}

@end
