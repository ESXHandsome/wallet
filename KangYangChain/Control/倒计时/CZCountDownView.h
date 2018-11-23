//
//  CZCountDownView.h
//  countDownDemo
//
//  Created by 孔凡列 on 15/12/9.
//  Copyright © 2015年 czebd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TimerStopBlock)();

@interface CZCountDownView : UIView
// 时间戳
@property (nonatomic,assign)NSInteger timestamp;

// 时间停止后回调
@property (nonatomic,copy)TimerStopBlock timerStopBlock;

@property (nonatomic, strong) void (^didChangeBlock)(NSInteger minute,NSInteger second);


/**
 *  创建单例对象
 */
+ (instancetype)shareCountDown;// 工程中使用的倒计时是唯一的

/**
 *  创建非单例对象
 */
+ (instancetype)countDown; // 工程中倒计时不是唯一的

@end
