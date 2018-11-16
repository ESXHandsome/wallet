//
//  LoginManager.m
//  Wallet
//
//  Created by Ying on 2018/10/26.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "LoginManager.h"

@interface LoginManager ()

@property (assign, nonatomic) BOOL isLogined;//是否登录

@end

@implementation LoginManager

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}



@end
