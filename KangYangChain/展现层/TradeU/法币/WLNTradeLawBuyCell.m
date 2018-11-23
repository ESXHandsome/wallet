//
//  WLNTradeLawBuyCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBuyCell.h"

@implementation WLNTradeLawBuyCell

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
    self.priceLab.text = [NSString stringWithFormat:@"%@ CNY",dic[@"price"]];
    self.minPriceLab.text = [NSString stringWithFormat:@"限额:%@-%@",dic[@"min"],dic[@"max"]];
    
    
}
@end
