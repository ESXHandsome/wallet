//
//  WLNTradeLawBOrderSellDetailCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/14.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBOrderSellDetailCtr.h"

@interface WLNTradeLawBOrderSellDetailCtr ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _sectionCount;
    
}
@property (nonatomic, strong) NSMutableDictionary *infoDic;
@property (nonatomic, strong) NSMutableDictionary *orderDic;

@end

@implementation WLNTradeLawBOrderSellDetailCtr
- (UITableView *)resetTab{
    
    UITableView *tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
    tab.backgroundColor = maingray;
    return tab;
}
- (id)initWithData:(id)data{
    self = [super init];
    if (self) {
        
        _orderDic = data;

    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情".Intl;
    
    self.infoDic = [NSMutableDictionary dictionary];
    _sectionCount = 1;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBOrderDetailTopCell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailTopCell"];
    [self.tab registerClass:WLNTradeLawBOrderDetailBottom_B_Cell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailBottom_B_Cell"];

    NSMutableDictionary *dic = @{}.mutableCopy;
    
    NSString *type;
    
    //订单状态0未付款1待确认2完成3自主取消4超时取消
    
    if ([_orderDic[@"status"] integerValue] == 0) {
        
        type = @"2";
        
    }else if ([_orderDic[@"status"] integerValue] == 1){
        
        type = @"4";
        _sectionCount = 2;
        
    }else if ([_orderDic[@"status"]integerValue] == 2){ //完成
        
        type = @"5";
        _sectionCount = 2;
        
        
    }else if ([_orderDic[@"status"]integerValue] == 3){
        
        type = @"6";
        
    }else if ([_orderDic[@"status"]integerValue] == 4){
        
        type = @"6";
        
    }
    dic[@"order_id"] =  _orderDic[@"id"];
    dic[@"type"] = type;
    dic[@"user_id"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"c2cBillDetail:" param:dic];
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"c2cBillDetail:"]) {
        
        self.infoDic = [data mutableCopy];
        [self.tab reloadData];
        
    }else if ([sel isEqualToString:@"c2cOrderSellUpdataStatus:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"操作成功"];
        
        NSMutableDictionary *dic = @{}.mutableCopy;
        dic[@"order_id"] =  _orderDic[@"id"];
        dic[@"type"] = @"1";
        dic[@"user_id"] = self.userModel.userid;
        [self routeTargetName:Handle actionName:@"c2cBillDetail:" param:dic];
        
        
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionCount;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == _sectionCount - 1) {
        return 200;
    }
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    WLNTradeLawBOrderDetailFootView *view = [WLNTradeLawBOrderDetailFootView new];
    view.forwarder = self;
    view.dic = self.infoDic;
    
    view.layer.masksToBounds = YES;
    return view;
    

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self top_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self bottom_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)top_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderDetailTopCell"];
    
    cell.dic = self.infoDic;
    
    return cell;
    
}

- (UITableViewCell *)bottom_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNTradeLawBOrderDetailBottom_B_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderDetailBottom_B_Cell"];
    cell.forwarder = self;
    cell.dic = self.infoDic;
    
    return cell;
    
}
- (void)paySureAction{
    
    WLNMoneyConfirmView *view = [[WLNMoneyConfirmView alloc]initWithData:@"1"];
    view.dic = self.infoDic;

    [view show];
    
    weakSelf(self);
    [view setDidPayBlock:^{
        
        NSMutableDictionary *dic = @{}.mutableCopy;
        
        dic[@"order_id"] = weakself.orderDic[@"id"];
        
        [weakself routeTargetName:Handle actionName:@"c2cOrderSellUpdataStatus:" param:dic];
        
    }];
    
    
}
- (void)callToUser{
    
    [@"13968111662" call];
    
    
}
- (void)callKefu{
    
    [SVProgressHUD showSuccessWithStatus:@"暂未开放"];
    
}
@end
