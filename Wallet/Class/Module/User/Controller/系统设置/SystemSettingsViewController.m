//
//  SystemSettingsViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SystemSettingsViewController.h"
#import "SystemSettingsCellTableViewCell.h"
#import "SetingLanguageViewController.h"
#import "ChooseCurrencyViewController.h"
#import "SetTouchID.h"
@interface SystemSettingsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView * tfBackView;

@end

@implementation SystemSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(adaptHeight1334(10.5*2)+NAVIGATION_BAR_HEIGHT);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(adaptHeight1334(139*2));
    }];
  
 
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /**隐藏导航栏*/
    self.navigationController.navigationBar.hidden = NO;
    [UIApplication sharedApplication].statusBarStyle = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.tableView reloadData];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(adaptHeight1334(10.5*2)+NAVIGATION_BAR_HEIGHT);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(adaptHeight1334(139*2));
    }];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SystemSettingsCellTableViewCell *cell = (SystemSettingsCellTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"SystemSettingsCellTableViewCell" forIndexPath:indexPath];
   
    if (indexPath.row == 0) {
        [cell cornerRadius:top];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if (indexPath.row == 1){
        
        [cell cornerRadius:medium];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        
        [cell cornerRadius:bottom];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 1) {
        
       
        SetingLanguageViewController *controller = [[SetingLanguageViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    if (indexPath.row == 2) {
       
        ChooseCurrencyViewController *controller = [[ChooseCurrencyViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptWidth750(46*2);
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.frame;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:SystemSettingsCellTableViewCell.class forCellReuseIdentifier:@"SystemSettingsCellTableViewCell"];
    }
    return _tableView;
}
- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor whiteColor];
    }
    return _tfBackView;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
