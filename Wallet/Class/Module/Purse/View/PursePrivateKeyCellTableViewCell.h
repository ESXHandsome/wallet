//
//  PursePrivateKeyCellTableViewCell.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    top,
    bottom
} type;

@interface PursePrivateKeyCellTableViewCell : UITableViewCell

- (void)cornerRadius:(type)type;

@end

NS_ASSUME_NONNULL_END
