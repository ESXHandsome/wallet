//
//  WLNSingle.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNSingle.h"

@implementation WLNSingle

+ (WLNSingle *)shared{
    
    static WLNSingle* instance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[WLNSingle alloc]init];
        instance.bListArr = [NSMutableArray array];
        instance.bnameListArr = [NSMutableArray array];
        
        
    });
    
    return instance;
    
}
- (void)setCurrentType:(NSString *)currentType{
    
    _currentType = currentType;
    
    if ([currentType isEqualToString:@"BTC"]) {
        
        _current_model = self.btc_model;
        
    }else if ([currentType isEqualToString:@"USDT"]){
        
        _current_model = self.usdt_model;

    }else{
        
        _current_model = self.eth_model;

    }
    
    
}
@end
