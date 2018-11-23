//
//  WLNMineFormDetailCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineFormDetailCtr.h"

@interface WLNMineFormDetailCtr ()<UITableViewDelegate,UITableViewDataSource,WLNPassValueProtocol>

@property (nonatomic, strong) UITableView *tab;

@property (nonatomic, strong) NSMutableDictionary *infoDic;

@property (nonatomic, strong) NSMutableArray *listArr;

@property (nonatomic, strong) NSMutableDictionary *lastDic;

@property (nonatomic, assign) BOOL isShowPayBtn;



@end

@implementation WLNMineFormDetailCtr

- (id)initWithData:(id)data{
    self = [super init];
    if (self) {
        
        self.lastDic = data;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情".Intl;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tab];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNMineFormTopCell.class forCellReuseIdentifier:@"WLNMineFormTopCell"];
    [self.tab registerClass:WLNMineFormBottomCell.class forCellReuseIdentifier:@"WLNMineFormBottomCell"];
    
    self.listArr = [NSMutableArray array];
    self.infoDic = [NSMutableDictionary dictionary];
    
    [self requst];
}
- (void)requst{
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = [self userModel].userid;
    dic[@"id"] = self.lastDic[@"id"];
    
    [self routeTargetName:Handle actionName:@"matchInfo:" param:dic];
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"matchInfo:"]) {
        
        self.infoDic = data[@"info"];
        self.listArr = data[@"list"];
        [self.tab reloadData];

    }else if([sel isEqualToString:@"payGHB:"]){
        
        
        
        [SVProgressHUD showSuccessWithStatus:@"支付成功"];
        
        
        
    }

    
    
}
-(BOOL)isShowPayBtn{
    
    return [self.infoDic[@"status"] integerValue] == 6 ? YES :NO;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineFormDetailHeadView *view =[[WLNMineFormDetailHeadView alloc]init];
    
    return section == 1 ? view :nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return section == 1 ? 50 : 0.1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"  ";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self top_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self bottom_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    
}
- (UITableViewCell *)top_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineFormTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineFormTopCell"];
    cell.dic = self.infoDic;
    
    return cell;
    
}
- (UITableViewCell *)bottom_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineFormBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineFormBottomCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.lastDic = self.lastDic;
    cell.dic = self.listArr[indexPath.row];
    
    
    weakSelf(self);
    
    [cell setDidPayGHBBlock:^{
        
        NSMutableDictionary *dic = weakself.listArr[indexPath.row];
        
        [weakself payActionWith:dic[@"id"]];
        
    }];
    
    
    return cell;
    
}
- (void)payActionWith:(NSString *)ids{
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = [self userModel].userid;
    dic[@"id"] = ids;
    dic[@"pwd"] = @"123456";
    
    [self routeTargetName:Handle actionName:@"payGHB:" param:dic];
    
    
    
}

- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT) style:UITableViewStylePlain];
        _tab.backgroundColor = maingray;
    }
    return _tab;
}


@end
