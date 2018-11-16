//
//  SelectCountryViewModel.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SelectCountryViewModel.h"
@interface SelectCountryViewModel ()

@end
@implementation SelectCountryViewModel


- (NSArray *)cellTitleList {
    if (!_cellTitleList) {
        _cellTitleList = @[@"修改密码",@"钱包备份",@"导出私钥",@"删除钱包"];
    }
    return _cellTitleList;
}
@end
