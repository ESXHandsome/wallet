//
//  WLNMineScanHeadView.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineScanHeadView : UIView

+ (WLNMineScanHeadView *)shared;

@property (nonatomic, strong) NSMutableArray *topArr;
@property (nonatomic, strong) NSMutableArray *bottomArr;

@property (nonatomic, strong) NSMutableArray *topBtnArr;
@property (nonatomic, strong) NSMutableArray *bottomBtnArr;

@property (nonatomic, strong) void (^didTopClick)(void);


@end

NS_ASSUME_NONNULL_END
