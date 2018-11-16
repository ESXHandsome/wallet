//
//  PurseNewPwdAgadinViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseNewPwdAgainViewController.h"
#import "VerificationCodeView.h"
#import "PurseDetailViewController.h"

@interface PurseNewPwdAgainViewController () <passcodeDelegate>

@property (strong, nonatomic) VerificationCodeView *codeView; ///密码输入框

@end

@implementation PurseNewPwdAgainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self creatUI];
}

- (void)creatUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
   
    [self.view addSubview:self.codeView];

    [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(44*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
}

- (void)returnFieldText:(NSString *)str {
    if ([str isEqualToString:self.pwdString]) {
        NSArray *array = self.navigationController.viewControllers;
        for (UIViewController* controller in array) {
            if ([controller isKindOfClass:PurseDetailViewController.class]) {
                self.model.password = str;
                [[CoinManager sharedInstance] upDateWallet:self.model.walletName model:self.model];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationPasswordResetSuccess" object:nil];
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
    } else {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"两次输入不一致" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [controller addAction:action];
        [self presentViewController:controller animated:YES completion:nil];
    }
}


#pragma mark -
#pragma mark - Lazy load

- (VerificationCodeView *)codeView {
    if (!_codeView) {
        _codeView = [[VerificationCodeView alloc] initWithCount:6 margin:adaptWidth750(8*2)  message:@"" title:@"确认新密码"];
        _codeView.delegate = self;
        _codeView.titlelabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
    }
    return _codeView;
}

@end
