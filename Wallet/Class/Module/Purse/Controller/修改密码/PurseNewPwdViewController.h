//
//  PurseNewPwdViewController.h
//  Wallet
//
//  Created by 狮子头 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoinManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurseNewPwdViewController : UIViewController

@property (strong, nonatomic) CoinWalletModel *model;
@property (strong, nonatomic) NSString *pwdString;

@end

NS_ASSUME_NONNULL_END
