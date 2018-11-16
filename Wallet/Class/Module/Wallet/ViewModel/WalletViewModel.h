//
//  WalletViewModel.h
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletTableCellModel.h"
#import "CoinMarketApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface WalletViewModel : NSObject

- (void)getCoinPrice:(CoinType)type complete:(void(^)(id price))complete;

- (WalletTableCellModel *)getCellConfigModel;

@end

NS_ASSUME_NONNULL_END
