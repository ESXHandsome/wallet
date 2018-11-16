//
//  NetworkManager.h
//  vhum
//
//  Created by Ying on 2018/8/10.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Network.h"

#define HTTP_RESPONSE_NIL 1

@interface NetworkManager : NSObject

@property (copy, nonatomic) NSString *netWorkTypeString;

/** 单例 */
+ (instancetype)shared;


- (NSURLSessionDataTask *)sendPostRequest: (NSString *)url
                            withParamDict: (NSDictionary *)parameters
                                  success: (SuccessBlock)success
                                  failure: (FailureBlock)failure;

- (NSURLSessionDataTask *)sendPostRequestforstring: (NSString *)url
                            withParamDict: (NSString *)parameters
                                  success: (SuccessBlock)success
                                  failure: (FailureBlock)failure;
@end
