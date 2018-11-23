//
//  Order.h
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject <WLNModelProtocol>

@property (nonatomic, strong) NSString *add_time;
@property (nonatomic, strong) NSString *add_type;
@property (nonatomic, strong) NSString *days;
@property (nonatomic, strong) NSString *end_time;
@property (nonatomic, strong) NSString *ids;
@property (nonatomic, strong) NSString *num;

@property (nonatomic, strong) NSString *scale;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSString *update_time;



@end

NS_ASSUME_NONNULL_END
