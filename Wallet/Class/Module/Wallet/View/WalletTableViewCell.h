//
//  WalletTableViewCell.h
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalletTableCellModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    top,
    bottom
} CornerType;

@interface WalletTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *priceLabel;      ///币种价格
@property (strong, nonatomic) UILabel *userCoinLabel;   ///用户持币量
@property (strong, nonatomic) UILabel *userPriceLabel;  ///用户持币价值
@property (strong, nonatomic) UIImageView *iconView;    ///图标

/**
    调整圆角
 */
- (void)cornerRadius:(CornerType)type;

- (void)setCellsText:(nullable WalletTableCellModel *)cellModel;

@end

NS_ASSUME_NONNULL_END
