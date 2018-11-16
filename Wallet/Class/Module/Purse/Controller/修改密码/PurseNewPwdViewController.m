//
//  PurseNewPwdViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseNewPwdViewController.h"
#import "VerificationCodeView.h"
#import "PurseNewPwdAgainViewController.h"

@interface PurseNewPwdViewController () <passcodeDelegate>

@property (strong, nonatomic) VerificationCodeView *codeView; ///密码输入框
@property (assign, nonatomic) BOOL isAppear;

@end

@implementation PurseNewPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.isAppear = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    self.isAppear = NO;
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
    if (!self.isAppear) return;
    
    if ([str isEqualToString:self.pwdString]) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"不能与原密码相同" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [controller addAction:action];
        [self presentViewController:controller animated:YES completion:nil];
    } else {
        PurseNewPwdAgainViewController *controller = [[PurseNewPwdAgainViewController alloc] init];
        controller.pwdString = str;
        controller.model = self.model;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark -
#pragma mark - Lazy load

- (VerificationCodeView *)codeView {
    if (!_codeView) {
        _codeView = [[VerificationCodeView alloc] initWithCount:6 margin:adaptWidth750(8*2)  message:@"" title:@"请设置新密码"];
        _codeView.delegate = self;
        _codeView.titlelabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
    }
    return _codeView;
}

@end
