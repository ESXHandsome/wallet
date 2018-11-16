//
//  PurseExportViewCell.h
//  Wallet
//
//  Created by 谷澍 on 2018/11/6.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    top,
    bottom
} type;

@interface PurseExportViewCell : UITableViewCell

- (void)setIconImage:(nonnull UIImage *)image;

- (void)cornerRadius:(type)type;

@end

NS_ASSUME_NONNULL_END
