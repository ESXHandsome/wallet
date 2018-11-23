//
//  WLNHandle+Wallet.m
//  KangYangChain
//
//  Created by furao on 2018/10/19.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Wallet.h"


#define TYPE_ARR @[BTCKEY,USDTKEY,ETHTKEY]

@implementation WLNHandle (Wallet)


- (void)bbAcount:(NSMutableDictionary *)dic{
    
    [self __requestWith:BBAcount dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)bbTypeList:(NSMutableDictionary *)dic{
    
    [self __requestWith:BBTypeList dic:dic sel:_cmd isPost:NO];
    
    
}

@end
