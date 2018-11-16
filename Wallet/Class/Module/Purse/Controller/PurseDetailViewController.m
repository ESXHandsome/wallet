//
//  PurseDetailViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/30.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseDetailViewController.h"
#import "PurseDetailTableHeaderView.h"
#import "PurseDetailCellTableViewCell.h"
#import "PurseDetailViewModel.h"
#import "PurseChangeImformationViewController.h"
#import "PurseChangePasswViewController.h"
#import "PurseBackupsViewController.h"
#import "PurseExportViewController.h"
#import "PurseDeleteViewController.h"
#import "PursePrivateKeyViewController.h"
#import "PassValueName.h"
#import "PurseEnterPasswordViewController.h"
@interface PurseDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) PurseDetailTableHeaderView *tableHeaderView;
@property (strong, nonatomic) PurseDetailViewModel *viewModel;

@end

@implementation PurseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configUI];
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passwordResetSuccess) name:@"NotificationPasswordResetSuccess" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    self.tableHeaderView.titleLabel.text = self.model.walletName;
}

- (void)configUI {
 self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    self.tableHeaderView.titleLabel.text = self.model.walletName;
     [PassValueName shareInstanc].walletName = self.model.walletName;
    if ([self.model.iconName isEqualToString:@""]) {
        self.tableHeaderView.imageView.image = GetImage(@"wallet_cell_icon");
    } else {
        self.tableHeaderView.imageView.image = [UIImage imageWithData:[NSData new]];
    }
    [self.view addSubview:self.tableView];
}

- (void)passwordResetSuccess {
    [MBProgressHUD showSuccess:@"密码修改成功"];
}

#pragma mark -
#pragma mark - tableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return adaptHeight1334(10*2);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        /*修改密码*/
        PurseChangePasswViewController *controller = [[PurseChangePasswViewController alloc] init];
        controller.model = self.model;
        [self.navigationController pushViewController:controller animated:YES];
    }
    if (indexPath.row == 1) {
        /*钱包备份*/
        PurseEnterPasswordViewController *controller = [[PurseEnterPasswordViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    if (indexPath.row == 2) {
        /*钱包备份*/
        PurseExportViewController *controller = [[PurseExportViewController alloc] init];
        controller.model = self.model;
        [self.navigationController pushViewController:controller animated:YES];
    }
    if (indexPath.row == 3) {
        /*钱包备份*/
        PurseDeleteViewController *controller = [[PurseDeleteViewController alloc] init];
        controller.model = self.model;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]init];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptHeight1334(46*2);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PurseDetailCellTableViewCell *cell = (PurseDetailCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    cell.textLabel.text = self.viewModel.cellTitleList[indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark - Action
- (void)headerViewDidSelected {
    PurseChangeImformationViewController *controller = [[PurseChangeImformationViewController alloc] init];
    controller.model = self.model;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark - Lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = UIView.new;
        _tableView.tableHeaderView = self.tableHeaderView;
        [_tableView registerClass:PurseDetailCellTableViewCell.class forCellReuseIdentifier:@"DetailCell"];
        _tableView.backgroundColor = GetColor(@"#FAFAFA");
    }
    return _tableView;
}

- (PurseDetailTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[PurseDetailTableHeaderView alloc] init];
        _tableHeaderView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerViewDidSelected)];
        [_tableHeaderView addGestureRecognizer:tap];
    }
    return _tableHeaderView;
}

- (PurseDetailViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[PurseDetailViewModel alloc] init];
    }
    return _viewModel;
}

@end
