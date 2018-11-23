//
//  WLNMineGProblemCell.h
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineGProblemCell : FlexBaseTableCell
@property (nonatomic, strong) UILabel *questionLab;
@property (nonatomic, strong) UILabel *answerLab;
@property (nonatomic, strong) NSMutableDictionary *dic;


@end

NS_ASSUME_NONNULL_END
