//
//  WLNMineLawWalletHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/11/13.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineLawWalletHeadView.h"

@implementation WLNMineLawWalletHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.balanceLab.text = [dic[@"value"] stringValue];
    self.rmbLab.text = [NSString stringWithFormat:@"≈ %@ CNY",dic[@"cny"]];
    
    
    
}
@end
