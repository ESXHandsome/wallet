//
//  NSArray+SafeException.m
//  QHSafeException
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSArray+SafeException.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSArray (SafeException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSPlaceholderArray") swizzleMethod:@selector(initWithObjects:count:) swizzledSelector:@selector(qh_initWithObjects:count:)];
        [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(qh_objectAtIndex:)];
        [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(qh_objectAtIndexedSubscript:)];
        [objc_getClass("__NSSingleObjectArrayI") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(qh_singleObjectAtIndex:)];
        [objc_getClass("__NSArray0") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(qh_objectIndex0:)];
    });
}

- (instancetype)qh_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)count {
    id safeObjects[count];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < count; i++) {
        id obj = objects[i];
        if (!obj) {
            obj = @"";
        }
        safeObjects[j] = obj;
        j++;
    }
    return [self qh_initWithObjects:safeObjects count:j];
}

- (id)qh_objectAtIndex:(NSInteger)index {
    if (index >= self.count
        || index < 0) {
        return nil;
    }
    return [self qh_objectAtIndex:index];
}

- (id)qh_objectAtIndexedSubscript:(NSInteger)index {
    if (index >= self.count
        || index < 0) {
        return nil;
    }
    return [self qh_objectAtIndexedSubscript:index];
}

- (id)qh_singleObjectAtIndex:(NSInteger)index {
    if (index >= self.count
        || index < 0) {
        return nil;
    }
    return [self qh_singleObjectAtIndex:index];
}

- (id)qh_objectIndex0:(NSInteger)index {
    if (index >= self.count
        || index < 0) {
        return nil;
    }
    return [self qh_objectIndex0:index];
}

@end
