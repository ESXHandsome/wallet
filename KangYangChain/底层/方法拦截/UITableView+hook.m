//
//  UITableView+hook.m
//  KangYangChain
//
//  Created by furao on 2018/10/20.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "UITableView+hook.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
@implementation UITableView (hook)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(setDelegate:);
        SEL swizzingSelector = @selector(newSetDelegate:);
        
        [self swizzleMethod:originalSelector swizzledSelector:swizzingSelector];

    });
}

-(void)newSetDelegate:(id<UITableViewDelegate>)delegate
{
    [self newSetDelegate:delegate];
    
    SEL sel = @selector(tableView:didSelectRowAtIndexPath:);
    
    //这里要与底下保持一致,最好能唯一
    SEL newSel =  @selector(newTableView:didSelectRowAtIndexPath:);
    
    class_addMethod([delegate class],
                    newSel,
                    method_getImplementation(class_getInstanceMethod([self class], @selector(newTableView:didSelectRowAtIndexPath:))),
                    nil);

    if ([self isContainSel:sel inClass:[delegate class]])
    {
        IMP imp = method_getImplementation(class_getInstanceMethod([delegate class], sel));
        class_addMethod([delegate class], sel, imp, nil);
    }
    
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{

        [[delegate class] swizzleMethod:sel swizzledSelector:newSel];

    });


}
- (BOOL)isContainSel:(SEL)sel inClass:(Class)class {
    unsigned int count;
    Method *methodList = class_copyMethodList(class,&count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSString *tempMethodString = [NSString stringWithUTF8String:sel_getName(method_getName(method))];
        if ([tempMethodString isEqualToString:NSStringFromSelector(sel)]) {
            return YES;
        }
    }
    return NO;
}
-(void)newTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //这里要跟上方保持一致，调用原本didSelectRowAtIndexPath方法
//    SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@/%@/%ld", NSStringFromClass([self class]),  NSStringFromClass([tableView class]), tableView.tag]);
//
//    if ([self respondsToSelector:sel]) {
//        IMP imp = [self methodForSelector:sel];
//        void (*func)(id, SEL,id,id) = (void *)imp;
//        func(self, sel,tableView,indexPath);
//    }
//
    NSLog(@"我被抓住了");

    [self newTableView:tableView didSelectRowAtIndexPath:indexPath];
    
//
//    if ([NSStringFromClass([self class]) isEqualToString:@"WLNMineCtr"] && indexPath.section == 2) {
//        
//        [self newTableView:tableView didSelectRowAtIndexPath:indexPath];
//
//    }else{
//        
//        [SVProgressHUD showErrorWithStatus:@"功能开发中"];
//    }
  

    
}
@end
