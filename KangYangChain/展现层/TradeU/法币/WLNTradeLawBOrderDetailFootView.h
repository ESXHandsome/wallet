//
//  WLNTradeLawBOrderDetailFootView.h
//  KangYangChain
//
//  Created by furao on 2018/11/5.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNTradeLawBOrderDetailFootView : FlexCustomBaseView

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *timelabB;


@property (nonatomic, strong) CZCountDownView *cut;

@property (nonatomic, strong) NSMutableDictionary *dic;



@end
