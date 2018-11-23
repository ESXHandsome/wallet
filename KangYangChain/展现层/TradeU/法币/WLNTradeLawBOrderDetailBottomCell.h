//
//  WLNTradeLawBOrderDetailBottomCell.h
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNTradeLawBOrderDetailBottomCell : FlexBaseTableCell<WLNReqstProtocol>

@property (nonatomic, strong) UILabel *toUserLab;
@property (nonatomic, strong) UILabel *bankLab;
@property (nonatomic, strong) UILabel *branchLab;
@property (nonatomic, strong) UILabel *bankNumLab;
@property (nonatomic, strong) UILabel *payTypeLab;
@property (nonatomic, strong) UIImageView *payTypeImg;

@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) CZCountDownView *cut;

@property (nonatomic, assign) NSInteger payType;




@property (nonatomic, strong) UIView *yinhangBackWordView;
@property (nonatomic, strong) UIView *otherBackWordView;

@property (nonatomic, strong) UIView *yinhangBackView;
@property (nonatomic, strong) UIView *otherBackView;

@property (nonatomic, strong) UILabel *accountLab;
@property (nonatomic, strong) UILabel *codeLab;


@end
