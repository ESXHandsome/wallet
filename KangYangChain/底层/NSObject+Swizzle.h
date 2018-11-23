//
//  NSObject+Swizzle.h
//  QHSafeException
//
//  Created by QianHan on 2017/12/6.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzleMethod:(SEL)originalSEL swizzledSelector:(SEL)SwizzledSEL;

@end
