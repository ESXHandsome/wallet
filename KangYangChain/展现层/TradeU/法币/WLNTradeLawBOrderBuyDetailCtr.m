//
//  WLNTradeLawBOrderBuyDetailCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/14.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBOrderBuyDetailCtr.h"

@interface WLNTradeLawBOrderBuyDetailCtr ()<UITableViewDataSource,UITableViewDelegate,WLNFloatViewDelegate>
{
    
    NSInteger _sectionoCount;
    
}
@property (nonatomic, strong) NSMutableDictionary *infoDic;
@property (nonatomic, strong) NSMutableDictionary *orderDic;
@property (nonatomic, assign) NSInteger payType;


@end

@implementation WLNTradeLawBOrderBuyDetailCtr

- (UITableView *)resetTab{
    
    UITableView *tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
    tab.backgroundColor = maingray;
    return tab;
}

- (id)initWithData:(id)data{
    
    if (self = [super init]) {
        _orderDic = data;
    }
    return self;
}
- (void)setDefaultParameter{
    
    self.infoDic = [NSMutableDictionary dictionary];
    _sectionoCount = 2;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情".Intl;
    
    [self setDefaultParameter];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBOrderDetailTopCell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailTopCell"];
    [self.tab registerClass:WLNTradeLawBOrderDetailBottomCell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailBottomCell"];
    [self.tab registerClass:WLNTradeLawBOrderDetailBottom_A_Cell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailBottom_A_Cell"];
    
    [self.tab registerClass:WLNTradeLawBOrderDetailBottom_B_Cell.class forCellReuseIdentifier:@"WLNTradeLawBOrderDetailBottom_B_Cell"];

    
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    NSString *type;
    
    //订单状态0未付款1待确认2完成3自主取消4超时取消
    
    if ([_orderDic[@"status"] integerValue] == 0) {
        
        type = @"1";
        
    }else if ([_orderDic[@"status"] integerValue] == 1){
        
        type = @"3";
        
        
    }else if ([_orderDic[@"status"]integerValue] == 2){
        
        type = @"5";
        
    }else if ([_orderDic[@"status"]integerValue] == 3){
        
        type = @"6";
        _sectionoCount = 1;

    }else if ([_orderDic[@"status"]integerValue] == 4){
        
        type = @"6";
        _sectionoCount = 1;

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
        
    }else if ([sel isEqualToString:@"c2cOrderBuyUpdataStatus:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"操作成功"];
        
        NSMutableDictionary *dic = @{}.mutableCopy;
        dic[@"order_id"] =  _orderDic[@"id"];
        dic[@"type"] = @"3";
        dic[@"user_id"] = self.userModel.userid;
        [self routeTargetName:Handle actionName:@"c2cBillDetail:" param:dic];
        
        
    }else if ([sel isEqualToString:@"c2cChangePayType:"]){
        
        self.infoDic[@"alipay_account"] = data[@"alipay_account"];
        self.infoDic[@"alipay_qrcode"] = data[@"alipay_qrcode"];
        self.infoDic[@"wechat_account"] = data[@"wechat_account"];
        self.infoDic[@"wechat_qrcode"] = data[@"wechat_qrcode"];
        [self.tab reloadData];
        
        
    }
 
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoDic.allKeys.count == 0  ? 0 : 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionoCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
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
    
    NSInteger status = [self.infoDic[@"status"] integerValue];
    
    if (status == 0) {
        return [self bottom_0_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else if (status == 1){
        
        return [self bottom_1_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }else{
        return [self bottom_2_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
}
- (UITableViewCell *)bottom_0_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderDetailBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderDetailBottomCell"];
    cell.forwarder = self;
    cell.dic = self.infoDic;
    cell.payType = _payType;
    
    
    return cell;
    
}
- (UITableViewCell *)bottom_1_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderDetailBottom_A_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderDetailBottom_A_Cell"];
    cell.forwarder = self;
    cell.dic = self.infoDic;
    
    return cell;
    
}
- (UITableViewCell *)bottom_2_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBOrderDetailBottom_B_Cell *cell =[tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBOrderDetailBottom_B_Cell"];
    
    cell.dic = self.infoDic;
    
    return cell;
    
}
- (void)changPayTypeAction:(UITapGestureRecognizer *)tap{
    //支付类型1：银行卡2：支付宝3：微
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"银行卡",@"支付宝",@"微信", nil];
    [view show];
    
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _payType = tag;
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"order_id"] = self.infoDic[@"or_sn"];
    dic[@"type"] = @(_payType + 1);
    [self routeTargetName:Handle actionName:@"c2cChangePayType:" param:dic];
    
    
}
- (void)hasPayAction{
    
    WLNMoneyConfirmView *view = [[WLNMoneyConfirmView alloc]initWithData:@"0"];
    self.infoDic[@"pay_type"] = @(_payType);
    
    view.dic = self.infoDic;
    
    [view show];
    
    weakSelf(self);
    [view setDidPayBlock:^{
    
        NSMutableDictionary *dic = @{}.mutableCopy;
        
        dic[@"order_id"] = weakself.orderDic[@"id"];
        
        dic[@"pay_type"] = @(weakself.payType + 1);
        
        [weakself routeTargetName:Handle actionName:@"c2cOrderBuyUpdataStatus:" param:dic];
        
    }];
    
    
}
@end
