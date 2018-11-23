//
//  Money.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "Money.h"

@implementation Money

- (id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        
        self.address = dic[@"address"];
        self.words = dic[@"words"];
        self.privatekey = dic[@"private"];
        self.type = dic[@"type"];
        
        
        
    }
    return self;
    
}
- (void)setBalance:(NSNumber *)balance{
    
    
    _balance = balance;
    
    
    double numd = [balance doubleValue];
    
    numd = numd / pow(10,8);
    
    
    self.changeBalance = numd;
    
    
}
@end
