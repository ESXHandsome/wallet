//
//  User.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        
        self.userid = dic[@"user_id"];
        self.token = dic[@"token"];
        self.avatar = dic[@"avatar"];
        self.nickname = dic[@"nickname"];
        
        
        
        
    }
    
    return self;
}

@end
