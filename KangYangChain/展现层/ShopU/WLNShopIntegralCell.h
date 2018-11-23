//
//  WLNShopIntegralCell.h
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNShopIntegralCell : FlexCollectionCell

@property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, strong) UILabel *integralLab;
@property (nonatomic, strong) UILabel *orderLab;


@property (nonatomic, strong) UIButton *buyBtn;
@property (nonatomic, strong) UIButton *exchangeBtn;


@property (nonatomic, strong) void (^didClick)(NSInteger tag);

@end
