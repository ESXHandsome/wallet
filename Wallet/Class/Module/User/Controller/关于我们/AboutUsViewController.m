//
//  AboutUsViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AboutUsHeaderView.h"
#import "AboutUsCell.h"
#import "UserAgreementViewController.h"
#import "TransactionPasswordView.h"
#import "VerificationTouchID.h"

@interface AboutUsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) AboutUsHeaderView *headerView;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /**隐藏导航栏*/
    self.navigationController.navigationBar.hidden = NO;
    [UIApplication sharedApplication].statusBarStyle = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.tableView reloadData];
}
- (void)configUI {
    
    self.view.backgroundColor = GetColor(@"#FAFAFA");
    /**配置视图*/
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.button];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(NAVIGATION_BAR_HEIGHT);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(adaptHeight1334(160*2));
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(adaptWidth750(0*2));
        make.top.mas_offset(adaptHeight1334(182*2)+NAVIGATION_BAR_HEIGHT);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(adaptHeight1334(46*4));
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).mas_equalTo(adaptHeight1334(290.5*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AboutUsCell *cell = (AboutUsCell *)[self.tableView dequeueReusableCellWithIdentifier:@"AboutUsCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0) {
        [cell cornerRadius:top];
    } else {
        [cell cornerRadius:bottom];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptWidth750(46*2);
}

#pragma mark -
#pragma mark - Lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.frame;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:AboutUsCell.class forCellReuseIdentifier:@"AboutUsCell"];
    }
    return _tableView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:@"服务及隐私条款" forState:normal];
        [_button addTarget:self action:@selector(UserAgreement) forControlEvents:UIControlEventTouchUpInside];
        _button.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        [_button setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _button;
}

-(void) UserAgreement {
    
    UserAgreementViewController *controller = [[UserAgreementViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (AboutUsHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[AboutUsHeaderView alloc] init];
    }
    return _headerView;
}

@end
