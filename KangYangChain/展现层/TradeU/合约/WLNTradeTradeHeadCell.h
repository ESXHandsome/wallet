//
//  WLNTradeTradeHeadCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeTradeHeadCell : FlexBaseTableCell
@property (nonatomic, strong) UILabel *leftLab;
@property (nonatomic, strong) UILabel *centerLab;
@property (nonatomic, strong) UILabel *rightLab;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) NSMutableDictionary *dic;


@end

NS_ASSUME_NONNULL_END
