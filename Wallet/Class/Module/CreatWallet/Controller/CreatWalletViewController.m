//
//  CreatWalletViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/26.
//  Copyright © 2018 Ying. All rights reserved.
//
#import "CreatWalletViewController.h"
#import "SetPasswordViewController.h"
#import "PassValueName.h"
#import "CoinManager.h"
#import "PurseImportWordViewController.h"
#import "ImportWalletManager.h"
@interface CreatWalletViewController ()
@property (nonatomic ,strong) UILabel *label;
@property (nonatomic,strong) UITextField *textfiled;

@property (nonatomic, strong) UIView *tfBackView;
@property (nonatomic,strong) UIButton *button;
@end

@implementation CreatWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithString:@"#FBFBFB"];
    self.title = ZBLocalized(@"CreateWallet.text");
    [self drawUI];
    
}

- (UILabel *)label {
    if (_label==nil) {
        _label = [[UILabel alloc] init];
       _label.text =  ZBLocalized(@"SetWalletName.text");
        _label.textColor = [UIColor colorWithString:@"#999999"];
        _label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
    }
    return _label;
}
-(UITextField *)textfiled {
    if (_textfiled == nil) {
        _textfiled = [[UITextField alloc] init];
        _textfiled.text =ZBLocalized(@"WallettName.text");
        _textfiled.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(14*2)];
        //设置左边视图的宽度(占位)
        _textfiled.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, adaptWidth750(20*2), 0)];
        //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
        _textfiled.leftViewMode = UITextFieldViewModeAlways;
        _textfiled.backgroundColor =[ UIColor colorWithString:@"#FFFFFF"];
        _textfiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textfiled;
}

-(UIButton *)button {
    if (_button == nil) {
        _button = [[UIButton alloc] init];
        _button.layer.borderColor = [[UIColor blackColor] CGColor];
        [_button setTitle:ZBLocalized(@"ButtonNextStep.text") forState:normal];
        _button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
       
    }
    return _button;
}


-(void)drawUI {
    
    [self.view addSubview:self.button];
    [self.view addSubview:self.tfBackView];
    [self.tfBackView addSubview:self.textfiled];
    [self.view addSubview:self.label];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(adaptHeight1334(17*2));
        make.left.mas_equalTo(adaptWidth750(20*2));
        make.top.mas_equalTo(adaptHeight1334(59.5*2+NAVIGATION_BAR_HEIGHT));
    }];
    
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(adaptWidth750(0));
        make.top.mas_equalTo(adaptHeight1334(86*2+NAVIGATION_BAR_HEIGHT));
    }];
   
    [self.textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.with.height.equalTo(self.tfBackView);
        make.right.equalTo(self.tfBackView.mas_right).offset(-20);
    }];

    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
        make.left.mas_equalTo(adaptWidth750(27*2));
        make.top.mas_equalTo(adaptHeight1334(184*2+NAVIGATION_BAR_HEIGHT));
    }];
  
}

/**
按钮点击 跳转页面 单例传值
[PassValueName shareInstanc].str 钱包名称
 */
- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor whiteColor];
    }
    return _tfBackView;
}

-(void)addButtonAction {
    if (_textfiled.text.length != 0) {
        CoinManager *manager = [CoinManager sharedInstance];
        if ([manager.allWalletDic.allKeys containsObject:self.textfiled.text]) {
            [self showAletView:ZBLocalized(@"钱包名称重复")];
        } else {
            if (self.isImportWord) {
                /*助词导入*/
                [ImportWalletManager sharedInstance].importType = @"word";
                [ImportWalletManager sharedInstance].import = YES;
            }
            
            if (self.isImportKey) {
                /*私钥导入*/
                [ImportWalletManager sharedInstance].importType = @"key";
                [ImportWalletManager sharedInstance].import = YES;
            }
            
            SetPasswordViewController *controller = SetPasswordViewController.new;
            controller.walletName = self.textfiled.text;
            [self.navigationController pushViewController:controller animated:YES];
            
        }
    } else {
        [self showAletView:ZBLocalized(@"钱包名称不能为空")];
    }
}

- (void)showAletView:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"错误"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"好的"
                          otherButtonTitles:nil, nil];
    [alert show];

}

@end
