//
//  UIScreen+Additons.m
//  TestDemo
//
//  Created by 李英 on 2017/6/13.
//  Copyright © 2017年 李英. All rights reserved.
//

#import "UIScreen+Additons.h"

@implementation UIScreen (Additons)

//宽度自适应
+ (float)numberFromWidth750:(float)number
{
    return number * SCREEN_WIDTH / 750.0f;
}

//高度自适应
+ (float)numberFromHeight1334:(float)number
{
    return ((number * SCREEN_HEIGHT) / 1334.0f);
}

/** 字体大小  可以根据UI需要修改*/
+ (float)numberFontSize:(float)number
{
    return ((number * SCREEN_HEIGHT) / 1334.0f);
}

@end
