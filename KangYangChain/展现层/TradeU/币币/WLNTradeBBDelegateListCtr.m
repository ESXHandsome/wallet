//
//  WLNTradeBBDelegateListCtr.m
//  KangYangChain
//
//  Created by furao on 2018/11/10.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeBBDelegateListCtr.h"

@interface WLNTradeBBDelegateListCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNTradeBBDelegateListCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    [self.tab registerClass:WLNTradeHangCell.class forCellReuseIdentifier:@"WLNTradeHangCell"];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"userid"] = self.userModel.userid;
    dic[@"coin"] = @"null";
    [self routeTargetName:Handle actionName:@"weituoAllHisList:" param:dic];
   
}
- (void)result:(id)data sel:(NSString *)sel{
    
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
    
    
    WLNTradeHangCell *cell =[tableView dequeueReusableCellWithIdentifier:@"WLNTradeHangCell"];
    cell.dic = self.dataArr[indexPath.row];
    return cell;
   
}


@end
