//
//  NSString+Set.m
//  KangYangChain
//
//  Created by edz on 2018/11/2.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSString+Set.h"

@implementation NSString (Set)
+ (void)initialize{
    
}
- (void)copyCustum{
    
    UIPasteboard * pastboard = [UIPasteboard generalPasteboard];
    
    pastboard.string = self;
    
}
- (NSString *)Intl{
    
    return NSLocalizedString(self, nil);
    
}
- (NSURL *)url{
    
    return [NSURL URLWithString:self];
}
- (UIColor *)color{
    
    return [UIColor performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@Color",self])];
    
}
- (UIViewController *)instance{
    
    UIViewController *vc = [NSClassFromString(self) new];
    if (vc == nil) {
        vc = [UIViewController new];
    }
    vc.hidesBottomBarWhenPushed = YES;
    
    return vc;
    
}
- (UIImage *)image{
    
    return [UIImage imageNamed:self];
    
}
- (void)call{
    
    [ACETelPrompt callPhoneNumber:self call:^(NSTimeInterval duration) {
        
        
    } cancel:^{
        
        
    }];
    
    
}
@end
