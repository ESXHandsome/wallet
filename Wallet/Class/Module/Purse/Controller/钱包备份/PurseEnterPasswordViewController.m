//
//  PurseEnterPasswordViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/9.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseEnterPasswordViewController.h"
#import "VerificationCodeView.h"
#import "PassValueName.h"
#import "UserConfigManager.h"
#import "PurseBackupsViewController.h"
#import "LLTouchID.h"
#import "isOpenTouchID.h"
@interface PurseEnterPasswordViewController ()<passcodeDelegate>
@property (nonatomic,strong) NSString *password;


@end

@implementation PurseEnterPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawUI];
    
    [self TouchIDLogin];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDSuccess object:nil];
}

-(void)TouchIDLogin{
    
    isOpenTouchID *isOpen=  [isOpenTouchID sharedInstance];
    [isOpen OpenTouchID];
    
}

-(void) isOpen {
            PurseBackupsViewController *controller = [[PurseBackupsViewController alloc] init];
            controller.model = self.model;
            [self.navigationController pushViewController:controller animated:YES];
    
}


- (void)drawUI {
    
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    
    NSString *  title=@"请输入交易密码";
    VerificationCodeView * codeview= [[VerificationCodeView alloc] initWithCount:6 margin:adaptWidth750(8*2)  message:nil title:title];
    [self.view addSubview:codeview];
    codeview.delegate = self;
    [codeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(44*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
}
- (void)returnFieldText:(NSString *)str {
    self.password = str;
    [self isNextView];
}

-(void)isNextView {
    NSString *walletName = [PassValueName shareInstanc].walletName;
    NSDictionary *userdic = [UserConfigManager getUserConfigDic];
    
    NSDictionary *newdic = [userdic valueForKey:walletName];
    NSString * psw=[newdic valueForKey:@"password"];
    NSLog(@"%@",newdic);
    NSLog(@"psw is %@",self.password);
    if([psw isEqualToString:self.password]){
        PurseBackupsViewController *controller = [[PurseBackupsViewController alloc] init];
        controller.model = self.model;
        [self.navigationController pushViewController:controller animated:YES];
        
    } else {
        [MBProgressHUD showError:@"密码错误"];
        
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
