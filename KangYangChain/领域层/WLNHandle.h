//
//  WLNHandle.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLNHandle : NSObject<WLNReqstProtocol,WLNEmptyProtocol>

@property (nonatomic, assign) SEL sel;

@property (nonatomic, assign) BOOL hiddenTip;


- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost;

- (void)__requestWith:(NSString *)url dic:(NSMutableDictionary *)dic sel:(SEL)sel isPost:(BOOL)isPost hiddenTip:(BOOL)hiddenTip; //缺省图默认展示

@end
