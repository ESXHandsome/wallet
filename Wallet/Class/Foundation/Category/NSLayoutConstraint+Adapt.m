//
//  NSLayoutConstraint+Adapt.m
//  NationalRedPacket
//
//  Created by fensi on 2018/4/4.
//  Copyright © 2018年 XLook. All rights reserved.
//

#import "NSLayoutConstraint+Adapt.h"

@implementation NSLayoutConstraint (Adapt)

@dynamic isAdaptScreen;

- (void)setIsAdaptScreen:(BOOL)isAdaptScreen {
    if (isAdaptScreen) {
        self.constant = self.constant * UIScreen.mainScreen.bounds.size.width / 375.0f;
    }
}

@end
