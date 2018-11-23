//
//  WLNMineAgreeWalletHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineAgreeWalletHeadView.h"

@implementation WLNMineAgreeWalletHeadView

- (void)setDic:(NSMutableDictionary *)dic{
    
    self.balanceLab.text = dic[@"free"];
    self.rmbLab.text = [NSString stringWithFormat:@"≈ %@ CNY",dic[@"cny"]];
    
    
}

@end
