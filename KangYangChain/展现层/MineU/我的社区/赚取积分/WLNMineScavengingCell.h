//
//  WLNMineScavengingCell.h
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineScavengingCell : FlexBaseTableCell
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *moneyLab;
@property (nonatomic, strong) UILabel *statusLab;
@property (nonatomic, strong) UILabel *nicknameLab;

@end

NS_ASSUME_NONNULL_END
