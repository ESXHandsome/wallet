//
//  UserViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "UserViewController.h"
#import "UserTableViewCell.h"
#import "UserHeaderView.h"
#import "AboutUsViewController.h"
#import "SystemSettingsViewController.h"
#import "LoginViewController.h"
@interface UserViewController () <UITableViewDelegate, UITableViewDataSource, UserHeaderViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UserHeaderView *headerView;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self configUI];
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
#pragma mark - Private method

- (void)configUI {
    self.view.backgroundColor=[UIColor whiteColor];
    /**配置视图*/
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.headerView];
    
    if (@available(iOS 11.0,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(adaptWidth750(0));
        make.top.mas_offset(adaptHeight1334(0));
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(adaptHeight1334(160*2));
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(adaptWidth750(0*2));
        make.top.mas_offset(adaptHeight1334(140*2)+STATUS_BAR_HEIGHT);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(adaptHeight1334(120*2));
    }];
}


- (UserHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[UserHeaderView alloc] init];
        _headerView.delegate = self;
    }
    return _headerView;
}


#pragma mark -
#pragma mark - UITableView delegate dataSource


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
    
      
        SystemSettingsViewController *controller = [[SystemSettingsViewController alloc] init];
        
        [self.navigationController pushViewController:controller animated:YES];
    }
    if (indexPath.row == 1) {
        
        AboutUsViewController *controller = [[AboutUsViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
  
}

- (void)purseButtonClicked {
    self.navigationController.navigationBar.hidden = NO;
    LoginViewController *controller = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
//    [self.navigationController pushViewController:[LoginViewController new] animated:YES];
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UserTableViewCell *cell = (UserTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0) {
        [cell cornerRadius:top];
        
    } else {
        [cell cornerRadius:bottom];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptWidth750(60*2);
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
        [_tableView registerClass:UserTableViewCell.class forCellReuseIdentifier:@"userCell"];
    }
    return _tableView;
}

@end
