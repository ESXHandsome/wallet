//
//  ZBLocalized.h
//  ZBKit
//
//  Created by NQ UEC on 2017/5/12.
//  Copyright © 2017年 Suzhibin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBLocalized : NSObject

+ (ZBLocalized *)sharedInstance;

//初始化多语言功能
- (void)initLanguage;

//当前语言
- (NSString *)currentLanguage;

//设置要转换的语言
- (void)setLanguage:(NSString *)language;

//设置为系统语言
- (void)systemLanguage;

@end

