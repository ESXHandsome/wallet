//
//  Click.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "Click.h"

@implementation Click

- (void)sendEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeTouches) {
        if ([[event.allTouches anyObject] phase] == UITouchPhaseBegan) {
            
            
//        UITouch *touch = event.allTouches;

        }
    }
    [super sendEvent:event];
}

@end
