//
//  WalletInformationTableViewCell.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    top,
    medium,
    next,
    bottom
} type;

@interface WalletInformationTableViewCell : UITableViewCell
-(void)setIconImage:(nonnull UIImage *)image;

- (void)cornerRadius:(type)type;
@end

NS_ASSUME_NONNULL_END
