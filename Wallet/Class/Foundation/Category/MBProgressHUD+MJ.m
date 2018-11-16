//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#define COLORffffff @"#ffffff"

#import "MBProgressHUD+MJ.h"
#import <objc/runtime.h>

@implementation MBProgressHUD (MJ)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view time:(NSTimeInterval)time
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;

    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud11 = [self HUDForView:view];
        if (!hud11.isUsed) [hud11 removeFromSuperview];
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.detailsLabel.text = text;
        // 设置图片
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: icon]];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
        
        hud.userInteractionEnabled = NO;
        
        hud.detailsLabel.font = [UIFont systemFontOfSize:adaptFontSize(30)];
        
        hud.detailsLabel.textColor = [UIColor colorWithString:COLORffffff];
        
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        
        hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.6];
        
        hud.bezelView.layer.cornerRadius = adaptFontSize(8);
        
        hud.margin = adaptWidth750(25);
        
        hud.minShowTime = 1.0;
        
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // 1秒之后再消失
        [hud hideAnimated:YES afterDelay:time];
    });
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view time:2.5];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view time:2.5];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (void)showError:(NSString *)error time:(NSTimeInterval)time {
    [self show:error icon:@"error.png" view:nil time:time];
}

+ (void)showSuccess:(NSString *)success icon:(NSString *)icon time:(NSTimeInterval)time {
    [self show:success icon:icon view:nil time:time];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

#pragma mark 显示系统默认自带指示器
+ (MBProgressHUD *)showChrysanthemum:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.userInteractionEnabled = NO;
    
    hud.mode = MBProgressHUDModeIndeterminate;
    
    hud.label.text = @"a";
    
    hud.label.font = [UIFont systemFontOfSize:adaptFontSize(10)];
    
    hud.label.textColor = [UIColor colorWithWhite:1 alpha:0.01];
    
    hud.detailsLabel.text = message;
    
    hud.detailsLabel.font = [UIFont systemFontOfSize:adaptFontSize(30)];
    
    hud.detailsLabel.textColor = [UIColor colorWithString:COLORffffff];
    
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.6];;
    
    hud.bezelView.layer.cornerRadius = adaptFontSize(8);
    
    hud.minSize = CGSizeMake(adaptWidth750(242), adaptWidth750(242));

    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}

+ (MBProgressHUD *)showChrysanthemum:(NSString *)message {
    return [self showChrysanthemum:message toView:nil];
}

- (BOOL)isUsed {
     return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsUsed:(BOOL)isUsed {
    objc_setAssociatedObject(self, @selector(isUsed), @(isUsed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
