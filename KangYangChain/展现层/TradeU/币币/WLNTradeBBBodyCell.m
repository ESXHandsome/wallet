//
//  WLNTradeBBBodyCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBBodyCell.h"

@implementation WLNTradeBBBodyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
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
    self.timeLab.text = dic[@"entrust_time"];
    
    
    self.weituoLab.text = dic[@"entrust_total"];
    self.chengjiaoLab.text = dic[@"already"];
    self.priceLab.text = dic[@"entrust_price"];

    
    
}
@end
