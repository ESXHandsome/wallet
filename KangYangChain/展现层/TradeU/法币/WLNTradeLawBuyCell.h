//
//  WLNTradeLawBuyCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeLawBuyCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *doneLab;
@property (nonatomic, strong) UILabel *priceLab;
@property (nonatomic, strong) UITextField *priceTxt;
@property (nonatomic, strong) UILabel *minPriceLab;
@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
