//
//  PurseChangeWalletNameViewController.h
//  Wallet
//
//  Created by 狮子头 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoinManager.h"

NS_ASSUME_NONNULL_BEGIN
@protocol PurseChangeWalletNameViewControllerDelegate <NSObject>

- (void)finishChangeWalletName;

@end


@interface PurseChangeWalletNameViewController : UIViewController

@property (strong, nonatomic) CoinWalletModel *model;
@property (weak, nonatomic) id<PurseChangeWalletNameViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
