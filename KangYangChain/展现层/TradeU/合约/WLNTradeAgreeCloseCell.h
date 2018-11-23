//
//  WLNTradeAgreeCloseCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/15.
//  Copyright © 2018 furao. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeAgreeCloseCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UILabel *closeTypeLab;


@property (nonatomic, strong) UILabel *chicangPriceLab;
@property (nonatomic, strong) UILabel *chicangliangLab;
@property (nonatomic, strong) UILabel *zhiyingLab;
@property (nonatomic, strong) UILabel *dongjieLab;
@property (nonatomic, strong) UILabel *pingcangjiaLab;
@property (nonatomic, strong) UILabel *zhisunLab;
@property (nonatomic, strong) UILabel *yingkuiLab;
@property (nonatomic, strong) UILabel *timeLab;



@property (nonatomic, strong) void (^didCancelOrder)(void);

@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
