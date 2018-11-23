//
//  WLNRSendMoneyCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNRSendMoneyCtr.h"

@interface WLNRSendMoneyCtr ()<WLNFloatViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    
    NSString *_cunrrentB;
    
    NSMutableDictionary *_lastinfoDic;
    
}
@property (nonatomic, strong) WLNRSendMoneyCell *cusCell;


@end

@implementation WLNRSendMoneyCtr

- (id)initWithData:(id)data{
    if (self = [super init]) {
        
        _lastinfoDic = data;
        
        _cunrrentB = data[@"coin_type"];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提币".Intl;
    
    [self tabType:1];

    self.tab.delegate = self;
    self.tab.dataSource = self;
    
    
    [self.tab registerClass:WLNRSendMoneyCell.class forCellReuseIdentifier:@"WLNRSendMoneyCell"];
    

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNRSendMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNRSendMoneyCell"];
    _cusCell = cell;
    
    cell.typeLab.text = _cunrrentB;
    cell.canUseLab.text = [NSString stringWithFormat:@"可以提币数量:%@ %@",_lastinfoDic[@"total"],_cunrrentB];
    
    cell.forwarder = self;

    return cell;
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)result:(id)data sel:(NSString *)sel{
    
    [super result:data sel:sel];
    
    if ([sel isEqualToString:@"propertySendB:"]) {
        
        [SVProgressHUD showSuccessWithStatus:@"已发送"];
        [self.navigationController popViewControllerAnimated:YES];

    }else if ([sel isEqualToString:@"getBCode:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"获取成功"];
        
        
        
    }else if ([sel isEqualToString:@"propertyHome:"]){
        
        _lastinfoDic = data;
        [self.tab reloadData];

    }

}
- (void)addressChooseAction{
    
    [self push:@"WLNAdressListCtr".instance];
    
    
}
- (void)getCodeAction{
    
    [self routeTargetName:Handle actionName:@"getBCode:"];
    
    
}
- (void)sendAction{
    
    if (_cusCell.addressTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"地址格式不正确"];
        return;
    }
    if (_cusCell.numTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
    }
    
    
    [SVProgressHUD show];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
   
    dic[@"coin_type"] = _cunrrentB;
    dic[@"address"] = _cusCell.addressTxt.text;
    dic[@"amount"] = _cusCell.numTxt.text;
    dic[@"code"] = _cusCell.codeTxt.text;
    dic[@"pass"] = _cusCell.pwdTxt.text;
    
    
    [self routeTargetName:Handle actionName:@"propertySendB:" param:dic];
    

    
}
- (void)chooseAction:(UITapGestureRecognizer *)tap{
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR, nil];
    
    [view show];

}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _cunrrentB =  BI_TITLE_ARR[tag];
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"coin_type"] = _cunrrentB;
    [self routeTargetName:Handle actionName:@"propertyHome:" param:dic];


    
}
- (void)saoAction{
    
    WLNScanCtr *vc = [WLNScanCtr new];
    [self push:vc];
    
    weakSelf(self);
    
    [vc setDidResultBackBlock:^(NSString * _Nonnull str) {
        
        weakself.cusCell.addressTxt.text = str;
        
    }];
    
    
}
- (void)allAction{
    
    _cusCell.numTxt.text = _lastinfoDic[@"total"];
    

}

@end
