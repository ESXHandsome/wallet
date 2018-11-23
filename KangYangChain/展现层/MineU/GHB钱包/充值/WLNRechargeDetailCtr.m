//
//  WLNRechargeDetailCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNRechargeDetailCtr.h"

@interface WLNRechargeDetailCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNRechargeDetailCtr

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"充值记录".Intl;
    
    
    [self tabType:1];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tab registerClass:WLNRechargeDetailCell.class forCellReuseIdentifier:@"WLNRechargeDetailCell"];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNRechargeDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNRechargeDetailCell"];
    
    
    return cell;
    
}



@end
