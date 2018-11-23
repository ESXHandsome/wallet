//
//  WLNPropertyHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNPropertyHeadView.h"

@implementation WLNPropertyHeadView


- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic.allKeys.count == 0) {
        return;
    }
    self.balanceLab.text = dic[@"total"];
    self.rmbLab.text = [NSString stringWithFormat:@"≈ %@ CNY",dic[@"cny"]];
    self.bizhongTypeLab.text = dic[@"coin_type"];
    self.bizhongChoseLab.text = dic[@"coin_type"];

    
    
}

@end
