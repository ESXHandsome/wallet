//
//  LLFileManager.h
//  Wallet
//
//  Created by Ying on 2018/10/22.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLFileManager : NSObject

/**
    获取文件路径

 @return 文件路径
 */
- (NSString*)getDocumentPath;

/**
    创建文件夹

 @param dirName 文件名
 @return 是否创建成功
 */
- (BOOL)createDir:(NSString *)dirName;

/**
    创建文件
 
 @param fileName 需要创建文件的名字
 @param pathName 文件路径名字
 @return 是否创建成功
 */
- (BOOL)createFile:(NSString *)fileName dirPathName:(NSString *)pathName;

/**
    写入文件

 @param content 写入的内容
 @param filePath 文件的路径
 @return 是否写入成功
 */
- (BOOL)writeToFile:(NSString *)content filePath:(NSString *)filePath;



@end

NS_ASSUME_NONNULL_END
