//
//  NSObject+Swizzle.m
//  QHSafeException
//
//  Created by QianHan on 2017/12/6.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzle)

+ (void)swizzleMethod:(SEL)originalSEL swizzledSelector:(SEL)swizzledSEL {
    Class class = [self class];
    //原有方法
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    //替换原有方法的新方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
    //先尝试給源SEL添加IMP，这里是为了避免源SEL没有实现IMP的情况
    // 方法的实现
    IMP originalIMP = method_getImplementation(originalMethod); //class_getMethodImplementation(class, originalSEL);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);//class_getMethodImplementation(class, SwizzledSEL);
    
    // 是否添加成功方法:添加了初始方法，实现内容指向目标方法体
    BOOL isSuccess = class_addMethod(class, originalSEL, swizzledIMP, method_getTypeEncoding(swizzledMethod));
    if (isSuccess) {
        // 初始指向目标，那么把目标的内容指向初始
        class_replaceMethod(class, swizzledSEL, originalIMP, method_getTypeEncoding(originalMethod));
    }
    else{
        // 没有添加成功说明已经存在，就交换
        // 注意，这里交换的是IMP 实现
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
