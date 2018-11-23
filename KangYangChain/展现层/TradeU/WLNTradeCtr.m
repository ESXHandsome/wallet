//
//  WLNTradeCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeCtr.h"

@interface WLNTradeCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isChange;
    WLNTradeHeadView *_headView;
    
}
@property (nonatomic, strong) NSMutableArray *biArr;
@property (nonatomic, strong) NSMutableArray *biNameArr;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNTradeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易所".Intl;
    
    self.biArr = [NSMutableArray array];
    self.biNameArr = [NSMutableArray array];
    
    self.dataArr = [NSMutableArray array];
    
    
    [self tabType:0];
    self.tab.delegate = self;
    self.tab.dataSource = self;

    [self.tab registerClass:WLNTradeCell.class forCellReuseIdentifier:@"WLNTradeCell"];
    
    _headView = [WLNTradeHeadView shared];
    _headView.topArr = @[@"行情".Intl,@"C2C".Intl,@"币币".Intl,@"合约".Intl].mutableCopy;
    self.tab.tableHeaderView = _headView;

    
    weakSelf(self);
    
    [_headView setDidClickTopBLock:^(NSInteger tag) {
    
        
        [weakself gotoNext:tag];
        
        
    }];
    
    [_headView setDidClickBottomBLock:^(NSInteger tag) {
       
        [weakself changeDataSource:tag];
        
    }];
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"marketBiList:" param:dic];
    
    NSMutableDictionary *dicp = [NSMutableDictionary dictionary];
    dicp[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"marketList:" param:dicp];
    
    
    
    

}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"marketBiList:"]) {
        
        self.biArr = data;
        for (int i = 0; i < self.biArr.count; i ++) {
            
            NSMutableDictionary *dic = self.biArr[i];
            [self.biNameArr addObject:dic[@"name"]];
            
        }
        
        _headView.bottomArr = self.biNameArr;

      
    }else if ([sel isEqualToString:@"marketList:"]){
        
        self.dataArr = data;
        [self.tab reloadData];
        
        
    }
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (void)changeDataSource:(NSInteger)tag{
    _isChange = tag == 4 ? YES :NO;
 
    
    NSMutableDictionary *dicp = [NSMutableDictionary dictionary];
    dicp[@"uid"] = self.userModel.userid;
    dicp[@"coinid"] = self.biArr[tag][@"id"];
    [self routeTargetName:Handle actionName:@"marketList:" param:dicp];
 

}
- (void)gotoNext:(NSInteger)tag{
    
    
    if (tag == 0) {
        return;
    }
    
    NSArray *arr = @[@"",@"WLNTradeLawCionCtr".instance,@"WLNTradeBBCtr".instance,@"WLNTradeAgreementCtr".instance];
    NSArray *titleArr = @[@"行情".Intl,@"C2C".Intl,@"币币".Intl,@"合约".Intl];
    
    
    [self push:arr[tag] title:titleArr[tag]];

    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"RGH";
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeCell"];
    cell.dic=  self.dataArr[indexPath.row];
    
    cell.cellect.hidden = !_isChange;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"dsfdsa");
    
}


@end
