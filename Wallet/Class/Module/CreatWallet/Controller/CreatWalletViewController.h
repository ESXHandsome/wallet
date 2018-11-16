//
//  CreatWalletViewController.h
//  Wallet
//
//  Created by Ying on 2018/10/26.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SwitchPage) (NSString *pagename);

@interface CreatWalletViewController : UIViewController

@property (nonatomic,copy)SwitchPage SwitchPage;

@property (assign, nonatomic) BOOL isImportWord; ///导入助记词创建钱包
@property (assign, nonatomic) BOOL isImportKey;  ///导入私钥创建钱包

@end

NS_ASSUME_NONNULL_END
