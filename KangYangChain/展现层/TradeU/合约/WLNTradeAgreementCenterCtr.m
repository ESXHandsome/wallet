//
//  WLNTradeAgreementCenterCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementCenterCtr.h"

@interface WLNTradeAgreementCenterCtr ()<UITableViewDelegate,UITableViewDataSource,WLNFloatViewDelegate>
{
    NSMutableArray *_biList;
    NSIndexPath *_currentIndex;
    
}
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) WLNTradeAgreeChooseBHeadView *headView;

@end

@implementation WLNTradeAgreementCenterCtr
- (CGRect)resetTabFrame{
    return CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 44 - 64);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = [NSMutableArray array];
    _biList = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeHangCell.class forCellReuseIdentifier:@"WLNTradeHangCell"];
    
    _headView= [[WLNTradeAgreeChooseBHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 30)];
    _headView.forwarder = self;
    self.tab.tableHeaderView = _headView;
    
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    
    [self routeTargetName:Handle actionName:@"holdList:" param:dic];

    [self routeTargetName:Handle actionName:@"getAgreeBiList:" param:dic];
    
}
- (void)pullUpLoading{
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"holdList:" param:dic];

}

- (void)chooseBiAction:(UITapGestureRecognizer *)tap{
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < _biList.count; i++) {
        NSDictionary *dic  = _biList[i];
        [arr addObject:dic[@"name"]];
    }
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:arr,nil];
    
    [view show];

}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    
    _headView.chooseLab.text = _biList[tag][@"name"];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    dic[@"coinid"] = _biList[tag][@"id"];
    [self routeTargetName:Handle actionName:@"holdList:" param:dic];

    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [super result:data sel:sel];
    
    
    if ([sel isEqualToString:@"getAgreeBiList:"]) {
        
        _biList = data;
      
        
    }else if ([sel isEqualToString:@"holdList:"]){
        self.dataArr = [data mutableCopy];
        [self.tab reloadData];
    }else if ([sel isEqualToString:@"agreeCancelOrder:"]){
        
        [self.dataArr removeObjectAtIndex:_currentIndex.row];
        [self.tab reloadData];
        
        [SVProgressHUD showSuccessWithStatus:@"取消成功"];
        
        
        
    }

    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeHangCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeHangCell"];
    cell.dic = self.dataArr[indexPath.row];
    
    weakSelf(self);
    
    [cell setDidCancelOrder:^{
        
        [weakself cancelOrderWith:indexPath];
        
    }];
    
    return cell;
    
}
- (void)cancelOrderWith:(NSIndexPath *)index{
    
    _currentIndex = index;
    
    NSMutableDictionary *dic =  self.dataArr[index.row];
    
    HYAlertView * alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:@"确定取消挂单?" buttonTitles:@"取消",@"确定",nil];
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
       
        if (selectIndex == 1) {
            
            NSMutableDictionary *dicp = @{}.mutableCopy;
            dicp[@"id"] = dic[@"id"];
            dicp[@"uid"] = self.userModel.userid;
            
            [self routeTargetName:Handle actionName:@"agreeCancelOrder:" param:dicp];
            
        }
        
    }];
    
    
}
@end
