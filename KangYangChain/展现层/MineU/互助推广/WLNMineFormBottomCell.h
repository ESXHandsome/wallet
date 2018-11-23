//
//  WLNMineFormBottomCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineFormBottomCell : FlexBaseTableCell


@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *phoneLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *statusLab;
@property (nonatomic, strong) FlexTouchView *payBtn;


@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) NSMutableDictionary *lastDic;

@property (nonatomic, strong) void (^didPayGHBBlock)(void);


@end

NS_ASSUME_NONNULL_END
