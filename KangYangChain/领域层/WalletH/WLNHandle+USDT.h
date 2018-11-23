//
//  WLNHandle+USDT.h
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle (USDT)

/**
 生成秘钥
 */
- (void)getUSDTKeys:(NSMutableDictionary *)dic;

/**
 查询余额
 */
- (void)getUSDTBalance:(NSMutableDictionary *)dic;

/**
 订单查询
 */

- (void)getUSDTOrder:(NSMutableDictionary *)dic;

/**
 转账
 */
- (void)sendUSDT:(NSMutableDictionary *)dic;

@end
