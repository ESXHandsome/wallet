//
//  WLNTradeLawBHeaderView.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBHeaderView.h"

@implementation WLNTradeLawBHeaderView

- (void)setDic:(NSMutableDictionary *)dic{
    
    self.canUserLab.text = [NSString stringWithFormat:@"可用:%@ USDT",dic[@"number"]];
    self.freezeLab.text = [NSString stringWithFormat:@"冻结:%@ USDT",dic[@"freeze_num"]];

}

@end
