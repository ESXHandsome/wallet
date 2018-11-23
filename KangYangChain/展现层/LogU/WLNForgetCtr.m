//
//  WLNForgetCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/9.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNForgetCtr.h"

@interface WLNForgetCtr ()
{
    int _count;
    UIView *_codeView;
    
}
@property (nonatomic, strong) UITextField *phoneTxt;
@property (nonatomic, strong) UITextField *pwdTxt;
@property (nonatomic, strong) UITextField *codeTxt;
@property (nonatomic, strong) UITextField *surePwdTxt;

@property (nonatomic, strong) UILabel *codeLab;
@property (nonatomic, strong) NSTimer *timer;



@end

@implementation WLNForgetCtr
- (UIEdgeInsets)getSafeArea:(BOOL)portrait{

    return UIEdgeInsetsZero;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"忘记密码".Intl;
        
    [self.phoneTxt changePlaceHolderDefaultColor];
    [self.codeTxt changePlaceHolderDefaultColor];
    [self.pwdTxt changePlaceHolderDefaultColor];
    [self.surePwdTxt changePlaceHolderDefaultColor];



}
- (void)sureHideAction:(UITapGestureRecognizer *)tap{
    
    self.surePwdTxt.secureTextEntry = !self.surePwdTxt.secureTextEntry;
    UIImageView *img = tap.view.subviews.firstObject;
    img.image = self.surePwdTxt.secureTextEntry ? [UIImage imageNamed:@"display"] : [UIImage imageNamed:@"hide"];
    
}
- (void)hideAction:(UITapGestureRecognizer *)tap{
    
    self.pwdTxt.secureTextEntry = !self.pwdTxt.secureTextEntry;
    
    UIImageView *img = tap.view.subviews.firstObject;
    img.image = self.pwdTxt.secureTextEntry ? [UIImage imageNamed:@"display"] : [UIImage imageNamed:@"hide"];
    
}
- (void)registerAction{
    
    [self push:@"WLNRegisterCtr".instance];
    
    
}
- (void)logAction{
    
    [self push:@"WLNLogCtr".instance];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"getCode:"]) {
        
        [SVProgressHUD showSuccessWithStatus:@"获取验证码成功"];

        
    }else if ([sel isEqualToString:@"forGet:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"操作成功"];
        
        [self.navigationController popViewControllerAnimated:YES];

    }
    
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
        
        self.codeLab.text = @"获取";
        _codeView.userInteractionEnabled = YES;
        
        [self.timer invalidate];
        self.timer = nil;
        
    }
    
}

- (void)doneAction{
    
    if (self.phoneTxt.text.length != 11) {
        
        [SVProgressHUD showErrorWithStatus:@"手机号格式不正确"];
        return;
        
    }else if (self.pwdTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
        
    }else if (![self.pwdTxt.text isEqualToString:self.surePwdTxt.text]){
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
        
        
    }else if (self.codeTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        return;
    }
    
    NSMutableDictionary *dic= @{}.mutableCopy;
    dic[@"account"] = self.phoneTxt.text;
    dic[@"pass"] = self.pwdTxt.text;
    dic[@"verification_code"] = self.codeTxt.text;
    
    [self routeTargetName:Handle actionName:@"forGet:" param:dic];
    
    
}
- (void)codeAction:(UITapGestureRecognizer *)tap{
    
    if (self.phoneTxt.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"手机号格式不正确"];
        return;
        
    }
    
    _codeView = tap.view;
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"phone"] = self.phoneTxt.text;
    
    [self routeTargetName:Handle actionName:@"getCode:" param:dic];
 
    [self timeCut];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
@end
