//
//  WLNShopIntegralCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//  商城积分cell

#import "WLNShopIntegralCell.h"

@implementation WLNShopIntegralCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)buyAction{
    if (_didClick) {
        _didClick(1);
    }
}
- (void)changeAction{
    if (_didClick) {
        _didClick(2);
    }
    
}

@end
