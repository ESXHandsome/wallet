//
//  UIControl+hook.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIControl+hook.h"

#import "NSObject+Swizzle.h"
@implementation UIControl (hook)

+(void)load{
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzingSelector = @selector(fr_sendAction:to:forEvent:);
        
        [self swizzleMethod:originalSelector swizzledSelector:swizzingSelector];
        

    });
                  
    
  
 
}
- (void)fr_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    
    NSLog(@"🍌🍌🍌当前点击方法 : %@ - %@",target,NSStringFromSelector(action));
    
    [self fr_sendAction:action to:target forEvent:event];
    
    
    
}
@end
