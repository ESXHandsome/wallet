//
//  UIView+Set.m
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIView+Set.h"

@implementation UIView (Set)


- (id)forwarder{
    
    return objc_getAssociatedObject(self, @selector(forwarder));
    
    
}
- (void)setForwarder:(id)forwarder{
    
    objc_setAssociatedObject(self, @selector(forwarder), forwarder, OBJC_ASSOCIATION_ASSIGN);
    
}

//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    NSLog(@"forwardInvocation: %@", NSStringFromSelector([anInvocation selector]));
//
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSLog(@"method signature for selector: %@", NSStringFromSelector(aSelector));
//    if (aSelector == @selector(code)) {
//        return [NSMethodSignature signatureWithObjCTypes:"V@:@"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self.forwarder;
    
}
- (void)shadow{
    
    
    self.layer.shadowRadius = 1;
    
    self.layer.shadowOpacity = 0.2;
    
    self.layer.shadowColor = UIColor.grayColor.CGColor;
    
    self.layer.shadowOffset = CGSizeMake(0,0);
    
    
}



@end
