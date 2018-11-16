//
//  LoginManager.h
//  Wallet
//
//  Created by Ying on 2018/10/26.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginManager : NSObject

/**给个单例,用来判断是否登录*/
+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
