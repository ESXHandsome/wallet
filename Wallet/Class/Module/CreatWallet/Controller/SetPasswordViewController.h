//
//  SetPasswordViewController.h
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SetPasswordViewController : UIViewController
@property (nonatomic,strong) NSString *password;
@property (strong, nonatomic) NSString *walletName;
@property(nonatomic,strong) NSString *psw;
@end

NS_ASSUME_NONNULL_END
