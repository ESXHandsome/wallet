//
//  WLNMineScavengingCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineScavengingCell.h"

@implementation WLNMineScavengingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.timeLab.text = dic[@"create_time"];
    self.moneyLab.text = [dic[@"ghb"] stringValue];
    self.nicknameLab.text = dic[@"nickname"];
    
    
}

@end
