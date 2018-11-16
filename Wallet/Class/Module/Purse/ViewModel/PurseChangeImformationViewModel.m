//
//  PurseChangeImformationViewModel.m
//  Wallet
//
//  Created by Ying on 2018/10/31.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseChangeImformationViewModel.h"

@implementation PurseChangeImformationViewModel

- (NSArray *)cellTitleList {
    if (!_cellTitleList) {
        _cellTitleList = @[@"头像",@"钱包名称"];
    }
    return _cellTitleList;
}

@end
