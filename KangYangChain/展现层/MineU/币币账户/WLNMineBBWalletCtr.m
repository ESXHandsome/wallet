//
//  WLNMineBBWalletCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/12.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineBBWalletCtr.h"

@interface WLNMineBBWalletCtr ()<UITableViewDelegate,UITableViewDataSource,WLNFloatViewDelegate>
@property (nonatomic, strong) NSMutableArray *biListArr;

@property (nonatomic, strong) NSMutableArray *detailArr;

@property (nonatomic, strong) NSMutableDictionary *infoDic;

@property (nonatomic, strong) WLNWalletHeadView *headView;
@end

@implementation WLNMineBBWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"币币账户".Intl;
    
    self.infoDic = [NSMutableDictionary dictionary];
    self.detailArr = [NSMutableArray array];
    
    self.biListArr = [NSMutableArray array];
    
    [self tabType:2];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self.tab registerClass:WLNWalletBodyCell.class forCellReuseIdentifier:@"WLNWalletBodyCell"];
    
    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];
    
    
    
    self.tab.tableHeaderView = self.headView;
    
    
    
    /***/
    [self routeTargetName:Handle actionName:@"bbTypeList:"];
    
    
    /***/
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    
    [self routeTargetName:Handle actionName:@"getBBBillDetailList:" param:dic];
    
    
    dic[@"cid"] = @"1";
    [self routeTargetName:Handle actionName:@"bbAcount:" param:dic];
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"bbTypeList:"]) {
        
        self.biListArr = data;
        
    }else if ([sel isEqualToString:@"bbAcount:"]){
        
        
        self.infoDic = data;
        self.headView.dic = self.infoDic;
        
        
        
    }else if ([sel isEqualToString:@"getBBBillDetailList:"]){
        
        self.detailArr = data;
        [self.tab reloadData];
        
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 40 : 0.1;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineSmallView *view = [[WLNMineSmallView alloc]init];
    return section == 0 ? view : 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0 ? 1: self.detailArr.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }else{
        return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    WLNWalletHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletHeadCell"];
    
    return cell;
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNWalletBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletBodyCell"];
    
    cell.dic = self.detailArr[indexPath.row];
    
    return cell;
    
}
- (void)changeBiAction:(UITapGestureRecognizer *)tap{
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0;i < _biListArr.count ; i++) {
        
        NSMutableDictionary *dic = _biListArr [i];
        
        [arr addObject:dic[@"english_name_abb"]];
        
    }
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:arr, nil];
    
    
    [view show];
    
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    NSDictionary *dic = _biListArr[tag];
    
    
    
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
    dicp[@"uid"] = self.userModel.userid;
    dicp[@"cid"] = dic[@"cid"];
    
    [self routeTargetName:Handle actionName:@"bbAcount:" param:dicp];
    
    
}

- (void)clickAction:(UITapGestureRecognizer *)tap{
    
    
    NSArray *arr = @[[WLNChangeCtr new],[WLNMineBBBillCtr new]];
    UIViewController *vc = arr[tap.view.tag];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        
        [self.navigationController pushViewController:[WLNWalletDetailCtr new] animated:YES];
        
    }
    
}
- (WLNWalletHeadView *)headView{
    if (_headView == nil) {
        _headView = [[WLNWalletHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 250)];
        _headView.forwarder = self;
    }
    return _headView;
}



@end
