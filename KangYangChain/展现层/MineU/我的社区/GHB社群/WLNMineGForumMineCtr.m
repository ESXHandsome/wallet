//
//  WLNMineGForumMineCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/8.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGForumMineCtr.h"

@interface WLNMineGForumMineCtr ()
<
UITableViewDelegate,
UITableViewDataSource,
WMYActionSheetDelegate
>
{
    NSIndexPath * _currentIndex;
    
}
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNMineGForumMineCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心".Intl;
    
    
    self.dataArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    [self.tab registerClass:WLNHomeHotCell.class forCellReuseIdentifier:@"WLNHomeHotCell"];
    
    
    [self routeTargetName:Handle actionName:@"myCardList:"];
    
}
        
- (void)result:(id)data sel:(NSString *)sel{
    
    
    if ([sel isEqualToString:@"myCardList:"]) {
        
        self.dataArr = [data[@"data"] mutableCopy];
        
    }else if ([sel isEqualToString:@"myCardDelete:"]){
        
        [self.dataArr removeObjectAtIndex:_currentIndex.row];
        
        [SVProgressHUD showSuccessWithStatus:@"删除成功"];
        
    }
  
    [self.tab reloadData];

    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNHomeHotCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeHotCell"];
    cell.index = indexPath;
    
    cell.dic = self.dataArr[indexPath.row];
    
    
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)];
    [cell addGestureRecognizer:longTap];
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineGForumDetailCtr *vc = [WLNMineGForumDetailCtr new];
    vc.infoDic = self.dataArr[indexPath.row];
    [self push:vc];
    
    
}
- (void)longTap:(UILongPressGestureRecognizer *)tap{
    
    if (tap.state == UIGestureRecognizerStateBegan) {//手势开始
        
        WLNHomeHotCell *cell = (WLNHomeHotCell *)tap.view;
        _currentIndex = cell.index;
        
        
        WMYActionSheet *sheet = [[WMYActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:nil, nil];
        
        [sheet show];
        
    }
 
}
- (void)actionSheet:(WMYActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex == 1) {
        NSMutableDictionary *dic = @{}.mutableCopy;
        dic[@"id"] = self.dataArr[_currentIndex.row][@"id"];
        [self routeTargetName:Handle actionName:@"myCardDelete:" param:dic];
        
    }
 
}


@end
