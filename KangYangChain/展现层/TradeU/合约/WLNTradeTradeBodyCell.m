//
//  WLNTradeTradeBodyCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeTradeBodyCell.h"

@implementation WLNTradeTradeBodyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.timeLab.text = dic[@"time"];
    NSInteger type = [dic[@"type"] integerValue];
    
    if (type == 1) {
        self.typeLab.text =  @"买涨";
        self.typeLab.textColor = cusgreen;
    }else{
        self.typeLab.text = @"买跌";
        self.typeLab.textColor = cusred;

    }
    
    
    self.numLab.text = dic[@"num"];
    self.priceLab.text = dic[@"price"];

}
@end
