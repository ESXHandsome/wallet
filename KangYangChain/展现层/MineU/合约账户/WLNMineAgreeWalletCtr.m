//
//  WLNMineAgreeWalletCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineAgreeWalletCtr.h"

@interface WLNMineAgreeWalletCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *info;
@property (nonatomic, strong) WLNMineAgreeWalletHeadView *headView;
@end

@implementation WLNMineAgreeWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"合约账户".Intl;
    
    self.info = [NSMutableDictionary dictionary];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    
    [self.tab registerClass:WLNMineAgreeWalletCell.class forCellReuseIdentifier:@"WLNMineAgreeWalletCell"];
    
    
    
    self.headView = [[WLNMineAgreeWalletHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 250)];
    self.headView.forwarder = self;
    self.tab.tableHeaderView = self.headView;
    
    
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"agreeAccount:" param:dic];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    self.info = data;
    self.headView.dic = data;
    [self.tab reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineSmallView *view = [[WLNMineSmallView alloc]init];
    return view;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineAgreeWalletCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineAgreeWalletCell"];
    cell.dic = self.info;
    
    
    return cell;
    
}


- (void)clickAction:(UITapGestureRecognizer *)tap{

    
    NSArray *arr = @[@"WLNChangeCtr".instance,@"WLNMineAgreeBillCtr".instance];
    NSArray *titleArr = @[@"资金转化",@"账单"];
    
    [self push:arr[tap.view.tag] title:titleArr[tap.view.tag]];
 
    
}


@end
