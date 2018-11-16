//
//  LLFileManager.m
//  Wallet
//
//  Created by Ying on 2018/10/22.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "LLFileManager.h"

@implementation LLFileManager

- (NSString*)getDocumentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (BOOL)createDir:(NSString *)dirName {
    NSString *documentsPath = [self getDocumentPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString * testDirectory = [documentsPath stringByAppendingPathComponent:dirName];
    BOOL res = [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    return res;
}

- (BOOL)createFile:(NSString *)fileName dirPathName:(NSString *)pathName {
    NSString *documentsPath = [self getDocumentPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString * testDirectory = [documentsPath stringByAppendingPathComponent:pathName];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:fileName];
    BOOL res = [fileManager createFileAtPath:testPath contents:nil attributes:nil];
    return res;
}

- (BOOL)writeToFile:(NSString *)content filePath:(NSString *)filePath {
    // 判断文件是否存在
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        return NO;
    }
    
    BOOL res = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    return res;
}

- (NSString *)readFile:(NSString *)filePath {
    NSString * content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return content;
}

- (unsigned long long)fileSizeAtPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (isExist) {
        unsigned long long fileSize = [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
        return fileSize;
    } else {
        return 0;
    }
}

@end
