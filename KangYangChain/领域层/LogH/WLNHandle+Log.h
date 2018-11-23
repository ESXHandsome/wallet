//
//  WLNHandle+Log.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNHandle (Log)

- (void)log:(NSMutableDictionary *)dic;

- (void)logout:(NSMutableDictionary *)dic;

- (void)registers:(NSMutableDictionary *)dic;

- (void)getCode:(NSMutableDictionary *)dic;

- (void)forGet:(NSMutableDictionary *)dic;

- (void)judgeNet;

- (void)saveUserDic:(NSMutableDictionary*)dic;

- (void)deleteUserDic;

- (NSMutableDictionary *)readUserDic;

@end

NS_ASSUME_NONNULL_END
