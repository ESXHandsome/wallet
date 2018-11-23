//
//  WLNMineGHBHeadView.h
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineGHBHeadView : FlexCustomBaseView <WLNReloadProtocol>

@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) UILabel *balanceLab;

@property (nonatomic, strong) UILabel *rmbLab;



@end

NS_ASSUME_NONNULL_END
