//
//  WLNTradeTradeHeadCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeTradeHeadCell.h"

@implementation WLNTradeTradeHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.leftLab.text = dic[@"name"];
    self.centerLab.text = dic[@"price"];
    
    
    double scale = [dic[@"scale"] doubleValue];
    if (scale > 0) {
        self.rightLab.text = [NSString stringWithFormat:@"+%f%%",scale];
        self.rightLab.textColor = rgba(81, 184, 116, 1);
    }else{
        self.rightLab.text = [NSString stringWithFormat:@"%f%%",scale];
        self.rightLab.textColor = rgba(231, 100, 96, 1);
    }
    
}
@end
