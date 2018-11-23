//
//  WLNHandle+ETH.h
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle (ETH)

#pragma mark - 以太币
/**
 生成秘钥
 */
- (void)getETHKeys:(NSMutableDictionary *)dic;

/**
 查询余额
 */
- (void)getETHBalance:(NSMutableDictionary *)dic;

/**
 订单查询
 */

- (void)getETHOrder:(NSMutableDictionary *)dic;

/**
 转账
 */
- (void)sendETH:(NSMutableDictionary *)dic;


#pragma mark - 中子链

- (void)getNEBCBalance:(NSMutableDictionary *)dic;

- (void)getNEBCOrder:(NSMutableDictionary *)dic;

- (void)sendNEBC:(NSMutableDictionary *)dic;


#pragma mark - BNB

- (void)getBNBBalance:(NSMutableDictionary *)dic;

- (void)getBNBOrder:(NSMutableDictionary *)dic;

- (void)sendBNB:(NSMutableDictionary *)dic;







@end
