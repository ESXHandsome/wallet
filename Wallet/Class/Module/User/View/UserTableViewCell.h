//
//  UserTableViewCell.h
//  Wallet
//
//  Created by Ying on 2018/10/19.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    top,
    bottom
} type;

@interface UserTableViewCell : UITableViewCell

- (void)setIconImage:(nonnull UIImage *)image;

- (void)cornerRadius:(type)type;


@end

NS_ASSUME_NONNULL_END
