//
//  WLNMineBBBillCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/13.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineBBBillCtr.h"

@interface WLNMineBBBillCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArrs;

@end

@implementation WLNMineBBBillCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账单".Intl;
    self.dataArrs = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeAgreeOrderCell.class forCellReuseIdentifier:@"WLNTradeAgreeOrderCell"];
    
    
    WLNOrderHeadView *view = [WLNOrderHeadView shared];
    view.forwarder = self;
    self.tab.tableHeaderView = view;
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"getBBBillList:" param:dic];
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArrs = (NSMutableArray *)data;
    
    [self.tab reloadData];
    
}

- (void)floatAction:(UITapGestureRecognizer *)tap{
    
    if (tap.view.tag == 0) {
        
        WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR, nil];
        
        [view show];
        
    }else{
        WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"买入",@"卖出", nil];
        
        [view show];
        
    }
    
    
    
    
}




- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArrs.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeAgreeOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeAgreeOrderCell"];
    
    NSMutableDictionary *dic = self.dataArrs[indexPath.row];
    
    cell.bibiDic = dic;
    
    
    
    return cell;
    
    
}



@end
