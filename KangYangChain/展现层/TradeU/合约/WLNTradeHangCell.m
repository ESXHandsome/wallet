//
//  WLNTradeHangCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeHangCell.h"

@implementation WLNTradeHangCell

- (void)setDic:(NSMutableDictionary *)dic{
    
    self.timeLab.text = dic[@"time"];
    self.amountLab.text = [NSString stringWithFormat:@"冻结:%@",dic[@"amount"]];
    
    self.maxlineLab.text = [NSString stringWithFormat:@"止盈:%@",dic[@"maxline"]];
    self.minlineLab.text = [NSString stringWithFormat:@"止损:%@",dic[@"minline"]];
    self.numLab.text = [NSString stringWithFormat:@"数量:%@",dic[@"num"]];
    self.priceLab.text = [NSString stringWithFormat:@"挂单价:%@",dic[@"price"]];
    
    
    
    if ([dic[@"type"] integerValue] == 1) {
        
        self.typeLab.text = [NSString stringWithFormat:@"买涨(%@/USDT %@X)",dic[@"coinname"],dic[@"lever"]];
        self.typeLab.textColor = cusgreen;
        
    }else if([dic[@"type"] integerValue] == 2){
        
        self.typeLab.text = [NSString stringWithFormat:@"买跌(%@/USDT %@X)",dic[@"coinname"],dic[@"lever"]];

        self.typeLab.textColor = cusred;

    }
    
    
}
- (void)cancelOrderAction{
    
    if (_didCancelOrder) {
        _didCancelOrder();
        
    }
    
    
}
@end
