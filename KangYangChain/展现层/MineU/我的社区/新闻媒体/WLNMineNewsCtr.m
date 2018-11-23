//
//  WLNMineNewsCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineNewsCtr.h"

@interface WLNMineNewsCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNMineNewsCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻媒体";
    self.dataArr = [NSMutableArray array];
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    [self.tab registerClass:WLNMineCommunityCell.class forCellReuseIdentifier:@"WLNMineCommunityCell"];
    
    
    [self routeTargetName:Handle actionName:@"newsCategory:"];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArr = data;
    [self.tab reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineCommunityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineCommunityCell"];
    cell.dic = self.dataArr[indexPath.row];
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *str = [NSString stringWithFormat:@"%@?id=%@",NewDetailHtml,self.dataArr[indexPath.row][@"id"]];
    NSString *title = self.dataArr[indexPath.row][@"name"];
    
    [self push:@"WLNHTMLCtr".instance box:str title:title];
    
  
    
}
@end
