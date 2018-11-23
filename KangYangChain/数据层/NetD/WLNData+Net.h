//
//  WLNData+Net.h
//  KangYangChain
//
//  Created by edz on 2018/10/29.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNData.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNData (Net)

- (void)getWithDic:(NSMutableDictionary *)dic;

- (void)postWithDic:(NSMutableDictionary *)dic;

- (void)updatePicWithDic:(NSMutableDictionary *)dic;


@end

NS_ASSUME_NONNULL_END
