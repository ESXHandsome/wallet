//
//  WLNData+Net.m
//  KangYangChain
//
//  Created by edz on 2018/10/29.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNData+Net.h"

@implementation WLNData (Net)

- (BOOL)__judgeUrl:(NSString *)url{
    
    if (url.length == 0) {
        return NO;
    }else{
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        return YES;

    }
    
}

- (NSData *)getDataWithDic:(NSDictionary *)dic{
   
    for (NSString *str in dic.allKeys) {
        
        if ([str isEqualToString:@"avatar"]) {
            
            return dic[@"avatar"];
            
        }else if ([str isEqualToString:@"image1"]){
            
            return dic[@"image1"];
        }
        
        
    }
    return nil;
    
    
    
}
- (NSString *)getKeyWithDic:(NSDictionary *)dic{
    
    for (NSString *key in dic.allKeys) {
        
        if ([key isEqualToString:@"avatar"]) {
            
            return @"avatar";
            
        }else if ([key isEqualToString:@"image1"]){
            
            return @"image1";
        }
        
    }
    return nil;
    
}
- (void)__updatePicWithUrl:(NSString *)url params:(NSDictionary *)params resultBlock:(void(^)(id result))block failureBlock:(void(^)( NSError * _Nonnull error))failureblock{
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSUTF8StringEncoding];
    
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];

    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
  
        [formData appendPartWithFileData:[self getDataWithDic:params] name:[self getKeyWithDic:params] fileName:@"image.png" mimeType:@"image/png"];

        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
     
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     
        
        if (block) {
            block(responseObject);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failureblock) {
            failureblock(error);
            
        }
        
        
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
- (void)__getDataWithUrl:(NSString *)url params:(NSDictionary *)params resultBlock:(void(^)(id result))block failureBlock:(void(^)( NSError * _Nonnull error))failureblock{
    
    
   
    if (![self __judgeUrl:url]) {
        return;
    }
    
   
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSUTF8StringEncoding];
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            if (block) {
                
                block(responseObject);
            }
            
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failureblock) {
            failureblock(error);
        }
        
        
        
        
    }];
    
}
- (void)__postDataWithUrl:(NSString *)url params:(NSDictionary *)params resultBlock:(void(^)(id result))block failureBlock:(void(^)( NSError * _Nonnull error))failureblock{
    
    
    
    if (![self __judgeUrl:url]) {
        return;
    }
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSUTF8StringEncoding];
    
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"contentType"];
    
    [manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", @"text/plain",nil]];
    
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            if (block) {
                
                block(responseObject);
            }
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failureblock) {
            
            failureblock(error);
            
        }
        
    }];
    
    
    
    
    
}
- (void)getWithDic:(NSMutableDictionary *)dic{
    
    [self __getDataWithUrl:dic[URLS] params:dic[PRAMAS] resultBlock:^(id result) {
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
            
            [self.reqDelegate result:result sel:NSStringFromSelector(_cmd)];
            
        }
        
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
            
            [self.reqDelegate faild:error sel:NSStringFromSelector(_cmd)];
            
        }
        
        
    }];
    
    
    
    
}
- (void)postWithDic:(NSMutableDictionary *)dic{
    
    dic[PRAMAS][@"token"] = self.userModel.token;
    

    [self __postDataWithUrl:dic[URLS] params:dic[PRAMAS] resultBlock:^(id result) {
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
            
            [self.reqDelegate result:result sel:NSStringFromSelector(_cmd)];
            
        }
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
            
            [self.reqDelegate faild:error sel:NSStringFromSelector(_cmd)];
            
        }
        
        
    }];
    
    
    
}

- (void)updatePicWithDic:(NSMutableDictionary *)dic{
    
    dic[PRAMAS][@"token"] = self.userModel.token;

    [self __updatePicWithUrl:dic[URLS] params:dic[PRAMAS] resultBlock:^(id result) {
        
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
            
            [self.reqDelegate result:result sel:NSStringFromSelector(_cmd)];
            
        }
        
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
            
            [self.reqDelegate faild:error sel:NSStringFromSelector(_cmd)];
            
        }
        
    }];
    
    
    
    
    
}

@end
