//
//  WLNMineAgreeBillCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/13.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineAgreeBillCtr.h"

@interface WLNMineAgreeBillCtr ()<UITableViewDelegate,UITableViewDataSource,WLNFloatViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNMineAgreeBillCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeAgreeOrderCell.class forCellReuseIdentifier:@"WLNTradeAgreeOrderCell"];
    
 
    WLNOrderHeadView *view = [WLNOrderHeadView shared];
    
    view.forwarder = self;
    self.tab.tableHeaderView = view;
    
    [self pullUpLoading];
    
}
- (void)pullUpLoading{
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"agreeOrder:" param:dic];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    [super result:data sel:sel];
    self.dataArr = data;
    [self.tab reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeAgreeOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeAgreeOrderCell"];
    
    cell.dic = self.dataArr[indexPath.row];
    
    return cell;
    
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
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    
    
    
    
}
@end
