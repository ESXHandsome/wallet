//
//  WLNTradeLawBOrderDetailBottom_A_Cell.m
//  KangYangChain
//
//  Created by edz on 2018/11/14.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBOrderDetailBottom_A_Cell.h"

@implementation WLNTradeLawBOrderDetailBottom_A_Cell

- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic == nil) {
        return;
    }
    
    _dic = dic;
    
    self.toUserLab.text = dic[@"from_name"];
    
    NSInteger payType = [dic[@"pay_type"] integerValue];
    
    if (payType == 1) {
        self.payTypeLab.text = @"银行卡";

    }else if (payType == 2){
        self.payTypeLab.text = @"支付宝";
    }else if (payType == 3){
        self.payTypeLab.text = @"微信";
        
    }
    
    self.payMoneyLab.text = dic[@"amount"];
    self.payTimeLab.text = dic[@"to_time"];
    
    self.cut.timestamp = [dic[@"time"] integerValue];
    weakSelf(self);
    [self.cut setDidChangeBlock:^(NSInteger minute, NSInteger second) {
        
        weakself.timeLab.text = [NSString stringWithFormat:@"%ld分%ld秒后自动放币",minute,second];

    }];

    
    
}
- (void)callUserAction{
    
    [@"13968111662" call];
    
}
- (CZCountDownView *)cut{
    if (_cut == nil) {
        _cut = [CZCountDownView countDown];
        
    }
    return _cut;
    
}

@end
