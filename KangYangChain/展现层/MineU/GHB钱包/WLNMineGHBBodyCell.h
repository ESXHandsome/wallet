//
//  WLNMineGHBBodyCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineGHBBodyCell : FlexBaseTableCell

@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *stateLab;


@end

NS_ASSUME_NONNULL_END
