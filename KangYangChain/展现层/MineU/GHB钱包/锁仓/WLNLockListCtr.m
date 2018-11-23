//
//  WLNLockListCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNLockListCtr.h"

@interface WLNLockListCtr ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WLNLockListCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的锁仓";
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self tabType:1];
    
    
    [self.tab registerClass:WLNLockListBodyCell.class forCellReuseIdentifier:@"WLNLockListBodyCell"];
    
    [self.tab  registerClass:WLNLockListHeadCell.class forCellReuseIdentifier:@"WLNLockListHeadCell"];
    
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0 ) {
        
        return [self row0_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }else{
        return [self row_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
   
    
}
- (UITableViewCell *)row0_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNLockListHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNLockListHeadCell"];
    
    return cell;
    
}
- (UITableViewCell *)row_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNLockListBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNLockListBodyCell"];
    
    return cell;
    
}


@end
