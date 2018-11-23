//
//  WLNMineLawWalletCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineLawWalletCtr.h"

@interface WLNMineLawWalletCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) WLNMineLawWalletHeadView *headView;

@property (nonatomic, strong) NSMutableDictionary *infoDic;


@end

@implementation WLNMineLawWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"C2C账户".Intl;
    
    self.infoDic = [NSMutableDictionary dictionary];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNWalletBodyCell.class forCellReuseIdentifier:@"WLNWalletBodyCell"];
    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];
    
    self.tab.tableHeaderView = self.headView;
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"user_id"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"c2cWallet:" param:dic];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    self.headView.dic = data;
    self.infoDic = data;
    [self.tab reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 40 : 0.1;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineSmallView *view = [[WLNMineSmallView alloc]init];
    return section == 0 ? view : 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNWalletHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletHeadCell"];

    return cell;
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNWalletBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletBodyCell"];
    cell.dic = self.infoDic;
    cell.bizhongLab.text = @"USDT";
    return cell;
    
    
}
- (void)clickAction:(UITapGestureRecognizer *)tap{
     
    NSArray *arr = @[@"WLNChangeCtr".instance,@"WLNTradeLawBOrderCtr".instance];
    NSArray *titleArr = @[@"资金转化",@"账单"];
    [self push:arr[tap.view.tag] title:titleArr[tap.view.tag]];
    
}
- (WLNMineLawWalletHeadView *)headView{
    if (_headView == nil) {
        _headView = [[WLNMineLawWalletHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 250)];
        _headView.forwarder = self;
        
        
    }
    return _headView;
}

@end
