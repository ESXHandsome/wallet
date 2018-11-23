//
//  WLNMinePaySetCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMinePaySetCtr.h"

@interface WLNMinePaySetCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tab;
@end

@implementation WLNMinePaySetCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tab registerClass:WLNMineSecurityCell.class forCellReuseIdentifier:@"WLNMineSecurityCell"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineSecurityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineSecurityCell"];
    
    return cell;
    
}
@end
