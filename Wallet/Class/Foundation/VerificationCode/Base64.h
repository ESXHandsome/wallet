//
//  Base64.h
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Base64 : NSObject
+(NSString *)encryption:(NSString *)string;
+(NSString *)decrypt:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
