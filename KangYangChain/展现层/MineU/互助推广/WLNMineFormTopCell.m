//
//  WLNMineFormTopCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineFormTopCell.h"

@implementation WLNMineFormTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    NSInteger status = [dic[@"status"] integerValue];
    if (status > 0) {
        
        self.statusLab.text = OrderStatusArr[status - 1];

    }

    NSInteger type = [dic[@"type"] integerValue];
    self.typeLab.text = type == 1 ? @"买入": @"卖出";
    
    self.numLab.text = [dic[@"num"] stringValue];
    self.lixiLab.text = [NSString stringWithFormat:@"%@%%",dic[@"scale"]];
    
    self.xiadanTime.text = dic[@"add_time"];
    
    
    
    
}
@end
