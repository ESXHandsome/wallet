//
//  WLNQRCode.h
//  KangYangChain
//
//  Created by furao on 2018/10/11.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNQRCode : NSObject

- (UIImage *)jy_QRCodeFromString:(NSString *)code size:(CGFloat)size;



@end

NS_ASSUME_NONNULL_END
