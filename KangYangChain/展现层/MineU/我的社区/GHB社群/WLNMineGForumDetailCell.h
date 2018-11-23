//
//  WLNMineGForumDetailCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/7.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineGForumDetailCell : FlexBaseTableCell

@property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *remarkLab;

@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIImageView *contentImg;
@property (nonatomic, strong) UILabel *ofLab;
@property (nonatomic, strong) UILabel *lookLab;

@property (nonatomic, strong) UIImageView *leftImg;
@property (nonatomic, strong) UIImageView *centerImg;
@property (nonatomic, strong) UIImageView *rightImg;

@property (nonatomic, strong) UILabel *leftLab;
@property (nonatomic, strong) UILabel *centerLab;
@property (nonatomic, strong) UILabel *rightLab;

@property (nonatomic, strong) NSMutableDictionary *dic;


@end

NS_ASSUME_NONNULL_END
