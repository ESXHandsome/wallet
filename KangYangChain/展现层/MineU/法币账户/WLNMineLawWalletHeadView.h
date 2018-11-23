//
//  WLNMineLawWalletHeadView.h
//  KangYangChain
//
//  Created by edz on 2018/11/13.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineLawWalletHeadView : FlexCustomBaseView
@property (nonatomic, strong) UILabel *balanceLab;
@property (nonatomic, strong) UILabel *rmbLab;

@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
