//
//  WLNTradeLawBPublishCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeLawBPublishCell : FlexBaseTableCell<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *scaleTxt;
@property (nonatomic, strong) UITextField *priceTxt;



@property (nonatomic, strong) UILabel *valueLab;
@property (nonatomic, strong) UILabel *usdtPriceLab;


@property (nonatomic, strong) NSMutableDictionary *buyDic;

@property (nonatomic, strong) UILabel *zuixiaoeLab;

@property (nonatomic, strong ) UITextField *minTxt;
@property (nonatomic, strong ) UITextField *maxTxt;
@property (nonatomic, strong ) UITextField *numTxt;
@property (nonatomic, strong) UITextField *fudongTxt;

@property (nonatomic, strong) UILabel *priceChooseTypeLab;
@property (nonatomic, strong) UILabel *fudongLab;
@property (nonatomic, strong) UIView *fudongView;






@end

NS_ASSUME_NONNULL_END
