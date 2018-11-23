//
//  WLNTradeBBOpenRightCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBOpenRightCell.h"

@implementation WLNTradeBBOpenRightCell

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
    self.cionLab.text = dic[@"currency"];
    
    
    if ([dic[@"rise"] floatValue] > 0) {
        
        self.zhangdieLab.text = [NSString stringWithFormat:@"+%@%%",dic[@"rise"]];
        self.zhangdieLab.textColor = cusgreen;
    }else{
        self.zhangdieLab.text = [NSString stringWithFormat:@"%@%%",dic[@"rise"]];
        self.zhangdieLab.textColor = cusred;
    }
    
    
    
}
@end
