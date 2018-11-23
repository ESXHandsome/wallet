//
//  WLNTradeBBOrderCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBOrderCtr.h"

@interface WLNTradeBBOrderCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNTradeBBOrderCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"币币账单".Intl;
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tab registerClass:WLNTradeBBOrderCell.class forCellReuseIdentifier:@"WLNTradeBBOrderCell"];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeBBOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBOrderCell"];
    
    return cell;
    
    
}

@end
