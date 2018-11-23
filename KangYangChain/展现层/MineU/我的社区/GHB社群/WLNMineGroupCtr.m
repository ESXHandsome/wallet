//
//  WLNMineGroupCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGroupCtr.h"

@interface WLNMineGroupCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titleArr;
    NSArray *_contentArrs;
    
}

@end

@implementation WLNMineGroupCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"GHB社区".Intl;
    
    _titleArr = @[@"聊天室",@"论坛",@"常见问题",@"解答问题"];
    _contentArrs = @[@"认识新朋友从这里开始吧",@"说出你的看法",@"这里有你要的答案",@"解答你不知道的问题"];
    
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self tabType:1];
    
    [self.tab registerClass:WLNMineCommunityCell.class forCellReuseIdentifier:@"WLNMineCommunityCell"];
    
    UIImageView *imagev = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 150)];
    imagev.image = [UIImage imageNamed:@"Snip20181008_3"];
    self.tab.tableHeaderView = imagev;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineCommunityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineCommunityCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.titleLab.text = _titleArr[indexPath.row];
    cell.contentLab.text = _contentArrs[indexPath.row];
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    NSArray *arr = @[@"WLNMineGLiveCtr".instance,@"WLNMineGForumCtr".instance,@"WLNMineGProblemCtr".instance,@"".instance];
    
    [self.navigationController pushViewController:arr[indexPath.row] animated:YES];

    
}


@end
