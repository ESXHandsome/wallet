//
//  PurseViewModel.m
//  Wallet
//
//  Created by Ying on 2018/11/1.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseViewModel.h"
#import "CoinManager.h"

@interface PurseViewModel ()

@property (strong, nonatomic) CoinManager *manager;

@end

@implementation PurseViewModel

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
