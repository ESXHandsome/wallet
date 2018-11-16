//
//  SuccessWalletViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SuccessWalletViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"

@interface SuccessWalletViewController ()

@property (nonatomic,strong) UIImageView *image;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *button;

@end

@implementation SuccessWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    [self drawUI];
}

-(void)drawUI {
    [self.view addSubview:self.image];
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(0));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(adaptHeight1334(244*2));
        make.width.mas_equalTo(adaptWidth750(375*2));
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(260*2));
        make.left.mas_offset(adaptWidth750(142*2));
        make.height.mas_equalTo(adaptHeight1334(20*2));
        make.width.mas_equalTo(adaptWidth750(103*2));
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(583*2));
        make.left.mas_offset(adaptWidth750(27*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
    
}
-(UIImageView *)image {
    if (_image == nil) {
     
        _image = [[UIImageView alloc] initWithImage:GetImage(@"successwallet")];
        _image.frame = self.view.bounds;
    }
    
    return _image;
}

-(UILabel *)label {
    if (_label==nil) {
        _label = [[UILabel alloc] init];
        _label.text=ZBLocalized(@"SuccessWalletMessage.text");
        
        _label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(14*2)];
        _label.backgroundColor=[UIColor colorWithString:@"#FFFFFF"];
    }
    
    return _label;
}
-(UIButton *)button {
    if (_button==nil) {
        _button = [[UIButton alloc] init];
        _button.layer.borderColor=[[UIColor blackColor] CGColor];
        [_button setTitle:ZBLocalized(@"SuccessWalletButton.text") forState:normal];
        _button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        [_button setTitleColor:[UIColor colorWithString:@"#6072F5"] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void) addButtonAction {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = app.window.rootViewController;
    app.window.rootViewController = RootViewController.new;
    [vc removeFromParentViewController];
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
