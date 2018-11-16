//
//  ImportWalletManager.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "ImportWalletManager.h"

@implementation ImportWalletManager

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}



@end
