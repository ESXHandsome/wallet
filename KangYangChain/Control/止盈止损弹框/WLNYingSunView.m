//
//  WLNYingSunView.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNYingSunView.h"

@implementation WLNYingSunView

+ (instancetype)shared{
    
    WLNYingSunView *view = [[WLNYingSunView alloc]initWithFrame:CGRectMake(30, (DEVICEHEIGHT - 130) / 2, DEVICEWidth - 60, 130)];
    view.center = [UIApplication sharedApplication].keyWindow.center;
    view.alpha = 0;
    view.yingsunTag = 1;
    return view;
    
}

- (void)yingsunAction:(UITapGestureRecognizer *)tap{
    
    self.yingsunTag = tap.view.tag;

    if (tap.view.tag == 1) {
        
        self.zhiyingView.backgroundColor = UIColor.grayColor;

        [self.zhisunView setViewAttr:@"underlayColor" Value:@"#ffffff"];
        
    }else{
        [self.zhiyingView setViewAttr:@"underlayColor" Value:@"#FFFFFF"];
        
        [self.zhisunView setViewAttr:@"underlayColor" Value:@"#A5A5A5"];
    }
   
}

- (void)show{
    
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.backView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.2 animations:^{
       
        
        self.frame = CGRectMake(30, (DEVICEHEIGHT - 130) / 2, DEVICEWidth - 60, 130);
        self.alpha = 1;
        
    }];
    
    
}
- (void)doneAction{
    
    if (self.txt.text.length == 0) {
        
        [SVProgressHUD showErrorWithStatus:@"请输入金额"];
        return;
    }
    [self dismissAction];
    
    if (_didDoneBlock) {
        _didDoneBlock(self.yingsunTag,self.txt.text);
        
    }
    
}
- (UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.2];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAction)];
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
}
- (void)dismissAction{
    
    [self.backView removeFromSuperview];
    [self removeFromSuperview];
    
    
    
}


@end
