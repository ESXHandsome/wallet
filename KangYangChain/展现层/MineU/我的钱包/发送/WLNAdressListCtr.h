//
//  WLNAdressListCtr.h
//  KangYangChain
//
//  Created by edz on 2018/11/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNAdressListCtr : UIViewController

@property (nonatomic, strong) void (^didAddressBlock)(NSString *address);

@end

NS_ASSUME_NONNULL_END
