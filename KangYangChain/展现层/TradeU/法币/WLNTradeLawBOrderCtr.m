//
//  WLNTradeLawBOrderCtr.m
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeLawBOrderCtr.h"

@interface WLNTradeLawBOrderCtr ()
<
WLNSimpleHeadViewDelegate,
UITableViewDelegate,
UITableViewDataSource
>
{
    NSInteger _currertIndex;
}
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNTradeLawBOrderCtr


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    
    self.tab.dataSource = self;
    self.tab.delegate = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeLawBOrderCell.class forCellReuseIdentifier:@"WLNTradeLawBOrderCell"];
    
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"未完成",@"已完成",@"已取消"]];
    self.tab.tableHeaderView = view;
    
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"id"] = self.userModel.userid;
    dic[@"type"] = @"1";
    [self routeTargetName:Handle actionName:@"c2cBillList:" param:dic];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{

    self.dataArr = data;
    [self.tab reloadData];

    
}

- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    
    _currertIndex = tag;
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"id"] = self.userModel.userid;
    dic[@"type"] = @(tag + 1);
    
    [self routeTargetName:Handle actionName:@"c2cBillList:" param:dic];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderCell"];
    cell.dic = self.dataArr[indexPath.row];
    
    cell.timeLab.hidden = _currertIndex == 0 ? NO: YES;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableDictionary *dic = self.dataArr[indexPath.row];
    
    if ([dic[@"type"] integerValue] == 1) {
        WLNTradeLawBOrderBuyDetailCtr *vc = [[WLNTradeLawBOrderBuyDetailCtr alloc]initWithData:dic];
        [self push:vc];

    }else{
        WLNTradeLawBOrderSellDetailCtr *vc = [[WLNTradeLawBOrderSellDetailCtr alloc]initWithData:dic];
        [self push:vc];

    }
    
    
    
}


@end
