//
//  WLNWalletBodyCell.h
//  WLNWallet
//
//  Created by furao on 2018/9/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNWalletBodyCell : FlexBaseTableCell
@property (strong, nonatomic) UILabel *bizhongLab;

@property (strong, nonatomic) UILabel *canuse;
@property (strong, nonatomic) UILabel *notuse;

@property (nonatomic, strong) NSMutableDictionary *dic;


@end

NS_ASSUME_NONNULL_END
