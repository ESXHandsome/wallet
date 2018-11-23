//
//  UIView+EOCLayout.m
//  WeiXinFriendCircle
//
//  Created by EOC on 2017/5/8.
//  Copyright © 2017年 @八点钟学院. All rights reserved.
//

#import "UIView+SYLayout.h"

@implementation UIView (SYLayout)

- (CGFloat)height{
    return self.frame.size.height;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (CGSize)size{
    return self.frame.size;
}
- (CGPoint)origin{
    return self.frame.origin;
}
- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX{
    self.center = CGPointMake(centerX, self.center.y);
}
- (void)setCenterY:(CGFloat)centerY{
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setSize:(CGSize)size{
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

- (CGFloat)centerY{
    return self.center.y;
}

- (CGFloat)left{
    return self.frame.origin.x;
}

- (CGFloat)top{
    return self.frame.origin.y;
}

- (CGFloat)bottom{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)right{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    
    self.frame  = ({
        CGRect rect = self.frame;
        rect.origin.x = x;
        rect;
    });
}
- (void)setLeft:(CGFloat)left{
    
    self.frame  = ({
        CGRect rect = self.frame;
        rect.origin.x = left;
        rect;
    });
}

- (void)setRight:(CGFloat)right{
    
    self.frame  = ({
        CGRect rect = self.frame;
        rect.origin.x = right - rect.size.width;
        rect;
    });
}

- (void)setTop:(CGFloat)top{
    
    self.frame  = ({
        CGRect rect = self.frame;
        rect.origin.y = top;
        rect;
    });
}

- (void)setY:(CGFloat)y{
    self.frame  = ({
        CGRect rect = self.frame;
        rect.origin.y = y;
        rect;
    });
}

- (void)setOrigin:(CGPoint)origin{
    self.frame  = ({
        CGRect rect = self.frame;
        rect.origin = origin;
        rect;
    });
}

- (void)setBottom:(CGFloat)bottom{
    
    self.frame  = ({
        CGRect rect = self.frame;
        rect.origin.y = bottom - rect.size.height;
        rect;
    });
}

- (void)setWidth:(CGFloat)width{
    self.frame = ({
        CGRect rect = self.frame;
        rect.size.width = width;
        rect;
    });
}

- (void)setHeight:(CGFloat)height{
    
    self.frame = ({
        CGRect rect = self.frame;
        rect.size.height = height;
        rect;
    });
}

- (void)equalFrameToView:(UIView*)view{
    
    self.frame = view.frame;
}

- (void)equalFrameToSuperView:(UIView*)view{

    [self setX:0];
    [self setY:0];
    [self equalSizeToView:view];
}

- (void)equalSizeToView:(UIView*)view{
    
    [self setWidth:view.frame.size.width];
    [self setHeight:view.frame.size.height];
}

- (void)equalXToView:(UIView *)view{
    
    [self setX:view.frame.origin.x];
}

- (void)equalYToView:(UIView *)view{
    
    [self setY:view.frame.origin.y];
}



- (void)bottomEqualSuperViewBottom{
 
    if (![self superview]) {
        return;
    }
    UIView *supView = [self superview];
    [self setY:supView.frame.size.height - self.frame.size.height];
    
}
- (void)setBottomToSuperBotttomGap:(CGFloat)Gap{
    
    if (![self superview]) {
        return;
    }
    
    UIView *supView = [self superview];
    [self setY:supView.frame.size.height - self.frame.size.height - Gap];
    
}

- (void)bottomEqualToTopOfView:(UIView*)targetView{

    [self setY:targetView.y - self.height];
    
}

@end
