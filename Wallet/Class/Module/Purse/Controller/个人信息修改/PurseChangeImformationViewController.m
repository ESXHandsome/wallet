//
//  PurseChangeImformationViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/31.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseChangeImformationViewController.h"
#import "PurseChangeImformationTableViewCell.h"
#import "PurseChangeImformationViewModel.h"
#import "PurseChangeWalletNameViewController.h"

@interface PurseChangeImformationViewController () <UITableViewDelegate, UITableViewDataSource, PurseChangeWalletNameViewControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) PurseChangeImformationViewModel *viewModel;

@end

@implementation PurseChangeImformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)finishChangeWalletName {
    [self.tableView reloadData];
    [MBProgressHUD showSuccess:@"名称修改成功"];
}

#pragma mark -
#pragma mark - LableView Delegate DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return adaptHeight1334(10*2);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0)
        return adaptHeight1334(70*2);
    return adaptHeight1334(46*2);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
        PurseChangeWalletNameViewController *controller = [[PurseChangeWalletNameViewController alloc] init];
        controller.delegate = self;
        controller.model = self.model;
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]init];
    return headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PurseChangeImformationTableViewCell *cell = (PurseChangeImformationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PurseChangeImformationCell"];
    cell.textLabel.text = self.viewModel.cellTitleList[indexPath.row];
    if (indexPath.row == 0) {
        [cell setIconImage:nil];
    } else {
        [cell setTailLabelText:self.model.walletName];
    }
    return cell;
}

#pragma mark -
#pragma mark - Lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.bounds;
        _tableView.backgroundColor = GetColor(@"#ECECEC");
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:PurseChangeImformationTableViewCell.class forCellReuseIdentifier:@"PurseChangeImformationCell"];
    }
    return _tableView;
}

- (PurseChangeImformationViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[PurseChangeImformationViewModel alloc] init];
    }
    return _viewModel;
}

@end
