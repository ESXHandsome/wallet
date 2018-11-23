//
//  WLNTradeLawBHeaderView.h
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeLawBHeaderView : FlexCustomBaseView
@property (nonatomic, strong) UIView *headBottomView;


@property (nonatomic, strong) UILabel *canUserLab;
@property (nonatomic, strong) UILabel *freezeLab;

@property (nonatomic, strong) NSMutableDictionary *dic;


@end

NS_ASSUME_NONNULL_END
