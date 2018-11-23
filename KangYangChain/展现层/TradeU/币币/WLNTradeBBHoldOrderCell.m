//
//  WLNTradeBBHoldOrderCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/10.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBHoldOrderCell.h"

@implementation WLNTradeBBHoldOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    if (dic == nil) {
        return;
    }
    
    self.numLab.text = [NSString stringWithFormat:@"委托数量:%@",dic[@"entrust_total"]];
    
    self.priceLab.text = [NSString stringWithFormat:@"委托价格:%@",dic[@"entrust_price"]];
    
    self.allPriceLab.text = [NSString stringWithFormat:@"委托金额:%@",dic[@"entrust_money"]];
    
    self.allNumLab.text = [NSString stringWithFormat:@"已成交数量:%@",dic[@"already"]];
    
    self.averagePriceLab.text =  [NSString stringWithFormat:@"成交均价:%@",dic[@"average_price"]];
    
    self.timeLab.text = dic[@"entrust_time"];
    
    
    NSString *str = dic[@"cion"];
    
    if ([dic[@"direction"] integerValue] == 0) {
        //Mairu
        self.typeLab.text = [NSString stringWithFormat:@"买入(%@)",str];
        self.typeLab.textColor = cusgreen;
        
    }else{
        //卖出
        self.typeLab.text = [NSString stringWithFormat:@"卖出(%@)",str];
        self.typeLab.textColor = cusred;
        
    }
    
    // status
    
    NSString *status = dic[@"status"];
    
    if ([status isEqualToString:@"0"]) {
        self.statusLab.text = @"未成交";
    }else if ([status isEqualToString:@"1"]){
        self.statusLab.text = @"已成交";
    }else if ([status isEqualToString:@"2"]){
        self.statusLab.text = @"委托取消";
        
    }
    
    
    
    
    
    
}
@end
