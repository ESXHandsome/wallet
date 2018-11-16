//
//  PurseDetailViewController.h
//  Wallet
//
//  Created by Ying on 2018/10/30.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoinManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurseDetailViewController : UIViewController

@property (strong, nonatomic) CoinWalletModel *model;

@end

NS_ASSUME_NONNULL_END
