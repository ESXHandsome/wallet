//
//  WLNHandle+Property.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNHandle (Property)



- (void)propertyHome:(NSMutableDictionary *)dic;

- (void)propertyGetAddress:(NSMutableDictionary *)dic;

- (void)propertyAddressList:(NSMutableDictionary *)dic;


- (void)propertySendB:(NSMutableDictionary *)dic;

- (void)getBCode:(NSMutableDictionary *)dic;

- (void)propertyRechargeList:(NSMutableDictionary *)dic;

- (void)propertyCashList:(NSMutableDictionary *)dic;

- (void)propertyAddAddress:(NSMutableDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
