
//
//  ETHManager.m
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "ETHManager.h"
#import "HSEther.h"

@implementation ETHManager

+ (void)name {
    [HSEther hs_createWithPwd:@"123123" block:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
        NSLog(@"成功");
        NSLog(@"地址: %@",address);
        NSLog(@"KeyStore: %@",keyStore);
        NSLog(@"助记词: %@",mnemonicPhrase);
        NSLog(@"私钥: %@",privateKey);
    }];
}

@end
