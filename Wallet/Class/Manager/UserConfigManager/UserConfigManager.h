//
//  UserConfigManager.h
//  Wallet
//
//  Created by Ying on 2018/10/22.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserConfigManager : NSObject

/**
 判断文件是否存在

 @return 是\否
 */
+ (BOOL)isBuild;

/**
 存入个人配置信息
 
 @param dic 要存入的字典
 */
+ (void)saveUserConfig:(NSMutableDictionary *)dic;

/**
 读取个人配置信息

 @return 返回字典
 */
+ (NSMutableDictionary *)getUserConfigDic;

/**
 更新个人配置信息

 @param value 值
 @param key 键
 */
+ (void)updataUserConfigDic:(NSDictionary *)value key:(NSString *)key;

/**
 根据key删除信息

 @param key key
 */
+ (void)removeUserConfigDicForKey:(NSString *)key;

/**
 删除个人配置信息
 */
+ (void)removeUserConfig;
@end

NS_ASSUME_NONNULL_END
