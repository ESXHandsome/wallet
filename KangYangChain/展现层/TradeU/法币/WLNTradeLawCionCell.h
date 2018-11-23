//
//  WLNTradeLawCionCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeLawCionCell : FlexBaseTableCell
@property (nonatomic, strong) UIView *bottomView;


@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *finish_payLab;
@property (nonatomic, strong) UILabel *rateLab;
@property (nonatomic, strong) UILabel *priceLab;
@property (nonatomic, strong) UILabel *xianeLab;
@property (nonatomic, strong) UILabel *numLab;

@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) NSMutableDictionary *weituoDic;


@property (nonatomic, strong) void (^didClickAction)(NSInteger tag);

@property (nonatomic, strong) UILabel *priceWordLab;
@property (nonatomic, strong) UILabel *xianeWordLab;
@property (nonatomic, strong) UILabel *numWordLab;
@property (nonatomic, strong) UILabel *zantingLab;


@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, assign) BOOL changed;
@property (nonatomic, strong) NSMutableDictionary *changedDic;







@end

NS_ASSUME_NONNULL_END
