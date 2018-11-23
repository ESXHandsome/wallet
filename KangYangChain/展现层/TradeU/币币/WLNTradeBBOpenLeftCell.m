//
//  WLNTradeBBOpenLeftCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBOpenLeftCell.h"

@implementation WLNTradeBBOpenLeftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    self.titleLab.text = dic[@"english_name_abb"];
    
    
    
}
@end
