//
//  WLNTradeLawBOrderDetailFootView.m
//  KangYangChain
//
//  Created by furao on 2018/11/5.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeLawBOrderDetailFootView.h"

@implementation WLNTradeLawBOrderDetailFootView


- (void)setDic:(NSMutableDictionary *)dic{

    if (dic == nil) {
        return;
    }
    
   
    
    self.cut.timestamp = [dic[@"time"]integerValue];
    weakSelf(self);
    [self.cut setDidChangeBlock:^(NSInteger minute, NSInteger second) {
        
        weakself.timeLab.text = [NSString stringWithFormat:@"%ld'%ld' 后超时取消",minute,second];
        weakself.timelabB.text  = [NSString stringWithFormat:@"确认收款(剩余 %ld分%ld秒)",minute,second];
    }];
    
    
    
    NSInteger status = [dic[@"status"] integerValue];
    
    if (status == 0) {
        self.topView.hidden = NO;
        self.bottomView.hidden = YES;
        
    }else if (status == 1){
        self.topView.hidden = YES;
        self.bottomView.hidden = NO;
        
    }
    
    
    
}
- (CZCountDownView *)cut{
    
    if (_cut == nil) {
        _cut = [CZCountDownView countDown];
    }
    return _cut;
}

@end
