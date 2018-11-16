//
//  SetPasswordViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SetPasswordViewController.h"

#import "VerificationCodeView.h"
#import "ConfirmPasswordViewController.h"
#import "PassValueName.h"
#import "LLTouchID.h"
#import "isOpenTouchID.h"
@interface SetPasswordViewController ()<passcodeDelegate>


@end

@implementation SetPasswordViewController

- (void)drawUI {
    
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    
    NSString *  title=ZBLocalized(@"SetPasswordTitle.text");
    NSString * message=ZBLocalized(@"SetPasswordMessage.text");
    VerificationCodeView * codeview= [[VerificationCodeView alloc] initWithCount:6 margin:adaptWidth750(8*2)  message:message title:title];
    [self.view addSubview:codeview];
    [codeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(44*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    codeview.delegate = self;
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:ZBLocalized(@"ButtonNextStep.text") forState:normal];
    [button setTitleColor:[UIColor colorWithString:@"#6072F5"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(adaptWidth750(309*2));
        make.left.mas_offset(adaptWidth750(27*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawUI];

}


/**
 代理传值，获取输入框的密码

 @param str VerificationCodeView 页面输入密码
 */
- (void)returnFieldText:(NSString *)str {
    
    self.password = str;
 
}


/**
 单例传值，传本页面的password
 */
-(void)addButtonAction {
    
    if (_password.length != 0) {
        
        [PassValueName shareInstanc].psw = self.password;
        self.title = ZBLocalized(@"CreateWallet.text");
        ConfirmPasswordViewController *controller = ConfirmPasswordViewController.new;
        controller.walletName = self.walletName;
        [self.navigationController pushViewController:controller animated:YES];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"错误"
                              message:@"密码不能为空"
                              delegate:nil
                              cancelButtonTitle:@"好的"
                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
