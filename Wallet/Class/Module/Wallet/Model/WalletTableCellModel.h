//
//  WalletTableCellModel.h
//  Wallet
//
//  Created by Ying on 2018/11/1.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WalletTableCellModel : NSObject

@property (strong, nonatomic) NSString *marketPrice;    ///市场价格
@property (strong, nonatomic) NSString *coin;           ///持有币
@property (strong, nonatomic) NSString *coinPrice;      ///持有币余额

@end

NS_ASSUME_NONNULL_END
