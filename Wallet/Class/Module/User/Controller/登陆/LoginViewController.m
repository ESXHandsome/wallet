//
//  LoginViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTableViewCell.h"
#import "TransactionPasswordView.h"
#import "SelectCountryViewController.h"
@interface LoginViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UILabel *Label;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}
- (void)configUI {
    
    self.view.backgroundColor=[UIColor whiteColor];
    /**配置视图*/
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.button];
    [self.view addSubview:self.Label];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(adaptWidth750(17*2));
        make.top.mas_offset(adaptHeight1334(10.5*2)+NAVIGATION_BAR_HEIGHT);
        make.width.mas_offset(adaptWidth750(358*2));
        make.height.mas_offset(adaptHeight1334(46*6));
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(adaptWidth750(27*2));
        make.top.mas_offset(adaptHeight1334(182*2)+NAVIGATION_BAR_HEIGHT);
        make.width.mas_offset(adaptWidth750(322*2));
        make.height.mas_offset(adaptHeight1334(44*2));
    }];
    [self.Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_offset(adaptHeight1334(240*2)+NAVIGATION_BAR_HEIGHT);
        make.height.mas_offset(adaptHeight1334(17*2));
    }];
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (indexPath.row == 0) {
    
            SelectCountryViewController *controller = [[SelectCountryViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LoginTableViewCell *cell = (LoginTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"LoginTableViewCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        [cell cornerRadius:top];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.row==1){
        [cell cornerRadius:medium];
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
        [_tableView registerClass:LoginTableViewCell.class forCellReuseIdentifier:@"LoginTableViewCell"];
    }
    return _tableView;
}

-(UIButton *)button {
    if (_button == nil) {
        _button = [[UIButton alloc] init];
        _button.layer.borderColor = [[UIColor blackColor] CGColor];
        [_button setTitle:@"登录" forState:normal];
        _button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        [_button setTitleColor:[UIColor colorWithString:@"#6072F5"] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _button;
}

- (UILabel *)Label {
    if (!_Label) {
        _Label = [[UILabel alloc] init];
        NSString *testString = @"未注册过的手机将自动创建账号";
        _Label.textColor = GetColor(@"#999999");
        _Label.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _Label.numberOfLines = 0;
        _Label.text=testString;
    }
    return _Label;
}

-(void)addButtonAction {
    
    NSLog(@"登录");
}

@end
