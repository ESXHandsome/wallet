//
//  User.h
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject <WLNModelProtocol>

//@property (nonatomic, strong) NSString *userID:
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *nickname;



@end

NS_ASSUME_NONNULL_END
