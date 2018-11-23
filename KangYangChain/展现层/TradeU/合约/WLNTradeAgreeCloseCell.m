//
//  WLNTradeAgreeCloseCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/15.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreeCloseCell.h"

@implementation WLNTradeAgreeCloseCell

- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic == nil) {
        return;
    }
    
    if ([dic[@"type"] integerValue] == 1) {
        
        self.typeLab.text = [NSString stringWithFormat:@"买涨(%@/USDT %@X)",dic[@"coinname"],dic[@"lever"]];
        self.typeLab.textColor = cusgreen;
        
    }else if([dic[@"type"] integerValue] == 2){
        
        self.typeLab.text = [NSString stringWithFormat:@"买跌(%@/USDT %@X)",dic[@"coinname"],dic[@"lever"]];
        
        self.typeLab.textColor = cusred;
        
    }
    
    
    self.chicangPriceLab.text = [NSString stringWithFormat:@"持仓价:%@",dic[@"price"]];
    self.chicangliangLab.text = [NSString stringWithFormat:@"持仓量:%@",dic[@"num"]];
    self.zhiyingLab.text = [NSString stringWithFormat:@"止盈:%@",dic[@"maxline"]];
    self.zhisunLab.text = [NSString stringWithFormat:@"止损%@",dic[@"minline"]];
    self.dongjieLab.text = [NSString stringWithFormat:@"冻结:%@",dic[@"amount"]];
    self.pingcangjiaLab.text = [NSString stringWithFormat:@"平仓价%@:",dic[@"close_price"]];
    self.zhisunLab.text = [NSString stringWithFormat:@"止损:%@",dic[@"minline"]];
    self.yingkuiLab.text = [NSString stringWithFormat:@"盈亏:%@",dic[@"access"]];
    self.timeLab.text = dic[@"time"];

    
    NSInteger close_type = [dic[@"close_type"] integerValue];
    NSArray *arr = @[@"手动平仓",@"止盈平仓",@"止损平仓",@"爆仓"];
    self.closeTypeLab.text = arr[close_type - 1];
    
    
}
@end
