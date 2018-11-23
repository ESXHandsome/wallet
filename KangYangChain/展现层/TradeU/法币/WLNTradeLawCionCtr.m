//
//  WLNTradeLawCionCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawCionCtr.h"

@interface WLNTradeLawCionCtr ()
<
UITableViewDelegate,
UITableViewDataSource,
WLNSimpleHeadViewDelegate
>
{
    NSInteger _currentType;
    NSArray *_titleArr;
    NSMutableDictionary *_infoDic;
    

}
 
@property (nonatomic, strong) NSMutableArray *dataArr;


@end

@implementation WLNTradeLawCionCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArr = @[@"购买",@"出售",@"委托单",@"订单"];
    _infoDic = [NSMutableDictionary dictionary];
    
    [self tabType:1];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNTradeLawCionCell.class forCellReuseIdentifier:@"WLNTradeLawCionCell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:@"add".image style:UIBarButtonItemStyleDone target:self action:@selector(addAction)];
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:_titleArr];
    view.specialTag = 3;
    self.tab.tableHeaderView = view;
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"user_id"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"c2cBuyList:" param:dic];
    
}
- (void)pullUpLoading{
    
    NSLog(@"1");
    
    NSArray *arr = @[@"c2cBuyList:",@"c2cSellList:",@"c2cWeituoList:"];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"user_id"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:arr[_currentType] param:dic];

    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [super result:data sel:sel];
    
    if ([sel isEqualToString:@"c2cBuyList:"]) {
        
        self.dataArr = data;
        
    }else if ([sel isEqualToString:@"c2cSellList:"]){
        
        NSArray *arr = data;
        self.dataArr = arr.firstObject;
        _infoDic = arr.lastObject;
        
    }else if ([sel isEqualToString:@"c2cWeituoList:"]){
        
        self.dataArr = data;
        
    }else if ([sel isEqualToString:@"c2cWeituoUpdateState:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"操作成功"];

        NSMutableDictionary *dic = @{}.mutableCopy;
        dic[@"user_id"] = self.userModel.userid;
        [self routeTargetName:Handle actionName:@"c2cWeituoList:" param:dic];

        
        
    }

    [self.tab reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (_currentType == 0) {
        return 35;
    }else if (_currentType == 1){
        return 55;
    }else{
        return 0.1;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNTradeLawBHeaderView *view = [[WLNTradeLawBHeaderView alloc]init];
    view.layer.masksToBounds = YES;
    view.dic = _infoDic;
    view.forwarder = self;
    
  
    if (_currentType == 2 || _currentType == 3) {
        return nil;
    }
    
    return view;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeLawCionCell *cell =[tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawCionCell"];
    cell.forwarder = self;
    
    cell.bottomView.hidden = _currentType == 2 ? NO :YES;
    
    if (_currentType == 2) {
        
        cell.weituoDic = self.dataArr[indexPath.row];
    }else{
        cell.dic = self.dataArr[indexPath.row];

    }
    
    weakSelf(self);
    [cell setDidClickAction:^(NSInteger tag) {
    
        [weakself chedanActionWithDic:weakself.dataArr[indexPath.row] tag:tag];
       
    }];
    
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_currentType == 0 || _currentType == 1) {
        
        WLNTradeLawBuyCtr *vc = [[WLNTradeLawBuyCtr alloc]initWithData:self.dataArr[indexPath.row]];
        [self push:vc title:_currentType == 0 ? @"购买" : @"出售"];

    }
    
    
}
#pragma mark - 协议

- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    if (tag == 3) {
        
        [self push:@"WLNTradeLawBOrderCtr".instance title:@"订单"];
        return;
        
    }
    _currentType = tag;
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"user_id"] = self.userModel.userid;
    
    if (tag == 0) {
        
        [self routeTargetName:Handle actionName:@"c2cBuyList:" param:dic];
        
    }else if (tag == 1){
        
        [self routeTargetName:Handle actionName:@"c2cSellList:" param:dic];
        
    }else if (tag == 2){
        
        [self routeTargetName:Handle actionName:@"c2cWeituoList:" param:dic];
        
    }
    
    
    
    
    

    
}
- (void)addAction{
    
    WLNTradeLawBPublishCtr *vc = [WLNTradeLawBPublishCtr new];
    [self push:vc];

    [vc setDidPublishDone:^{
        
        
    }];
    
   
}
- (void)topAction:(UITapGestureRecognizer *)tap{
    
    NSInteger tag = tap.view.tag;
    
    if (tag == 0) {
        
        
        
    }else if (tag == 1){
        
        WLNFloatView *view  = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"所有金额",@"5万以上",@"10万以上",@"20万以上", nil];
        
        [view show];
        
        
    }else{
        
        WLNFloatView *view  = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"所有方式",@"银行卡",@"支付宝",@"微信支付", nil];
        
        [view show];
        
    }
    
}
- (void)chedanActionWithDic:(NSMutableDictionary*)dic tag:(NSInteger)tag{
    
    //撤销 : 3 暂停: 4 接单: 1
    
    NSMutableDictionary *dicp= @{}.mutableCopy;
    
    dicp[@"limit_id"] = dic[@"id"];
    
    dicp[@"type"] = @(tag);
    
    [self routeTargetName:Handle actionName:@"c2cWeituoUpdateState:" param:dicp];
    
    
}


@end
