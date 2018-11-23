//
//  WLNHandle.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

@interface WLNHandle() 

@end

@implementation WLNHandle

/**
 所有请求返回结果全部经过这里
 
 */
- (void)result:(id)data sel:(NSString *)sel{
    
    
    
    if (![data isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"服务器返回数据格式错误");
        return;
    }
    
    NSDictionary *dic = (NSDictionary *)data;
    NSMutableArray *arr = @[].mutableCopy;
    
    for (NSString *key in dic.allKeys) {
        if ([key isEqualToString:@"code"]) {
            [arr addObject:key];
        }
    }
    if (arr.count == 0) {
        
        NSLog(@"服务器返回数据格式错误");
        return;
    }
    
    if ([data[@"code"] integerValue] == 200) {
        
        [self emptyDataHandleWith:data];
        
        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
            
            [self.reqDelegate result:data[@"data"] sel:NSStringFromSelector(self.sel)];
            
        }
        
    }else{
        
        if (self.reqDelegate  && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
            
            [self.reqDelegate faild:data[@"message"] sel:NSStringFromSelector(self.sel)];
            
        }else{
            [SVProgressHUD showErrorWithStatus:data[@"message"]];

        }
        
    }
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
    if ([data isKindOfClass:[NSError class]]) {
        
        NSError *error = (NSError *)data;
        NSLog(@"-----------------------------------%@",error.userInfo);
        
        
    }
    
}
/**
 空数据处理
 */
- (void)emptyDataHandleWith:(id)data{
    
    if (self.hiddenTip) {
        return;
    }
    
    if ([data[@"data"] isKindOfClass:[NSArray class]]) {
        
        if ([data[@"data"]count] == 0) {
            
            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(emptyShow)]) {
                [self.reqDelegate emptyShow];
                
            }
        }else{
            
            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(removeEmptyShow)]) {
                [self.reqDelegate removeEmptyShow];
                
            }
        }
        
        
    }
    
    
}


- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost{
    
    
    self.sel = sel;
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
    
    dicp[URLS] = url;
    
    dicp[PRAMAS] = dic == nil ? @{}.mutableCopy:dic;
    
    [self routeTargetName:@"WLNData" actionName:isPost ? @"postWithDic:": @"getWithDic:" param:dicp];
    
    
}
- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost hiddenTip:(BOOL)hiddenTip{


    self.hiddenTip = hiddenTip;
    
    self.sel = sel;

    NSMutableDictionary *dicp = @{}.mutableCopy;
    
    dicp[URLS] = url;
    
    dicp[PRAMAS] = dic == nil ? @{}.mutableCopy:dic;
    
    [self routeTargetName:@"WLNData" actionName:isPost ? @"postWithDic:": @"getWithDic:" param:dicp];
    
    
}

@end
