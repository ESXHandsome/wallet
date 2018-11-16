//
//  PurseViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseViewController.h"
#import "PurseTableViewCell.h"
#import "PurseTableFooterView.h"
#import "PurseDetailViewController.h"
#import "PurseViewModel.h"
#import "CoinManager.h"
#import "CreatWalletViewController.h"
#import "UserConfigManager.h"
#import "PurseAddViewController.h"

@interface PurseViewController () <UITableViewDelegate, UITableViewDataSource, PurseTableFooterViewDelegate, PurseTableViewCellDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) PurseTableFooterView *tableFooterView;
@property (strong, nonatomic) PurseViewModel *viewModel;

@end

@implementation PurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.view.backgroundColor = GetColor(@"#ECECEC");
    [self creatUI];
    NSLog(@"%@",[UserConfigManager getUserConfigDic]);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /**隐藏导航栏*/
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark - Private method
- (void)creatUI {
    [self.view addSubview:self.tableView];

}

#pragma mark -
#pragma mark - TableView delegate dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [CoinManager sharedInstance].allWalletDic.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptHeight1334(86*2);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PurseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.isMainWallet) {
        return;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"是否设置成主用户" preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        PurseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [CoinManager sharedInstance].currentWalletName = cell.walletName;
        [weakSelf.tableView reloadData];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PurseTableViewCell *cell = (PurseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"purseCell"];
    NSDictionary *dic = self.viewModel.dataSource[indexPath.section];
    CoinWalletModel *model = [[CoinManager sharedInstance] dicChangeToCoinWalletModel:dic];
    cell.delegate = self;
    [cell setCellWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section > 0) {
        return adaptHeight1334(15*2);
    }
    return adaptHeight1334(20*2);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]init];
    return headView;
}

- (void)cell:(PurseTableViewCell *)cell didSelectedDetailButton:(UIButton *)button {
    PurseDetailViewController *controller = [[PurseDetailViewController alloc] init];
    controller.model = cell.model;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)addWalletButtonDidClicked {
    [self.navigationController pushViewController:PurseAddViewController.new animated:YES];
}

#pragma mark -
#pragma mark - Lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.frame = self.view.frame;
        _tableView.backgroundColor = GetColor(@"#ECECEC");
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[PurseTableViewCell class] forCellReuseIdentifier:@"purseCell"];
        PurseTableFooterView *footer = [[PurseTableFooterView alloc] init];
        footer.delegate = self;
        _tableView.tableFooterView = footer;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.tableHeaderView = [[UIView alloc] init];
    }
    return _tableView;
}

- (PurseViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[PurseViewModel alloc] init];
    }
    return _viewModel;
}

@end
