//
//  WLNTradeHeadView.h
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLNTradeHeadView : UIView

+ (WLNTradeHeadView *)shared;
@property (nonatomic, strong) NSMutableArray *topArr;
@property (nonatomic, strong) NSMutableArray *bottomArr;

@property (nonatomic, strong) NSMutableArray *topBtnArr;
@property (nonatomic, strong) NSMutableArray *bottomBtnArr;


@property (nonatomic, strong) void (^didClickTopBLock)(NSInteger tag);
@property (nonatomic, strong) void (^didClickBottomBLock)(NSInteger tag);


@end
