//
//  WLNMineGForumCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/10.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGForumCtr.h"

@interface WLNMineGForumCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UIButton *myCenterBtn;
@property (nonatomic, strong) NSMutableArray *dataArrs;


@end

@implementation WLNMineGForumCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"社区".Intl;
    
    self.dataArrs = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    [self.tab registerClass:WLNHomeHotCell.class forCellReuseIdentifier:@"WLNHomeHotCell"];

    [self.view addSubview:self.addBtn];
    [self.view addSubview:self.myCenterBtn];
    

    
    [self routeTargetName:Handle actionName:@"cardList:"];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    _dataArrs = data[@"data"];
    
    [self.tab reloadData];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArrs.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNHomeHotCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeHotCell"];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    cell.dic = _dataArrs[indexPath.row];
    
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNMineGForumDetailCtr *vc = [WLNMineGForumDetailCtr new];
    vc.infoDic = _dataArrs[indexPath.row];
    [self push:vc];
    
    
}
- (void)publishAction{
    
    [self push:@"WLNMineCardPublishCtr".instance];
 
}
- (void)myCenterAction{
    
    [self push:@"WLNMineGForumMineCtr".instance];
}
- (UIButton *)addBtn{
    if (_addBtn == nil) {
        _addBtn = [[UIButton alloc]initWithFrame:CGRectMake((DEVICEWidth - 40) / 2, DEVICEHEIGHT - 130, 40, 40)];
        
        [_addBtn setBackgroundImage:@"publish".image forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(publishAction) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _addBtn;
}
- (UIButton *)myCenterBtn{
    if (_myCenterBtn == nil) {
        _myCenterBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWidth - 50, DEVICEHEIGHT - 200, 40, 40)];
        [_myCenterBtn setBackgroundImage:@"shuibo".image forState:UIControlStateNormal];
        [_myCenterBtn addTarget:self action:@selector(myCenterAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _myCenterBtn;
    
    
}
@end
