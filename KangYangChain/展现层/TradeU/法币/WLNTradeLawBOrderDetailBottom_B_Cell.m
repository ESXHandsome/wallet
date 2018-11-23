//
//  WLNTradeLawBOrderDetailBottom_B_Cell.m
//  KangYangChain
//
//  Created by edz on 2018/11/14.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBOrderDetailBottom_B_Cell.h"

@implementation WLNTradeLawBOrderDetailBottom_B_Cell

- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic == nil) {
        return;
    }
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
    self.getMoneyTimeLab.text = dic[@"from_time"];
}
@end
