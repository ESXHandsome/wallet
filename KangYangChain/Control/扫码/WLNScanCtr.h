//
//  WLNScanCtr.h
//  KangYangChain
//
//  Created by edz on 2018/10/24.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNScanCtr : UIViewController

@property (nonatomic, strong) void (^didResultBackBlock)(NSString *str);

@end

NS_ASSUME_NONNULL_END
