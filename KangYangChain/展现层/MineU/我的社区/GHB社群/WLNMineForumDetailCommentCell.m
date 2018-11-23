//
//  WLNMineForumDetailCommentCell.m
//  KangYangChain
//
//  Created by furao on 2018/11/6.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineForumDetailCommentCell.h"

@implementation WLNMineForumDetailCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    self.nameLab.text = [NSString stringWithFormat:@"%@ :",dic[@"nickname"]];
    self.contentLab.text = dic[@"content"];
    
    
    
    
}
@end
