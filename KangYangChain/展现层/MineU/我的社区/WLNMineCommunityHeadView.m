//
//  WLNMineCommunityHeadView.m
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCommunityHeadView.h"

@implementation WLNMineCommunityHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        
        
        for (int i = 0; i < 10; i++) {
            
            WLNMineCommunitySignItemView *view = [[WLNMineCommunitySignItemView alloc]initWithFrame:CGRectMake(i * 50, 0, 50, 110)];
            
            [self.signScView addSubview:view];
            
            
        }
        self.signScView.contentSize = CGSizeMake(50 * 10, 0);
        
        
        
    }
    return self;
}
- (void)integralAction{
    
    if (_didIntegralBLock) {
        _didIntegralBLock();
        
    }
    
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    _dic = dic;
    
    [self.headImg sd_setImageWithURL:self.userModel.avatar.url];
    
    self.nameLab.text = [NSString stringWithFormat:@"%@级代理",dic[@"membership_grade"]];
    
    self.scoreLab.text = [NSString stringWithFormat:@"积分:%@",dic[@"integral"]];
    
    self.signLab.text = [NSString stringWithFormat:@"%@天",dic[@"sign_count"]];
    
}

@end
