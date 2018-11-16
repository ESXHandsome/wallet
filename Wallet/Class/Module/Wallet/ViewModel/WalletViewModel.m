//
//  WalletViewModel.m
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "WalletViewModel.h"

@implementation WalletViewModel

- (void)getCoinPrice:(CoinType)type complete:(void(^)(id price))complete {
    [CoinMarketApi httpRequestToCoinMarket:type success:^(id responseDict) {
        complete(responseDict);
    } failed:^(NSInteger errorCode) {
        
    }];
}

- (WalletTableCellModel *)getCellConfigModel {
    WalletTableCellModel *model = [[WalletTableCellModel alloc] init];
    
    return model;
}

@end
