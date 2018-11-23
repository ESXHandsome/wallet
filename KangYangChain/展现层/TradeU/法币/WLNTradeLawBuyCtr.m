//
//  WLNTradeLawBuyCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBuyCtr.h"

@interface WLNTradeLawBuyCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableDictionary *_tempDic;
    WLNTradeLawBuyCell *_buyCell;
    NSInteger _isBuy;
    
}
@property (nonatomic, strong) NSMutableDictionary *infoDic;

@end

@implementation WLNTradeLawBuyCtr

- (id)initWithData:(id)data{
    if (self = [super init]) {
        
        _tempDic = data;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isBuy = [self.title isEqualToString:@"购买"] ? 0 : 1;
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBuyCell.class forCellReuseIdentifier:@"WLNTradeLawBuyCell"];
    
    [self.tab registerClass:WLNTradeLawCionCell.class forCellReuseIdentifier:@"WLNTradeLawCionCell"];
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"limit_id"] = _tempDic[@"id"];
    
    
    
    
    [self routeTargetName:Handle actionName: _isBuy == 0 ? @"c2cBuyConfig:":@"c2cSellConfig:" param:dic];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"c2cBuyConfig:"] || [sel isEqualToString:@"c2cSellConfig:"]) {
        
        self.infoDic = [data mutableCopy];
        
        [self.tab reloadData];

    }else if ([sel isEqualToString:@"c2cBuyFirstAction:"]){
        
        self.infoDic[@"num"] = _buyCell.priceTxt.text;
        self.infoDic[@"limit_id"] = _tempDic[@"id"];
        
        WLNTradeLawPayCtr *vc = [[WLNTradeLawPayCtr alloc]initWithData:self.infoDic];
        vc.titleStr = self.title;
        [self push:vc];

    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawCionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawCionCell"];
    cell.changedDic = self.infoDic;
    cell.changed = YES;
    
    return cell;
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBuyCell"];
    cell.forwarder = self;
    cell.dic = self.infoDic;
    _buyCell = cell;
    
    cell.doneLab.text = [self.title isEqualToString:@"购买"] ? @"购买" : @"出售";
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)gotoPay{
    
    if (_buyCell.priceTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
    }
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"id"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"c2cBuyFirstAction:" param:dic];
    
    
    
}

@end
