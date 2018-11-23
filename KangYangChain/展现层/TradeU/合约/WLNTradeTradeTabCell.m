//
//  WLNTradeTradeTabCell.m
//  KangYangChain
//
//  Created by furao on 2018/11/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeTradeTabCell.h"

@implementation WLNTradeTradeTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.priceLab.text = [NSString stringWithFormat:@"%@",dic[@"entrust_price"]];
    self.timeLab.text = dic[@"entrust_total"];
    
    
}
- (void)setDic2:(NSMutableDictionary *)dic2{
    
    self.priceLab.text = [NSString stringWithFormat:@"%@",dic2[@"price"]];
    self.timeLab.text = dic2[@"time"];
}
- (void)setColors:(UIColor *)colors{
    
    self.priceLab.textColor = colors;
    self.timeLab.textColor = colors;
    
    
}
@end
