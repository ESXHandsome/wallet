//
//  WLNMineSecurityCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineSecurityCtr.h"

@interface WLNMineSecurityCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titleArr;
}
@property (nonatomic, strong) UITableView *tab;

@end

@implementation WLNMineSecurityCtr

- (void)viewDidLoad {
    [super viewDidLoad];

    _titleArr = @[@[@"手势密码",@"修改手势密码",@"间隔时间"],@[@"绑定邮箱",@"绑定手机号",@"设置资金密码",@"修改密码"]];
    
    
    self.title = @"账户安全";
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tab registerClass:WLNMineSecurityCell.class forCellReuseIdentifier:@"WLNMineSecurityCell"];
    
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return  @"  ";
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return [_titleArr[section]count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineSecurityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineSecurityCell"];
    
    
    cell.titleLab.text = _titleArr[indexPath.section][indexPath.row];
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}
@end
