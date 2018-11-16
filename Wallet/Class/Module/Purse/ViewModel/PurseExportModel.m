//
//  PurseExportModel.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/8.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseExportModel.h"
#import "CoinManager.h"

@interface PurseExportModel ()

@property (strong, nonatomic) CoinManager *manager;

@end
@implementation PurseExportModel
- (NSMutableArray *)dataSource {
    NSMutableArray *dataSource = [[NSMutableArray alloc] init];
    dataSource = self.manager.allWalletDic.allValues.copy;
   
    return dataSource;
}

- (CoinManager *)manager {
    if (!_manager) {
        _manager = [CoinManager sharedInstance];
    }
    return _manager;
}
@end
