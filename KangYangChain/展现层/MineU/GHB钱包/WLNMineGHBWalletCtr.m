//
//  WLNMineGHBWalletCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGHBWalletCtr.h"

@interface WLNMineGHBWalletCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    WLNMineGHBHeadView *_headView;;
}
@property (nonatomic, strong) NSMutableDictionary *GHBInfoDic;

@property (nonatomic, strong) NSMutableArray *logArrs;


@end

@implementation WLNMineGHBWalletCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的GHB钱包".Intl;
    
    self.GHBInfoDic = [NSMutableDictionary dictionary];
    self.logArrs = [NSMutableArray array];
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNWalletHeadCell.class forCellReuseIdentifier:@"WLNWalletHeadCell"];
    [self.tab registerClass:WLNMineGHBBodyCell.class forCellReuseIdentifier:@"WLNMineGHBBodyCell"];
    
    
   _headView= [[WLNMineGHBHeadView alloc]initWithFrame:CGRectMake(0 , 0, DEVICEWidth, 250)];
    _headView.forwarder = self;
    

    self.tab.tableHeaderView = _headView;
   
    [self pullUpLoading];
    
}
- (void)pullUpLoading{
    
    [self routeTargetName:Handle actionName:@"GHBinfo:"];
    
    [self routeTargetName:Handle actionName:@"GHBLogAction:"];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [super result:data sel:sel];
    
    if ([sel isEqualToString:@"GHBinfo:"]) {
        
        self.GHBInfoDic = data;
        _headView.dic = data;

        
    }else if ([sel isEqualToString:@"GHBLogAction:"]){
        
        self.logArrs = data[@"data"];
        [self.tab reloadData];
        
    }
    
}

- (void)clickAction:(UITapGestureRecognizer *)tap{
    
    
    [self.navigationController pushViewController:tap.view.tag == 0 ? @"WLNRechargeCtr".instance: @"WLNLockCtr".instance animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : self.logArrs.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.logArrs.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 40: 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineSmallView *view = [[WLNMineSmallView alloc]init];
    view.titleLab.text = @"账单明细";
    
    return section == 0 ? view : nil;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNWalletHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletHeadCell"];
    
    cell.bottomView.hidden = YES;
    cell.bottom2View.hidden = NO;

    return cell;
    
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineGHBBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineGHBBodyCell"];
    
    cell.dic = self.logArrs[indexPath.row];
    
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

@end
