//
//  WLNMineGProblemCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGProblemCell.h"

@implementation WLNMineGProblemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.questionLab.text = dic[@"question"];
    self.answerLab.text = dic[@"answer"];
    
    
    
}
@end
