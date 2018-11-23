//
//  UIGestureRecognizer+hook.m
//  KangYangChain
//
//  Created by furao on 2018/10/20.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "UIGestureRecognizer+hook.h"

#import "NSObject+Swizzle.h"

@implementation UIGestureRecognizer (hook)
+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL oldSEL = @selector(initWithTarget:action:);
        SEL newSEL = @selector(new_initWithTarget:action:);
        
        [self swizzleMethod:oldSEL swizzledSelector:newSEL];

    });
                  
  
    
    
}
- (instancetype)new_initWithTarget:(id)target action:(SEL)action{
    
    if (!action) {
        return [self new_initWithTarget:target action:action];

    }
 
    Class class = [target class];
    
    SEL oldSEL = action;
    
    SEL newSEL = NSSelectorFromString(@"newAction:");

    BOOL isAddMethod = class_addMethod(class, newSEL ,method_getImplementation(class_getInstanceMethod([self class], @selector(newAction:))), nil);
    
    if (isAddMethod) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            [class swizzleMethod:oldSEL swizzledSelector:newSEL];

        });
        

    }
    return [self new_initWithTarget:target action:action];

}
- (void)newAction:(id)parameter{

    NSLog(@"%@",parameter);
    
    [self newAction:parameter];
    
    
}

@end
