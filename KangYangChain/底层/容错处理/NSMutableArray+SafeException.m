//
//  NSMutableArray+SafeException.m
//  QHSafeException
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSMutableArray+SafeException.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSMutableArray (SafeException)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndex:) swizzledSelector:@selector(qh_objectAtIndex:)];
        [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(qh_objectAtIndexedSubscript:)];
        [objc_getClass("__NSArrayM") swizzleMethod:@selector(insertObject:atIndex:) swizzledSelector:@selector(qh_insertObject:atIndex:)];
        [objc_getClass("__NSArrayM") swizzleMethod:@selector(removeObjectsInRange:) swizzledSelector:@selector(qh_removeObjectsInRange:)];
        [objc_getClass("__NSArrayM") swizzleMethod:@selector(exchangeObjectAtIndex:withObjectAtIndex:) swizzledSelector:@selector(qh_exchangeObjectAtIndex:withObjectAtIndex:)];
    });
}

- (void)qh_insertObject:(id)object atIndex:(NSInteger)index {
    if (object == nil
        || index > self.count) {
        return;
    }
    [self qh_insertObject:object atIndex:index];
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

- (void)qh_removeObjectsInRange:(NSRange)range {
    if (range.location >= self.count) {
        return;
    }
    [self qh_removeObjectsInRange:range];
}

- (void)qh_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    if (idx1 >= self.count
        || idx2 >= self.count) {
        return;
    }
    [self qh_exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

@end
