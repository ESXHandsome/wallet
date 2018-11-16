//
//  PurseEnterPasswordViewController.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/9.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoinManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurseEnterPasswordViewController : UIViewController
@property (strong, nonatomic) CoinWalletModel *model;
@end

NS_ASSUME_NONNULL_END
