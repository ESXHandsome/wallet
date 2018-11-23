//
//  WLNMineGForumDetailCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/7.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGForumDetailCell.h"

@implementation WLNMineGForumDetailCell


- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic == nil) {
        return;
    }
    
    self.nameLab.text = dic[@"user"][@"nickname"];
    
    self.contentLab.text = dic[@"content"];
    
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:dic[@"user"][@"avatar"]] placeholderImage:HolderImage];
    
    [self.contentImg sd_setImageWithURL:[NSURL URLWithString:dic[@"image1"]] placeholderImage:HolderImage];
    
    self.leftLab.text = dic[@""];
    self.centerLab.text = [dic[@"agree_times"] stringValue];
    self.rightLab.text = [dic[@"comment_times"] stringValue];
    self.lookLab.text = [NSString stringWithFormat:@"浏览%@次",dic[@"view_times"]];
    
    
    
    
}

@end
