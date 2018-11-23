//
//  WLNFloatView.h
//  KangYangChain
//
//  Created by edz on 2018/10/26.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WLNFloatView;

@protocol WLNFloatViewDelegate <NSObject>

- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag;

- (void)floatClickBackFloatView:(WLNFloatView *)floatView button:(UIButton *)button tag:(NSInteger)tag;

@end

@interface WLNFloatView : UIView

@property (nonatomic, weak) id<WLNFloatViewDelegate>delegate;

@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, strong) UIView *backView;

- (instancetype)initFather:(UIView *)father delegate:(id<WLNFloatViewDelegate>)delegate ButtonTitles:(nullable NSString *)otherButtonTitles,... NS_REQUIRES_NIL_TERMINATION;

- (void)show;

- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
