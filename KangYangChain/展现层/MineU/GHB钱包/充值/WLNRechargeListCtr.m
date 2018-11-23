//
//  WLNRechargeListCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNRechargeListCtr.h"

@interface WLNRechargeListCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation WLNRechargeListCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值记录".Intl;
    
    self.dataArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNRechargeListCell.class forCellReuseIdentifier:@"WLNRechargeListCell"];
    
    WLNRechargeListHeadView *view = [[WLNRechargeListHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 85)];
    self.tab.tableHeaderView = view;
    
    
    [self pullUpLoading];
    
    
}

- (void)pullUpLoading{
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"type"] = @"3";
    [self routeTargetName:Handle actionName:@"GHBLogAction:" param:dic];

    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [super result:data sel:sel];
    
    self.dataArr = data[@"data"];
    [self.tab reloadData];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNRechargeListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNRechargeListCell"];
    cell.dic = self.dataArr[indexPath.row];
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self push:@"WLNRechargeDetailCtr".instance];
    
    
}



@end
