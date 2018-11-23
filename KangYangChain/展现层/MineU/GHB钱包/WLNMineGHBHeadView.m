//
//  WLNMineGHBHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGHBHeadView.h"

@implementation WLNMineGHBHeadView

- (void)reloadData{
    
    
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    self.balanceLab.text = dic[@"ghb_amount"];
    
    self.rmbLab.text = [NSString stringWithFormat:@"≈ %f USDT",[dic[@"ghb_amount"]floatValue] / [dic[@"usdt2ghb"]floatValue]];
    
    
    
}

@end
