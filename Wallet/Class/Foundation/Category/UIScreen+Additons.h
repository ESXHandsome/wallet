//
//  UIScreen+Additons.h
//  TestDemo
//
//  Created by 李英 on 2017/6/13.
//  Copyright © 2017年 李英. All rights reserved.
//

#import <UIKit/UIKit.h>

#define adaptWidth750(num)          [UIScreen numberFromWidth750:(num)]
#define adaptHeight1334(num)        [UIScreen numberFromWidth750:(num)]
#define adaptFontSize(num)          [UIScreen numberFromWidth750:(num)]

@interface UIScreen (Additons)

//宽度自适应
+ (float)numberFromWidth750:(float)number;
//高度自适应
+ (float)numberFromHeight1334:(float)number;
//字体大小
+ (float)numberFontSize:(float)number;

@end
