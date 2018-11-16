//
//  PurseChangePasswViewController.m
//  Wallet
//  修改密码
//  Created by Ying on 2018/10/31.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseChangePasswViewController.h"
#import "VerificationCodeView.h"
#import "PurseNewPwdViewController.h"
#import "PurseForgotPwdViewController.h"
#import "isOpenTouchID.h"
#import "LLTouchID.h"
@interface PurseChangePasswViewController () <passcodeDelegate>

@property (strong, nonatomic) VerificationCodeView *codeView; ///密码输入框
@property (strong, nonatomic) UIButton *forgetPwdButton; ///忘记密码
@property (assign, nonatomic) BOOL isAppear;

@end

@implementation PurseChangePasswViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    [self TouchIDLogin];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDSuccess object:nil];
}

-(void)TouchIDLogin{
    
    isOpenTouchID *isOpen=  [isOpenTouchID sharedInstance];
    [isOpen OpenTouchID];
    
}

-(void) isOpen {
    
    PurseNewPwdViewController *controller = [[PurseNewPwdViewController alloc] init];
//    controller.pwdString = str;
    controller.model = self.model;
    [self.navigationController pushViewController:controller animated:YES];
    
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
    [self.view addSubview:self.forgetPwdButton];
    
    [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(44*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    [self.forgetPwdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(241*2));
        make.centerX.equalTo(self.view);
    }];
    
}

#pragma mark -
#pragma mark - CodeView delegate

- (void)returnFieldText:(NSString *)str {
    
    if (!self.isAppear) return;
    
    if ([str isEqualToString:self.model.password]) {
        PurseNewPwdViewController *controller = [[PurseNewPwdViewController alloc] init];
        controller.pwdString = str;
        controller.model = self.model;
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"密码输入有误" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [controller addAction:action];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

#pragma mark -
#pragma mark -  Aciton

- (void)forgetPwdButtonAction {
    [self.navigationController pushViewController:PurseForgotPwdViewController.new animated:YES];
}

#pragma mark -
#pragma mark - Lazy load

- (VerificationCodeView *)codeView {
    if (!_codeView) {
        _codeView = [[VerificationCodeView alloc] initWithCount:6 margin:adaptWidth750(8*2)  message:@"" title:@"请输入原密码"];
        _codeView.delegate = self;
        _codeView.titlelabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
    }
    return _codeView;
}

- (UIButton *)forgetPwdButton {
    if (!_forgetPwdButton) {
        _forgetPwdButton = [[UIButton alloc] init];
        [_forgetPwdButton setTitle:@"忘记密码" forState:normal];
        [_forgetPwdButton setTitleColor:GetColor(@"#6072F5") forState:normal];
        _forgetPwdButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        [_forgetPwdButton addTarget:self action:@selector(forgetPwdButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPwdButton;
}
@end
