//
//  ConfirmPasswordViewController.h
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConfirmPasswordViewController : UIViewController

@property (nonatomic,strong) NSString *password;
@property (nonatomic,copy) NSString *receiveValue;
@property (strong, nonatomic) NSString *walletName;

@end

NS_ASSUME_NONNULL_END
