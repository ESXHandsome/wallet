//
//  WLNMineGHBHeadCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineGHBHeadCell : FlexBaseTableCell
@property (nonatomic, strong) void (^didClickBlock)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
