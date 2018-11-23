//
//  UITextField+Set.h
//  KangYangChain
//
//  Created by edz on 2018/10/18.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Set)

- (void)letPadding:(CGFloat)leftWidth;

- (void)changePlaceHolderDefaultColor;

- (void)changePlaceHolderWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
