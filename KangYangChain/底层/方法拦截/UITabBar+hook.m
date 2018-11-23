//
//  UITabBar+hook.m
//  KangYangChain
//
//  Created by furao on 2018/11/6.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "UITabBar+hook.h"
#import "NSObject+Swizzle.h"

@implementation UITabBar (hook)
+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(setHidden:);
        SEL swizzingSelector = @selector(new_setHidden:);
        
        [self swizzleMethod:originalSelector swizzledSelector:swizzingSelector];
        
        
    });
    
}
- (void)new_setHidden:(BOOL)hidden{
    
    [self new_setHidden:hidden];
}
@end
