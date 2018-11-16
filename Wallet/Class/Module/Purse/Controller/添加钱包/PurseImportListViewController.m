//
//  PurseImportListViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/8.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseImportListViewController.h"
#import "PurseImportListCell.h"
#import "PurseImportKeyViewController.h"

@interface PurseImportListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView; ///列表

@end

@implementation PurseImportListViewController

#pragma mark -
#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark - 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2; //暂时是两个
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PurseImportListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"importListCell"];
    if (indexPath.row == 0) {
        cell.titleImageView.image = GetImage(@"btc");
        cell.titleLabel.text = Text(@"BTC私钥");
    } else {
        cell.titleImageView.image = GetImage(@"eth");
        cell.titleLabel.text = Text(@"ETH私钥");
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PurseImportKeyViewController *controller = [[PurseImportKeyViewController alloc] init];
    if (indexPath.row == 0) {
        controller.coinType = @"BTC";
    } else {
        controller.coinType = @"ETH";
    }
    [self.navigationController pushViewController:controller animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptHeight1334(58*2);
}

#pragma mark -
#pragma mark - 懒加载

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = GetColor(@"#FAFAFA");
        _tableView.frame = self.view.bounds;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:PurseImportListCell.class forCellReuseIdentifier:@"importListCell"];
    }
    return _tableView;
}

@end
