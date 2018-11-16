//
//  PurseTableViewCell.h
//  Wallet
//
//  Created by Ying on 2018/10/19.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoinManager.h"

NS_ASSUME_NONNULL_BEGIN

@class PurseTableViewCell;

@protocol PurseTableViewCellDelegate <NSObject>

- (void)cell:(PurseTableViewCell *)cell didSelectedDetailButton:(UIButton *)button ;

@end

@interface PurseTableViewCell : UITableViewCell

@property (assign, nonatomic) BOOL isMainWallet; ///是否是主钱包
@property (strong, nonatomic) NSString *walletName;
@property (weak, nonatomic) id<PurseTableViewCellDelegate> delegate;
@property (strong, nonatomic) CoinWalletModel *model;

- (void)setCellWithModel:(CoinWalletModel *)model;

@end

NS_ASSUME_NONNULL_END
