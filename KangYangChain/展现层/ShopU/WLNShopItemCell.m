//
//  WLNShopItemCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNShopItemCell.h"

@implementation WLNShopItemCell


- (void)exAction{

    if (_didClickExBlock) {
        _didClickExBlock();
        
    }
}

@end
