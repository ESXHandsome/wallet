//
//  WLNTradeLawBPublishCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBPublishCtr.h"

@interface WLNTradeLawBPublishCtr ()<UITableViewDelegate,UITableViewDataSource,WLNFloatViewDelegate,WLNSimpleHeadViewDelegate>
{
    NSInteger _currrentIndex;
    WLNTradeLawBPublishCell *_publishCell;
    NSString *_price_type;
    NSMutableDictionary *_buyLimitDic;
    NSMutableDictionary *_SellLimitDic;
    
    NSInteger _priceChoose;
    

    
}
@end

@implementation WLNTradeLawBPublishCtr

- (CGRect)resetTabFrame{
    
    return CGRectMake(0, 45, DEVICEWidth, DEVICEHEIGHT - 64 - 45);
    
}
- (void)setDefaultParameter{
    
    _price_type = @"1";
    _buyLimitDic = [NSMutableDictionary dictionary];
    _SellLimitDic = [NSMutableDictionary dictionary];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布委托单".Intl;
    
    [self setDefaultParameter];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    [self tabType:1];
    
    
    [self.tab registerClass:WLNTradeLawBPublishCell.class forCellReuseIdentifier:@"WLNTradeLawBPublishCell"];
    
    WLNSimpleHeadView *view = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"购买",@"出售"]];
    
    [self.view addSubview:view];
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"id"] = self.userModel.userid;
    
    [self routeTargetName:Handle actionName:@"c2cBuyLimit:" param:dic];
    [self routeTargetName:Handle actionName:@"c2cSellLimit:" param:dic];
    
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    NSLog(@"%@",data);

    if ([sel isEqualToString:@"c2cWeituoPublishBuy:"] || [sel isEqualToString:@"c2cWeituoPublishSell:"]) {
    
        
        if (_didPublishDone) {
            _didPublishDone();
        }
        
        [SVProgressHUD showSuccessWithStatus:@"发布成功"];
        DISPATH_AFTER(1, ^{
            
            [self.navigationController popViewControllerAnimated:YES];
            
        });
    
    }else if ([sel isEqualToString:@"c2cBuyLimit:"]){
        
        _buyLimitDic = [data mutableCopy];
        [self.tab reloadData];
        
    }else if ([sel isEqualToString:@"c2cSellLimit:"]){

        _SellLimitDic = data;
        [self.tab reloadData];
        
        
    }
}
//- (void)faild:(id)data sel:(NSString *)sel{
//    
//    
//    
//    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:data buttonTitles:@"取消",@"划转", nil];
//    
//    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
//        
//        
//        
//        
//        
//    }];
//    
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeLawBPublishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawBPublishCell"];
    cell.forwarder = self;
    _publishCell = cell;
    
    
    cell.buyDic = _buyLimitDic;
    
    return cell;
    
}
- (void)publishAction{
    
    
    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:@"确定发布吗?" buttonTitles:@"取消",@"确定", nil];
    
    weakSelf(self);
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
        
        if (selectIndex == 1) {
            [weakself reqsetPublish];
        }
        
    }];
    
    
  
    
    
}
- (void)reqsetPublish{
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"price_type"] = _price_type;
    dic[@"price"] = _publishCell.valueLab.text;
    dic[@"number"] = _publishCell.numTxt.text;
    dic[@"level_limit"] = @"";
    dic[@"min_quota"] = _publishCell.minTxt.text;
    dic[@"max_quota"] = _publishCell.maxTxt.text;
    dic[@"id"] = self.userModel.userid;
    dic[@"flag"] = @"1";
    
    if (_currrentIndex == 0) {
        
        [self routeTargetName:Handle actionName:@"c2cWeituoPublishBuy:" param:dic];
        
        
    }else{
        
        
        [self routeTargetName:Handle actionName:@"c2cWeituoPublishSell:" param:dic];
        
    }
    
}
- (void)choosePriceAction:(UITapGestureRecognizer *)tap{
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"固定价格",@"浮动价格", nil];
    
    [view show];
    
    
    
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    
    _buyLimitDic[@"priceChooseType"] = @(tag);
    
    [self.tab reloadData];
    
}
- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _currrentIndex = tag;

}
@end
