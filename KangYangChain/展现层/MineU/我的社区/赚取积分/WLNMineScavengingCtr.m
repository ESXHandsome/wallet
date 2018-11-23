//
//  WLNMineScavengingCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/11.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineScavengingCtr.h"

@interface WLNMineScavengingCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *linkLab;
@property (nonatomic, strong) UITableView *tab;

@property (nonatomic, strong) NSMutableArray *dataArrs;



@end

@implementation WLNMineScavengingCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫码赠送".Intl;
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.dataArrs = [NSMutableArray array];
    

    
    [self.tab registerClass:WLNMineScavengingCell.class forCellReuseIdentifier:@"WLNMineScavengingCell"];
    
    
    NSString *str = [NSString stringWithFormat:@"%@/#/register-moblie?parent=%@",@Address_Domain,self.userModel.userid];
    
    self.img.image = [[WLNQRCode new] jy_QRCodeFromString:str size:100];
    
    self.linkLab.text = str;
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"yaoqingList:" param:dic];
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    self.dataArrs = data;
    
    [self.tab reloadData];
    
}


- (void)copyAction{
    
    [SVProgressHUD showSuccessWithStatus:@"复制成功"];
    
    [self.linkLab.text copyCustum];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 65;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WLNMineScanHeadView *view = [WLNMineScanHeadView shared];
    view.topArr = @[@"邀请记录"].mutableCopy;
    view.bottomArr = @[@"时间",@"佣金",@"返佣者"].mutableCopy;
    
    
    [view setDidTopClick:^{
        
        
    }];
    
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineScavengingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineScavengingCell"];
    
    cell.dic = self.dataArrs[indexPath.row];
    
    return cell;
    
}

@end
