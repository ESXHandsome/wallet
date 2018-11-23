//
//  WLNTradeLawBOrderDetailBottom_A_Cell.h
//  KangYangChain
//
//  Created by edz on 2018/11/14.
//  Copyright © 2018 furao. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeLawBOrderDetailBottom_A_Cell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *toUserLab; //收款人
@property (nonatomic, strong) UILabel *payTypeLab; //支付方式
@property (nonatomic, strong) UILabel *payMoneyLab; //支付金额
@property (nonatomic, strong) UILabel *payTimeLab; //收款人

@property (nonatomic, strong) NSMutableDictionary *dic;


@property (nonatomic, strong) UILabel * timeLab;


@property (nonatomic, strong) CZCountDownView *cut;


@end

NS_ASSUME_NONNULL_END
