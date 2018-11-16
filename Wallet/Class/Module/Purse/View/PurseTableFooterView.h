//
//  PurseTableFooterView.h
//  Wallet
//
//  Created by Ying on 2018/10/30.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PurseTableFooterViewDelegate <NSObject>

- (void)addWalletButtonDidClicked;

@end

@interface PurseTableFooterView : UIView

@property (weak, nonatomic) id<PurseTableFooterViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
