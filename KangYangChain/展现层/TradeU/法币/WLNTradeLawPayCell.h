//
//  WLNTradeLawPayCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeLawPayCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *priceLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *totalLab;


@property (nonatomic, strong) NSMutableDictionary *dic;


@end

NS_ASSUME_NONNULL_END
