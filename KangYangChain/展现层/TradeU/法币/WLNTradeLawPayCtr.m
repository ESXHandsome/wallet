//
//  WLNTradeLawPayCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawPayCtr.h"

@interface WLNTradeLawPayCtr ()<UITableViewDelegate,UITableViewDataSource,WLNPassValueProtocol>

@property (nonatomic, strong) NSMutableDictionary *dic;


@end

@implementation WLNTradeLawPayCtr
- (id)initWithData:(id)data{
    self = [super init];
    if (self) {
        
        self.dic = data;
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"支付";
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeLawPayCell.class forCellReuseIdentifier:@"WLNTradeLawPayCell"];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    [super result:data sel:sel];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"id"] = data[@"order_id"];
    dic[@"status"] = @"0";

    if ([self.titleStr isEqualToString:@"购买"]) {
        
        WLNTradeLawBOrderBuyDetailCtr *vc = [[WLNTradeLawBOrderBuyDetailCtr alloc]initWithData:dic];
        [self push:vc];
        
    }else if ([self.titleStr isEqualToString:@"出售"]){
        
        WLNTradeLawBOrderSellDetailCtr *vc = [[WLNTradeLawBOrderSellDetailCtr alloc]initWithData:dic];
        [self push:vc];
        
        
    }
    
    
  
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeLawPayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeLawPayCell"];
    cell.forwarder = self;
    
    cell.dic = self.dic;
    
    
    
    
    return cell;
    
}
- (void)payAction{
    
    
    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:@"确定付款吗?" buttonTitles:@"取消",@"确定", nil];
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
       
        if (selectIndex == 1) {
            
            NSMutableDictionary *dic = @{}.mutableCopy;
            dic[@"limit_id"] = self.dic[@"limit_id"];
            dic[@"id"] = self.userModel.userid;;
            dic[@"num"] = self.dic[@"num"];
        
            [self routeTargetName:Handle actionName:[self.titleStr isEqualToString:@"c2cBuyLastAction"] ?@"c2cBuyLastAction:" : @"c2cSellLastAction:" param:dic];
            
            [SVProgressHUD showWithStatus:@"处理中"];
            
            
        }
        
    }];
 
    
    
    
}
@end
