//
//  WLNTradeTradeBodyCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeTradeBodyCell : FlexBaseTableCell


@property (nonatomic, strong) NSMutableDictionary *dic;


@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UILabel *priceLab;
@property (nonatomic, strong) UILabel *numLab;

@end

NS_ASSUME_NONNULL_END
