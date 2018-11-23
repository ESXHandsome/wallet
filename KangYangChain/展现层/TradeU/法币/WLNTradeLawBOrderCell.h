//
//  WLNTradeLawBOrderCell.h
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNTradeLawBOrderCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *priceLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *totalLab;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIView *cutBackView;
@property (nonatomic, strong) CZCountDownView *cutView;

@property (nonatomic, strong) NSMutableDictionary *dic;



@end
