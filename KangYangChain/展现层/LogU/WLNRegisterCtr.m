//
//  WLNRegisterCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/9.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNRegisterCtr.h"

@interface WLNRegisterCtr ()
{
    int _count;
    UIView *_codeView;
    
}
@property (nonatomic, strong) UITextField *phoneT;
@property (nonatomic, strong) UITextField *pwdT;
@property (nonatomic, strong) UITextField *codeT;
@property (nonatomic, strong) UITextField *surePwdT;

@property (nonatomic, strong) UILabel *codeLab;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation WLNRegisterCtr
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
    
    return UIEdgeInsetsZero;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.phoneT changePlaceHolderDefaultColor];
    [self.pwdT changePlaceHolderDefaultColor];
    [self.codeT changePlaceHolderDefaultColor];
    [self.surePwdT changePlaceHolderDefaultColor];

}
#pragma mark - 数据回调

- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"getCode:"]) {
        
        [SVProgressHUD showSuccessWithStatus:@"获取验证码成功"];
        
    }else if ([sel isEqualToString:@"registers:"]){
        
        
        
        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        
        [self.navigationController popViewControllerAnimated:YES];

    }
    
}

#pragma mark - 自定义方法

- (void)logAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)registerAction{
    
    
    if (self.phoneT.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"手机格式不正确".Intl];
        return;
    
    }else if (self.codeT.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"验证码格式不正确".Intl];
        return;
    }else if (self.pwdT.text.length == 0){
        
        [SVProgressHUD showErrorWithStatus:@"密码格式不正确".Intl];
        return;
        
    }else if (![self.pwdT.text isEqualToString:self.surePwdT.text]){
        
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
        
    }
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"account"] = self.phoneT.text;
    dic[@"pass"] = self.pwdT.text;
    dic[@"verification_code"] = self.codeT.text;
    
    
    [self routeTargetName:Handle actionName:@"registers:" param:dic];
    

    
}
- (void)getCodeAction:(UITapGestureRecognizer *)tap{
    
    if (self.phoneT.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"手机格式不正确"];
        return;
    }
    _codeView = tap.view;
    
    NSMutableDictionary *dic = @{}.mutableCopy;
       
    dic[@"phone"] = self.phoneT.text;
    
    [self routeTargetName:Handle actionName:@"getCode:" param:dic];

    [self timeCut];

    
}
- (void)timeCut{
    
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];

    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];

    _count = 60;
    
    _codeView.userInteractionEnabled = NO;

}
- (void)timerAction{
    
    
    _count -- ;
    
    NSLog(@"%d",_count);

    self.codeLab.text = [NSString stringWithFormat:@"%ds",_count];

    if (_count == 0) {
        
        self.codeLab.text = @"获取验证码".Intl;
        _codeView.userInteractionEnabled = YES;

        [self.timer invalidate];
        self.timer = nil;

    }

}
- (void)sureHideAction:(UITapGestureRecognizer *)tap{
    
    self.surePwdT.secureTextEntry = !self.surePwdT.secureTextEntry;
    UIImageView *img = tap.view.subviews.firstObject;
    img.image = self.surePwdT.secureTextEntry ? [UIImage imageNamed:@"display"] : [UIImage imageNamed:@"hide"];
    
}
- (void)hideAction:(UITapGestureRecognizer *)tap{
    
    self.pwdT.secureTextEntry = !self.pwdT.secureTextEntry;
    
    UIImageView *img = tap.view.subviews.firstObject;
    img.image = self.pwdT.secureTextEntry ? [UIImage imageNamed:@"display"] : [UIImage imageNamed:@"hide"];
    
}


@end
