//
//  CoinManager.h
//  Wallet
//
//  Created by Ying on 2018/10/30.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoinWalletModel : NSObject

@property (strong, nonatomic) NSString *walletName;     ///钱包名称
@property (strong, nonatomic) NSString *iconName;       ///头像
@property (strong, nonatomic) NSString *password;       ///密码
@property (strong, nonatomic) NSString *eth_privateKey; ///以太坊私钥
@property (strong, nonatomic) NSString *eth_address;    ///以太坊地址
@property (strong, nonatomic) NSString *eth_phrase;     ///以太坊助记词
@property (strong, nonatomic) NSString *eth_keystore;   ///以太坊KeyStore
@property (strong, nonatomic) NSString *btc_privateKey; ///比特币私钥
@property (strong, nonatomic) NSString *btc_address;    ///比特币地址
@property (strong, nonatomic) NSString *btc_phrase;     ///比特币助记词
@property (strong, nonatomic) NSString *isMainWallet;   ///是否是主钱包

@end

@interface CoinManager : NSObject

@property (strong, nonatomic) NSDictionary *currentWalletDic;   ///当前主钱包数据
@property (strong, nonatomic) NSDictionary *allWalletDic;       ///所有钱包数据
@property (strong, nonatomic) NSString *currentWalletName;      ///主钱包名称
@property (strong, nonatomic) CoinWalletModel *wallentModel;    ///当前钱包数据模型
@property (assign, nonatomic) BOOL hasWallet; ///是否有钱包

/**
 单例

 @return 实例
 */
+ (instancetype)sharedInstance;


+ (void)importWalletWithKey:(NSString *)key pwd:(NSString *)pwd walletName:(NSString *)walletName complete:(void(^)(NSString *error))complete;

/**
 根据助词导入钱包

 @param word 助词
 @param pwd 密码
 @param walletName 钱包名
 @param complete 完成回调
 */
+ (void)importWalletWithWord:(NSString *)word pwd:(NSString *)pwd walletName:(NSString *)walletName complete:(void(^)(NSString *error))complete;

/**
 添加钱包

 @param passWord 密码
 @param walletName 钱包名
 @param complete 完成回调
 @return 返回NO 钱包名重复
 */
- (BOOL)addWallent:(NSString *)passWord name:(nonnull NSString *)walletName complete:(void(^)(void))complete;

/**
 删除钱包

 @param walletName 钱包名
 */
- (void)deleteWallet:(NSString *)walletName;

/**
 根据钱包名修改具体某项

 @param walletName 钱包名
 @param key 修改项
 @param value 修改的值
 */
- (void)updataWallet:(NSString *)walletName key:(NSString *)key value:(NSString *)value;


/**
 字典转钱包数据模型

 @param dic 字典
 @return 钱包数据模型
 */
- (CoinWalletModel *)dicChangeToCoinWalletModel:(NSDictionary *)dic;


/**
 根据钱包名和钱包数据模型进行数据更改

 @param walletName 钱包名
 @param model 钱包数据模型
 */
- (void)upDateWallet:(NSString *)walletName model:(CoinWalletModel *)model;



@end

