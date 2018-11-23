//
//  WLNTradeBBHoldOrderCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/10.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBHoldOrderCtr.h"

@interface WLNTradeBBHoldOrderCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNTradeBBHoldOrderCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeBBHoldOrderCell.class forCellReuseIdentifier:@"WLNTradeBBHoldOrderCell"];
    
    [self pullUpLoading];
    
}
- (void)pullUpLoading{
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"userid"] = self.userModel.userid;
    dic[@"coin"] = @"null";
    [self routeTargetName:Handle actionName:@"weituoAllList:" param:dic];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    [super result:data sel:sel];
    
    self.dataArr = data;
    [self.tab reloadData];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeBBHoldOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBHoldOrderCell"];
    
    cell.dic = self.dataArr[indexPath.row];
    
    
    return cell;
    
    
    
}



@end
