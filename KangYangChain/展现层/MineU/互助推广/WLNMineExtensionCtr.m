//
//  WLNMineExtensionCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineExtensionCtr.h"

@interface WLNMineExtensionCtr ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UITableView *tab;

@end

@implementation WLNMineExtensionCtr


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"算力挖矿".Intl;
    
    self.dataArr = [NSMutableArray array];
    [self.view addSubview:self.tab];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self.tab registerClass:WLNMineExtensionInfoCell.class forCellReuseIdentifier:@"WLNMineExtensionInfoCell"];
    [self.tab registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    
    
    
    WLNShopADView *view = [[WLNShopADView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 150)];
    
    
    self.tab.tableHeaderView = view;
    
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArr = (NSMutableArray *)data;
 
    [self.tab reloadData];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self matchList];
    
}

- (void)matchList{
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = [self userModel].userid;
    dic[@"page"] = @"1";
    
    [self routeTargetName:Handle actionName:@"matchList:" param:dic];
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNMineExtensionInfoView *view = [[WLNMineExtensionInfoView alloc]init];
    
    
    return section == 1 ? view: nil;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return section == 1 ? 93 :0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0 ? 1 : self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self apply_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
    return  [self info_tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
    
}
- (UITableViewCell *)apply_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"申请报单";
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
    
    
}
- (UITableViewCell *)info_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineExtensionInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineExtensionInfoCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.dic = self.dataArr[indexPath.row];
    
    weakSelf(self);
    
    [cell setDidClickSell:^{
        
        WLNMineSellOutCtr *vc = [[WLNMineSellOutCtr alloc]initWithData:weakself.dataArr[indexPath.row]];
        
        [weakself.navigationController pushViewController:vc animated:YES];
    
        
    }];
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        
        WLNMineApplyFromCtr *vc = [[WLNMineApplyFromCtr alloc]init];
   
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        
        
        WLNMineFormDetailCtr *vc = [[WLNMineFormDetailCtr alloc]initWithData:self.dataArr[indexPath.row]];
     
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
        
    }

}
- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 64) style:UITableViewStylePlain];
        _tab.backgroundColor = maingray;
        
    }
    return _tab;
}


@end
