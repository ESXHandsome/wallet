//
//  AppDelegate+Wallet.h
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Wallet) <WLNReqstProtocol>

- (void)walletSetup;

@end
