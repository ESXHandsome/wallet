//
//  WLNTradeAgreeCloseCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreeCloseCtr.h"

@interface WLNTradeAgreeCloseCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNTradeAgreeCloseCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeAgreeCloseCell.class forCellReuseIdentifier:@"WLNTradeAgreeCloseCell"];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"closeAgreeLog:" param:dic];
    
    
}
- (void)pullUpLoading{
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"closeAgreeLog:" param:dic];
    
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
    
    
    
    WLNTradeAgreeCloseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeAgreeCloseCell"];
    cell.dic = self.dataArr[indexPath.row];
    return cell;
  
}

@end
