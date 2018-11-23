//
//  WLNMineAgreeWalletCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineAgreeWalletCell.h"

@implementation WLNMineAgreeWalletCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.has_numLab.text = dic[@"has_num"];
    self.frozen_numLab.text = dic[@"frozen_num"];
    self.will_numLab.text = dic[@"will_num"];
    self.freeLab.text = dic[@"free"];
    
    
    
}
@end
