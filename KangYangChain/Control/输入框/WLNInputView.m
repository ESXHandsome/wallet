//
//  WLNInputView.m
//  KangYangChain
//
//  Created by edz on 2018/11/8.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNInputView.h"

#define Screen_Width [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height

@implementation WLNInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.startRect = frame;
        [self addObserver];
        
    }
    return self;
}
- (void)addObserver{
    
    
    //监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
    
}

#pragma mark - 监听键盘事件
- (void)keyboardWillShow:(NSNotification *)notif {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.backView];
    
    CGRect rect = [[notif.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat y = rect.size.height;
    float animationTime = [[notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:animationTime animations:^{
        
        self.frame = CGRectMake(0, Screen_Height - y - 46 - 64, Screen_Width, 46);
        self.backView.frame = CGRectMake(0, 0, Screen_Width, self.frame.origin.y + 64);
        
    }];
    
}

- (void)keyboardWillHide:(NSNotification *)notif {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = self.startRect;
    }];
    [self.backView removeFromSuperview];

    
}
- (void)keyboardDidHide:(NSNotification *)notif {
    

    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]){

    
      
        return NO;
        //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}

- (UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAction)];
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
    
}
- (void)dismissAction{
    
    
    
    [self endEditing:YES];
 
    
}
- (void)sendAction{
    
   
    if (_didInputStr) {
        _didInputStr(self.inputTxt.text);
    }
    [self endEditing:YES];
    self.inputTxt.text = nil;

    
}
@end
