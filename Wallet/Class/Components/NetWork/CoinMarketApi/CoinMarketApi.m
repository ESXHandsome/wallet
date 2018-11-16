//
//  CoinMarketApi.m
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "CoinMarketApi.h"

@implementation CoinMarketApi

+ (void)httpRequestToCoinMarket:(CoinType)type
                        success:(SuccessBlock)success
                         failed:(FailureBlock)failed {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    /**配置请求头*/
    manager.requestSerializer.timeoutInterval = 100;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    /**价格请求地址*/
    NSString *url = @"";
    if (type == BTC) {
        /**比特币价格地址*/
        url = @"https://api.coinmarketcap.com/v2/ticker/1/?convert=CNY";
    } else {
        /**以太坊价格地址*/
        url = @"https://api.coinmarketcap.com/v2/ticker/1027/?convert=CNY";
    }
    
    [manager GET: url
      parameters:@{}
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject[@"data"][@"quotes"][@"CNY"][@"price"]) {
                NSString *price = responseObject[@"data"][@"quotes"][@"CNY"][@"price"];
                price = [NSString stringWithFormat:@"%0.2f", [price floatValue]];
                
                /**完成  需要回调*/
                success(price);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failed(1000);
            /**完成 需要回调*/
        }];
}

@end
