//
//  WLNHandle+BTC.h
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle (BTC)
/**
 生成秘钥
 */
- (void)getBTCKeys:(NSMutableDictionary *)dic;

/**
 查询余额
 */
- (void)getBTCBalance:(NSMutableDictionary *)dic;

/**
 订单查询
 */

- (void)getBTCOrder:(NSMutableDictionary *)dic;

/**
 转账
 */
- (void)sendBTC:(NSMutableDictionary *)dic;

@end
