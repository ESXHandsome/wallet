//
//  NetworkManager.m
//  vhum
//
//  Created by Ying on 2018/8/10.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "NetworkManager.h"
#import <CommonCrypto/CommonDigest.h>

@interface NetworkManager ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation NetworkManager

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static id sharedInstance;
    dispatch_once(&onceToken, ^{ sharedInstance = [self new]; });
    return sharedInstance;
}

- (AFHTTPSessionManager *)manager:(NSString *)url {
    
    AFHTTPSessionManager *manager = self.manager;
    
    manager.requestSerializer.timeoutInterval = 10;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                                              @"text/json",
                                                                              @"text/javascript",
                                                                              @"text/html",
                                                                              @"text/plain",
                                                                              nil];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
 
//    if([url isEqualToString:@"http://39.104.137.90:8090/v1/user/login"]){
//         [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        NSLog(@"进入x-www-form-urlencoded");
//    }else{
//        [manager.requestSerializer setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
//        NSString *tokenme=[[NSUserDefaults standardUserDefaults] valueForKey:@"tokenmessage"];
//        [manager.requestSerializer setValue:tokenme forHTTPHeaderField:@"authorization"];
//        NSLog(@"network message is %@",tokenme);
//        NSLog(@"进入plain");
//    }
//    [manager.requestSerializer setValue:WalletApiValue forHTTPHeaderField:WalletApiKey];
  
    return manager;
}


- (NSURLSessionDataTask *)sendPostRequest: (NSString *)url
                            withParamDict: (NSDictionary *)parameters
                                  success: (SuccessBlock)success
                                  failure: (FailureBlock)failure {
    
    AFHTTPSessionManager  *manager = [self manager:url];
    
/* for AFNetworking 3.2.1*/
    NSURLSessionDataTask *task = [manager POST:url
                                    parameters:parameters
                                      progress:^(NSProgress * _Nonnull uploadProgress) { }
                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                           
                                           NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                          
                                           if (responseObject) {
                                               success(dict);
                                               return;
                                           }
                                           failure(HTTP_RESPONSE_NIL);
                                           
                                       }
                                       failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           
                                           NSLog(@"[Server Error]: %@", error);
                                           failure(error.code);
                                       }];
    return task;
}
- (NSURLSessionDataTask *)sendPostRequestforstring: (NSString *)url
                            withParamDict: (NSString *)parameters
                                  success: (SuccessBlock)success
                                  failure: (FailureBlock)failure {
    
    AFHTTPSessionManager  *manager = [self manager:url];
    
    /* for AFNetworking 3.2.1 */
    NSURLSessionDataTask *task = [manager POST:url
                                    parameters:parameters
                                      progress:^(NSProgress * _Nonnull uploadProgress) { }
                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                           
                                           NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                          
                                           if (responseObject) {
                                               success(dict);
                                               return;
                                           }
                                           failure(HTTP_RESPONSE_NIL);
                                           
                                       }
                                       failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           
                                           NSLog(@"[Server Error]: %@", error);
                                           failure(error.code);
                                       }];
    
    return task;
}

-(AFHTTPSessionManager *)manager{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}



@end
