//
//  ConfirmPasswordViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "ConfirmPasswordViewController.h"
#import "SetPasswordViewController.h"
#import "CreatWalletViewController.h"
#import "VerificationCodeView.h"
#import "PassValueName.h"
#import "SuccessWalletViewController.h"
#import "CoinManager.h"
#import "SetPasswordViewController.h"
#import "UserConfigManager.h"
#import "ImportWalletManager.h"
#import "LLTouchID.h"
#import "isOpenTouchID.h"
@interface ConfirmPasswordViewController ()<passcodeDelegate>

@end

@implementation ConfirmPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawUI];

}




-(void) drawUI {

    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    NSString *title=ZBLocalized(@"ConfirmPasswordTitle.text");
    NSString * message=nil;
    VerificationCodeView * codeview= [[VerificationCodeView alloc] initWithCount:6 margin:adaptWidth750(5*2)  message:message title:title];
    [self.view addSubview:codeview];
    [codeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(44*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    codeview.delegate = self;
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:ZBLocalized(@"ConfirmPasswordButton.text") forState:normal];
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


/**
 代理传值，获取输入框的密码
 
 @param str VerificationCodeView 页面输入密码
 */
- (void)returnFieldText:(NSString *)str {
    self.password = str;
}
-(void)addButtonAction {
  
    NSString * oldpassword = [PassValueName shareInstanc].psw;
    if(oldpassword != self.password) {
        [self showAlertView:@"密码两次输入不一致"];
        return;
    }
    
    if ([ImportWalletManager sharedInstance].import) {
        /*导入钱包*/
        ImportWalletManager *manager = [ImportWalletManager sharedInstance];
        if ([manager.importType isEqualToString:@"key"]) {
            /*私钥*/
            [CoinManager importWalletWithKey:manager.privateKey pwd:self.password walletName:self.walletName complete:^(NSString *error){
                [CoinManager sharedInstance].currentWalletName = self.walletName;
                SuccessWalletViewController *nextVC=[[SuccessWalletViewController alloc] init];
                manager.import = NO;
                [self presentViewController:nextVC  animated:YES completion:nil];
            }];
        } else {
            /*助记词*/
            [CoinManager importWalletWithWord:manager.phrase pwd:self.password walletName:self.walletName complete:^(NSString *error) {
                [CoinManager sharedInstance].currentWalletName = self.walletName;
                SuccessWalletViewController *nextVC=[[SuccessWalletViewController alloc] init];
                manager.import = NO;
                [self presentViewController:nextVC  animated:YES completion:nil];
            }];
        }
        return;
    }
    
    [self addWallet];
    
}

- (void)addWallet {
    CoinManager *manager = [CoinManager sharedInstance];
    [CoinManager sharedInstance].currentWalletName = self.walletName;
    [manager addWallent:self.password name:self.walletName complete:^{
        SuccessWalletViewController *nextVC=[[SuccessWalletViewController alloc] init];
        [self presentViewController:nextVC  animated:YES completion:nil];
    }];
}

- (void)showAlertView:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"错误"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"好的"
                          otherButtonTitles:nil, nil];
    [alert show];
}

-(NSString *)encryptionname:(NSString *)string {
    
    
    NSData *encodeData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
    return base64String;
   
}
-(NSString *)decrypt:(NSString *)string {
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}



@end
