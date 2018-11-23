//
//  Order.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "Order.h"

@implementation Order

- (id)initWithDictionary:(NSDictionary *)dic{
    
    
    if (self) {
        
        
        self.add_time = dic[@"add_time"];
        self.add_type = [dic[@"add_type"] stringValue];
        self.days     = dic[@"days"];
        self.end_time = dic[@"end_time"];
        self.ids      = [dic[@"ids"] stringValue];
        self.num      = [dic[@"num"] stringValue];
        self.status   = dic[@"status"];
        self.type     = dic[@"type"];
        self.scale    = dic[@"scale"];
        
        
        
    }
    return self;
    
}
@end
