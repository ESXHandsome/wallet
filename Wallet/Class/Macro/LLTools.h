//
//  LLTools.h
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#ifndef LLTools_h
#define LLTools_h

/**获取颜色*/
#define GetColor(colorName) [UIColor colorWithString:[NSString stringWithFormat:@"%@",colorName]]

/**获取图片*/
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

/**keyWindow*/
#define KeyWindow [UIApplication sharedApplication].keyWindow

/**屏幕宽*/
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width

/**屏幕高*/
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

/**屏幕边界*/
#define SCREEN_BOUNDS   [UIScreen mainScreen].bounds

/**iphoneX 判定*/
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/**状态栏*/
#define STATUS_BAR_HEIGHT CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame)

/**导航栏*/
#define NAVIGATION_BAR_HEIGHT (IS_IPHONE_X ? 88.f : 64.f)

/**标签栏*/
#define TAB_BAR_HEIGHT 49

/**国际化文本*/
#define Text(string) NSLocalizedStringFromTable(string, @"InfoPlist", nil)


//语言切换
static NSString * const AppLanguage = @"appLanguage";

#define ZBLocalized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:AppLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:@"InfoPlist"]



// 自定义NSLog,在debug模式下打印，在release模式下取消一切NSLog
#ifdef DEBUG
#define XLLog(FORMAT, ...) fprintf(stderr,"<%s:%d>:\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define XLLog(FORMAT, ...) nil
#endif



#endif /* LLTools_h */
