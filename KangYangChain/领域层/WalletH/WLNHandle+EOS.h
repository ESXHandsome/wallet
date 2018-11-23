//
//  WLNHandle+EOS.h
//  KangYangChain
//
//  Created by furao on 2018/10/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle (EOS)

 
/**
 生成秘钥
 */
- (void)getEOSKeys:(NSMutableDictionary *)dic;

/**
 查询余额
 */
- (void)getEOSBalance:(NSMutableDictionary *)dic;

/**
 订单查询
 */

- (void)getEOSOrder:(NSMutableDictionary *)dic;

/**
 转账
 */
- (void)sendEOS:(NSMutableDictionary *)dic;



@end
