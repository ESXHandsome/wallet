//
//  PurseDetailViewModel.m
//  Wallet
//
//  Created by Ying on 2018/10/31.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseDetailViewModel.h"

@interface PurseDetailViewModel ()

@end

@implementation PurseDetailViewModel

- (NSArray *)cellTitleList {
    if (!_cellTitleList) {
        _cellTitleList = @[@"修改密码",@"钱包备份",@"导出私钥",@"删除钱包"];
    }
    return _cellTitleList;
}

@end
