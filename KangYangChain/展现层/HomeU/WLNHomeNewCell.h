//
//  WLNHomeNewCell.h
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNHomeNewCell : FlexBaseTableCell


@property (nonatomic, strong) UILabel *bizhongLab;
@property (nonatomic, strong) UILabel *bizhong2Lab;
@property (nonatomic, strong) UILabel *moneyLab;
@property (nonatomic, strong) UILabel *money2Lab;
@property (nonatomic, strong) UILabel *dealCountLab;
@property (nonatomic, strong) UILabel *waveLab; //波动百分比
@property (nonatomic, strong) UIView *waveView;

@property (nonatomic, strong) UIImageView*cellect;

@property (nonatomic, strong) NSMutableDictionary *dic;

@end
