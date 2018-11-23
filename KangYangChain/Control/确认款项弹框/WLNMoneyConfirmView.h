//
//  WLNMoneyConfirmView.h
//  KangYangChain
//
//  Created by edz on 2018/11/14.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMoneyConfirmView : FlexCustomBaseView<WLNPassValueProtocol>


@property (nonatomic, strong) void (^didPayBlock)(void);

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, assign) NSInteger type; // 0 买 1 卖;



@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *priceWordLab;
@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UILabel *payTypeWordLab;
@property (nonatomic, strong) UILabel *payTypeLab;

@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UILabel *doneLab;





- (void)show;

@end

NS_ASSUME_NONNULL_END
