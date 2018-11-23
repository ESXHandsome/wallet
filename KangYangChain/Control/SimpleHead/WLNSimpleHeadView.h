//
//  WLNSimpleHeadView.h
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WLNSimpleHeadViewDelegate <NSObject>

- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag;

@end

@interface WLNSimpleHeadView : UIView

@property (nonatomic, assign) NSInteger specialTag;

@property (nonatomic, strong) NSMutableArray *btnArr;

@property (nonatomic, weak) id <WLNSimpleHeadViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame initWithDelegate:(id<WLNSimpleHeadViewDelegate>)delegate titleArr:(NSArray *)arr;

- (instancetype)initWithDelegate:(id<WLNSimpleHeadViewDelegate>)delegate titleArr:(NSArray *)arr;


@end

NS_ASSUME_NONNULL_END
