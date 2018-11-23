//
//  WLNShopAlertView.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNShopAlertView.h"
@interface WLNShopAlertView()
@property (nonatomic, strong) UIButton *backBtn;

@end
@implementation WLNShopAlertView

+ (WLNShopAlertView *)shared{
    
    static WLNShopAlertView *view;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        view  = [[WLNShopAlertView alloc]initWithFrame:CGRectMake(0, DEVICEHEIGHT, DEVICEHEIGHT,280)];

    });
        
    return view;
    
}
- (void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.backBtn];

    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
       
        self.frame = CGRectMake(0, DEVICEHEIGHT - 280, DEVICEWidth, 280);
        
        
    }];
    
    

}
- (void)dissmiss{
    
    [UIView animateWithDuration:0.5 animations:^{
    
        
        self.frame = CGRectMake(0, DEVICEHEIGHT, DEVICEWidth, 280);
        [self.backBtn removeFromSuperview];
        [self removeFromSuperview];
        
        
    }];
    
    
}

- (UIButton *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = [UIScreen mainScreen].bounds;
        _backBtn.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        [_backBtn addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _backBtn;
}


@end
