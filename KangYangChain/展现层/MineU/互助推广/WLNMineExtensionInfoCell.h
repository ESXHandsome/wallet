//
//  WLNMineExtensionInfoCell.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "FlexBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineExtensionInfoCell : FlexBaseTableCell

@property (nonatomic, strong) void (^didClickSell)(void);

@property (nonatomic, strong) Order *model;
@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *typesLab;
@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) FlexTouchView *sellView;



@end

NS_ASSUME_NONNULL_END
