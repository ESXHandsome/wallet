//
//  WLNTradeHangCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeHangCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UILabel *maxlineLab;
@property (nonatomic, strong) UILabel *minlineLab;
@property (nonatomic, strong) UILabel *amountLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *priceLab;


@property (nonatomic, strong) void (^didCancelOrder)(void);

@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
