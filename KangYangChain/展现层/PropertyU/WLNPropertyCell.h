//
//  WLNPropertyCell.h
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNPropertyCell : FlexBaseTableCell
@property (nonatomic, strong) UILabel *bbLab;
@property (nonatomic, strong) UILabel *totalLab;
@property (nonatomic, strong) UILabel *lawLab;
@property (nonatomic, strong) UILabel *agreeLab;

@property (nonatomic, strong) NSString *currenBi;

@property (nonatomic, strong) NSMutableDictionary *dic;

@end
