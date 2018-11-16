//
//  UserConfigManager.m
//  Wallet
//
//  Created by Ying on 2018/10/22.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "UserConfigManager.h"

@implementation UserConfigManager

+ (BOOL)isBuild {
    NSString *home = NSHomeDirectory();
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    return [NSFileManager.new fileExistsAtPath:filePath];
}

+ (void)saveUserConfig:(NSMutableDictionary *)dic {
    NSString *home = NSHomeDirectory();
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    if (![NSFileManager.new fileExistsAtPath:filePath]) {
        [dic writeToFile:filePath atomically:YES];
    } else {
        NSMutableDictionary *newDic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        NSDictionary *oldDic = dic;
        [newDic addEntriesFromDictionary:oldDic];
        [newDic writeToFile:filePath atomically:YES];
    }
}

+ (NSMutableDictionary *)getUserConfigDic {
    NSString *home = NSHomeDirectory();
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

+ (void)updataUserConfigDic:(NSDictionary *)value key:(NSString *)key {
    NSString *home = NSHomeDirectory();
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    [dic setObject:value forKey:key];
    [dic writeToFile:filePath atomically:YES];
}

+ (void)removeUserConfigDicForKey:(NSString *)key {
    NSString *home = NSHomeDirectory();
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    [dic removeObjectForKey:key];
    [dic writeToFile:filePath atomically:YES];
}

+ (void)removeUserConfig {
    NSString *home = NSHomeDirectory();
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}
@end
