//
//  WLNMineExtensionInfoView.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineExtensionInfoView : FlexCustomBaseView
@property (nonatomic, strong) void (^didClickBaodan)(void);
@property (nonatomic, strong) void (^didClickMaichu)(void);

@property (nonatomic, strong) UILabel *shenqingLab;
@property (nonatomic, strong) UILabel *maichuLab;

@end

NS_ASSUME_NONNULL_END
