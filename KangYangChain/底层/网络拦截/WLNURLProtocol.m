//
//  WLNURLProtocol.m
//  KangYangChain
//
//  Created by furao on 2018/10/19.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNURLProtocol.h"

@implementation WLNURLProtocol



- (void)startLoading{
    
}

- (void)stopLoading{
    
    
    
}

+(BOOL)canInitWithRequest:(NSURLRequest *)request{
    
    NSURL *url = request.URL;
    
//    NSLog(@"🍇🍇🍇 当前网络请求:  %@",url.absoluteString);

    return NO;
}
+(NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request{
    return request;
}

@end
