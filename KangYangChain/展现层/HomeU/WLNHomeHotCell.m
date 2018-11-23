//
//  WLNHomeHotCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHomeHotCell.h"

@implementation WLNHomeHotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic == nil) {
        return;
    }
    
    self.nameLab.text = dic[@"user"][@"nickname"];
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:dic[@"user"][@"avatar"]] placeholderImage:HolderImage];
    
    
    self.contentLab.text = dic[@"content"];
    [self.contentImg sd_setImageWithURL:[NSURL URLWithString:dic[@"image1"]] placeholderImage:HolderImage];
    
    self.leftLab.text = dic[@""];
    self.centerLab.text = [dic[@"agree_times"] stringValue];
    self.rightLab.text = [dic[@"comment_times"] stringValue];
    self.lookLab.text = [NSString stringWithFormat:@"浏览%@次",dic[@"view_times"]];
    
    
    
    
}
@end
