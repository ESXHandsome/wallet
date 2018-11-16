//
//  UserHeaderView.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UserHeaderViewDelegate <NSObject>

/**
 钱包按钮被点击
 */
- (void)purseButtonClicked;

/**
 添加按钮被点击
 */
- (void)addButtonClicked;

@end

@interface UserHeaderView : UIImageView


@property (weak, nonatomic) id<UserHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
