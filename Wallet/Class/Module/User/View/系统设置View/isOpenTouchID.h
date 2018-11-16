//
//  isOpenTouchID.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface isOpenTouchID : NSObject
+ (instancetype)sharedInstance;

-(void) OpenTouchID;
-(void) isOpen;
@end

NS_ASSUME_NONNULL_END
