//
//  WLNMineCommunityHeadView.h
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNMineCommunityHeadView : FlexCustomBaseView
@property (nonatomic, strong) void (^didIntegralBLock)(void);

@property (nonatomic, strong) UIImageView *headImg;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *scoreLab;
@property (nonatomic, strong) UILabel *signLab;


@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) UIScrollView *signScView;



@end
