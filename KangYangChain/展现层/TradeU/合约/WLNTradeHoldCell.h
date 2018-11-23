//
//  WLNTradeHoldCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeHoldCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *priceLab; //持仓

@property (nonatomic, strong) UILabel *amountLab;//冻结

@property (nonatomic, strong) UILabel *accessLab; //盈亏

@property (nonatomic, strong) UILabel *numLab; //持仓量

@property (nonatomic, strong) UILabel *boom_priceLab; //强评价

@property (nonatomic, strong) UILabel *typeLab; //买涨买跌

@property (nonatomic, strong) UILabel *maxlineLab; //止盈

@property (nonatomic, strong) UILabel *minlineLab; //止损

@property (nonatomic, strong) UIView *closeView;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UIView *setView;




@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
