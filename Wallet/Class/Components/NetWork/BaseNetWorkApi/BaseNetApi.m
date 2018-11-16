//
//  BaseNetApi.m
//  vhum
//
//  Created by Ying on 2018/8/23.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "BaseNetApi.h"
#import "Network.h"

@implementation BaseNetApi

+ (void)httpRequestWithURL:(NSString *)url withParam:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    //打印请求的 url 和 数据, 方便调试
   
    XLLog(@"[Server Request]: %@ %@", url, param);
    
    [NetworkManager.shared sendPostRequest:url withParamDict:param success:^(id responseDict) {
        
        //TODO:讲道理  这里方便加一些成功通用的判断
        NSLog(@"请求成功");

        success(responseDict);
    
    } failure:^(NSInteger errorCode) {
    
        //TODO:讲道理  这里方便加一些失败通用的判断
        NSLog(@"请求失败: %long",errorCode);
        failure(errorCode);
    
    }];
    
}

+ (void)httpRequestWithURLforstring:(NSString *)url withParam:(NSString *)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    //打印请求的 url 和 数据, 方便调试
    
    XLLog(@"[Server Request]: %@ %@", url, param);
    
    [NetworkManager.shared sendPostRequestforstring:url withParamDict:param success:^(id responseDict) {
        
        //TODO:讲道理  这里方便加一些成功通用的判断
        NSLog(@"请求成功");
        success(responseDict);
        
    } failure:^(NSInteger errorCode) {
        
        //TODO:讲道理  这里方便加一些失败通用的判断
        NSLog(@"请求失败");
        failure(errorCode);
        
    }];
    
}

@end
