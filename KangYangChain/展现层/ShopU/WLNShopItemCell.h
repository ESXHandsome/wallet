//
//  WLNShopItemCell.h
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNShopItemCell : FlexCollectionCell

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *lab;
@property (nonatomic, strong) UILabel *scoreLab;

@property (nonatomic, strong) UIButton *exchangeBtn;

@property (nonatomic, strong) void (^didClickExBlock)(void);


@end
