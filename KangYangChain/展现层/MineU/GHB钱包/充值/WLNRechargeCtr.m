//
//  WLNRechargeCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/18.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNRechargeCtr.h"

@interface WLNRechargeCtr ()

{
    WLNRechargeView *_cusView;
}

@end

@implementation WLNRechargeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值".Intl;
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"充值记录" style:UIBarButtonItemStyleDone target:self action:@selector(rechargeHis)];

    
    _cusView = [[WLNRechargeView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 64)];
    _cusView.forwarder =self;
    self.view = _cusView;
    
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD showSuccessWithStatus:@"充值成功"];
    
    DISPATH_AFTER(1, ^{
        
        [self customPop];

    });
    
}

- (void)sureAction{
    
    if (_cusView.numTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入金额"];
        return;
    }
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"amount"] = _cusView.numTxt.text;
    [self routeTargetName:Handle actionName:@"GHBRecharge:" param:dic];
    
    
}
- (void)rechargeHis{
 
    [self.navigationController pushViewController:@"WLNRechargeListCtr".instance animated:YES];
    
}

@end
