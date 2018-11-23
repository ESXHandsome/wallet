//
//  WLNMineFormTopCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineFormTopCell : FlexBaseTableCell

@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *statusLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *lixiLab;
@property (nonatomic, strong) UILabel *xiadanTime;



@end

NS_ASSUME_NONNULL_END
