//
//  WLNMineAgreeWalletCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineAgreeWalletCell : FlexBaseTableCell



@property (nonatomic, strong) UILabel *has_numLab;
@property (nonatomic, strong) UILabel *will_numLab;
@property (nonatomic, strong) UILabel *freeLab;
@property (nonatomic, strong) UILabel *frozen_numLab;

@property (nonatomic, strong) NSMutableDictionary *dic;


@end

NS_ASSUME_NONNULL_END
