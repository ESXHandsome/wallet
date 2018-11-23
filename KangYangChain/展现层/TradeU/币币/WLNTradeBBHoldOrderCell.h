//
//  WLNTradeBBHoldOrderCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/10.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeBBHoldOrderCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *priceLab;
@property (nonatomic, strong) UILabel *allPriceLab;
@property (nonatomic, strong) UILabel *allNumLab;
@property (nonatomic, strong) UILabel *averagePriceLab;
@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *statusLab;


@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
