//
//  NSObject+Set.h
//  KangYangChain
//
//  Created by edz on 2018/11/2.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Set)

- (User *)userModel;

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName param:(id)param;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName blockParam:(void(^)(NSDictionary*))completion;

- (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;

- (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

/**
 此处必须使用strong
 */
@property (nonatomic, strong) id <WLNReqstProtocol> reqDelegate;



@end

NS_ASSUME_NONNULL_END
