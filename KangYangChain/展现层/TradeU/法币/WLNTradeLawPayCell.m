//
//  WLNTradeLawPayCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawPayCell.h"

@implementation WLNTradeLawPayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    self.priceLab.text = dic[@"price"];
    self.numLab.text = dic[@"num"];
    
    self.totalLab.text = [NSString stringWithFormat:@"%f",[dic[@"price"] floatValue] *[dic[@"num"]floatValue]];
    
    

    
    
}



@end
