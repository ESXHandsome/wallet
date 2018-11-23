//
//  UITextField+Set.m
//  KangYangChain
//
//  Created by edz on 2018/10/18.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UITextField+Set.h"

@implementation UITextField (Set)
/*
 设置键盘左间距
 */

-(void)letPadding:(CGFloat)leftWidth
{
    CGRect frame = self.frame;
    frame.size.width = leftWidth;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftview;
}
- (void)changePlaceHolderDefaultColor{
    
    [self setValue:rgba(200, 200, 200, 1) forKeyPath:@"_placeholderLabel.textColor"];

}
- (void)changePlaceHolderWithColor:(UIColor *)color{
    if (color == nil) {
        color = UIColor.whiteColor;
    }
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];

}

@end
