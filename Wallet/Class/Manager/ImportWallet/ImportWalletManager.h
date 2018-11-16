//
//  ImportWalletManager.h
//  Wallet
//
//  Created by 狮子头 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImportWalletManager : NSObject

+ (instancetype)sharedInstance;

@property (strong, nonatomic) NSString *walletName; ///钱包密码
@property (strong, nonatomic) NSString *pwd;        ///钱包密码
@property (strong, nonatomic) NSString *privateKey; ///私钥
@property (strong, nonatomic) NSString *phrase;     ///助记词
@property (strong, nonatomic) NSString *importType; ///导入类型
@property (assign, nonatomic) BOOL import;          ///标记

@end

NS_ASSUME_NONNULL_END
