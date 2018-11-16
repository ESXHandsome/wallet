//
//  BaseNetApi.h
//  vhum
//
//  Created by Ying on 2018/8/23.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Network.h"
#import "AFNetworking.h"

@interface BaseNetApi : NSObject
/**
 
 发送网络请求
 
 @param url 数据请求url
 @param param 数据请求的参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
+ (void)httpRequestWithURL:(NSString *)url
                 withParam:(NSDictionary *)param
                   success:(SuccessBlock)success
                   failure:(FailureBlock)failure;

+ (void)httpRequestWithURLforstring:(NSString *)url
                          withParam:(NSString *)param
                            success:(SuccessBlock)success
                            failure:(FailureBlock)failure;
@end
