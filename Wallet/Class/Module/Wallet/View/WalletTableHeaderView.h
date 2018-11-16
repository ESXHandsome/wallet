//
//  WalletTableHeaderView.h
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WalletTableHeaderViewDelegate <NSObject>

/**
    钱包按钮被点击
 */
- (void)purseButtonClicked;

/**
    添加按钮被点击
 */
- (void)addButtonClicked;

@end

@interface WalletTableHeaderView : UIImageView

@property (weak, nonatomic) id<WalletTableHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
