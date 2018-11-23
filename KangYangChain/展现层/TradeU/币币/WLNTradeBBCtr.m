//
//  WLNTradeBBCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBCtr.h"

@interface WLNTradeBBCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *chooseDic;
@property (nonatomic, strong) NSMutableArray *holdArr;


@end

@implementation WLNTradeBBCtr

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.holdArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeBBHeadCell.class forCellReuseIdentifier:@"WLNTradeBBHeadCell"];
    [self.tab registerClass:WLNTradeBBBodyCell.class forCellReuseIdentifier:@"WLNTradeBBBodyCell"];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:@"catogry".image style:UIBarButtonItemStyleDone target:self action:@selector(menuAciton)];

    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"userid"] = self.userModel.userid;
    dic[@"coin"] = @"null";
    [self routeTargetName:Handle actionName:@"weituoiSingle:" param:dic];
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    
    if ([sel isEqualToString:@"bbBuy:"]) {
     
        NSInteger res = [data integerValue];
        
        if (res == 1) {
            [SVProgressHUD showSuccessWithStatus:@"买入成功"];
            
        }else{
            [SVProgressHUD showErrorWithStatus:@"支付币种余额不足"];
            
        }
        
    }else if ([sel isEqualToString:@"bbSell:"]){
     
        NSInteger res = [data integerValue];
        
        if (res == 1) {
            [SVProgressHUD showSuccessWithStatus:@"卖出成功"];
            
        }else{
            [SVProgressHUD showErrorWithStatus:@"卖出币种余额不足"];
            
        }
        
    }else if ([sel isEqualToString:@"weituoiSingle:"]){
        
        NSArray *arr = [data mutableCopy];
        [self.holdArr addObject:arr.firstObject];
        [self.tab reloadData];
        
        
    }else if ([sel isEqualToString:@"weituoCancelAll:"]){
        
        NSInteger res = [data integerValue];

        if (res == 1) {
            [SVProgressHUD showSuccessWithStatus:@"全部撤销成功"];
            [self.holdArr removeAllObjects];
            [self.tab reloadData];
        }
        
        
    }else if ([sel isEqualToString:@"weituoCancelOne:"]){
        
        NSInteger res = [data integerValue];

        if (res == 1) {
            [SVProgressHUD showSuccessWithStatus:@"撤单成功"];
            [self.holdArr removeObjectAtIndex:0];
            [self.tab reloadData];
            
            
        }
        
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0 ? 1 : self.holdArr.count;
    
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

    WLNTradeBBHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBHeadCell"];
    
    cell.forwarder = self;
    weakSelf(self);
    
    
    
    [cell setDidBackDicBlock:^(NSMutableDictionary * _Nonnull dic, NSInteger isbuy) {
       
        
        if (isbuy == 0) {
            
            [weakself routeTargetName:Handle actionName:@"bbBuy:" param:dic];

        }else{
            [weakself routeTargetName:Handle actionName:@"bbSell:" param:dic];

        }
        
        
    }];
    
    
    return cell;
    
}

- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNTradeBBBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBBodyCell"];
    
    cell.forwarder = self;
    cell.dic = self.holdArr.firstObject;
    
    return cell;
    
    
}

- (void)menuAciton{
    
    
    NSArray *arr = @[@"",@"WLNTradeBBHoldOrderCtr",@"WLNTradeBBDelegateListCtr",@"WLNMineBBBillCtr"];
    
    NSArray *titleArr = @[@"资金划转",@"我的挂单",@"委托历史",@"币币账单"];
    
    WLNTradeAgreeCategoryView *view = [[WLNTradeAgreeCategoryView alloc]initWithArr:titleArr];
    [view show];
    
    weakSelf(self);
    [view setDidClickBLock:^(NSInteger row, NSString * _Nonnull title) {
        
        NSString *vc = arr[row];
        
        [weakself push:vc.instance title:title];
        
        
    }];
    
}

- (void)chedanAllAction{
    
    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:@"确定全部撤单吗" buttonTitles:@"取消",@"确定", nil];
    
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
       
        if (selectIndex == 1) {
            
            
            NSMutableDictionary *dic = @{}.mutableCopy;
            dic[@"userid"] = self.userModel.userid;
            [self routeTargetName:Handle actionName:@"weituoCancelAll:" param:dic];
            
            
            
        }
        
    }];
 
    
}
- (void)chedanSingleAction{
    
    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:@"确定撤单吗" buttonTitles:@"取消",@"确定", nil];
    
    weakSelf(self);
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
        
        if (selectIndex == 1) {
            
            
            NSMutableDictionary *dic = @{}.mutableCopy;
            
            dic[@"id"] = weakself.holdArr.firstObject[@"id"];
            
            dic[@"userid"] = self.userModel.userid;
            
            [self routeTargetName:Handle actionName:@"weituoCancelOne:" param:dic];
            
            
            
        }
        
        
        
    }];
    
    
}
- (void)lookAllAction{
    
    [self push:@"WLNTradeBBHoldOrderCtr".instance title:@"我的挂单"];
    
    
}
@end
