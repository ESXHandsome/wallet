//
//  TransactionPasswordView.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "TransactionPasswordView.h"
#import "VerificationCodeView.h"
#import "PassValueName.h"
@interface TransactionPasswordView ()<passcodeDelegate>

/** 弹窗主内容view */
@property (nonatomic,strong) UIView   *contentView;
/** 弹窗标题 */
@property (nonatomic,copy)   NSString *title;
/** message label */
@property (nonatomic,strong) UILabel  *messageLabel;
/** 左边按钮title */
@property (nonatomic,copy)   NSString *leftButtonTitle;

@property (strong,nonatomic) VerificationCodeView *code;

@property (strong,nonatomic) UIButton *button;

@end

@implementation TransactionPasswordView


- (instancetype)initWithTitle:(NSString *)title delegate:(id)delegate {
    if (self = [super init]) {
        self.title = title;
     
        [self setUpUI];
    }
    return self;
}
- (void)returnFieldText:(NSString *)str {
    
    [PassValueName shareInstanc].TransactionpPassword=str;
}

-(void) setUpUI {
    
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 1;
    }];
    self.contentView = [[UIView alloc]init];
    self.contentView.center = self.center;
    [self addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 6;
    
    UIButton *button=[[UIButton alloc] init];
    [self.contentView addSubview:button];
    [button setBackgroundImage:[UIImage imageNamed:@"CombinedShape2"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = self.title;
    
    NSString *title=@"请输入交易密码";
    NSString * message=nil;
    NSString *types=@"A";
    VerificationCodeView *codeview = [[VerificationCodeView alloc] initWithCountforCode:6 margin:adaptWidth750(16) message:message title:title type:types];
    [self.contentView addSubview:codeview];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.mas_offset(adaptHeight1334(150*2));
            make.height.mas_equalTo(adaptHeight1334(165*2));
            make.width.mas_equalTo(adaptWidth750(310*2));
        }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(adaptHeight1334(14*2));
    }];
    [codeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(44*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(adaptHeight1334(115*2));
        make.width.mas_equalTo(adaptWidth750(310*2));
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(15*2));
        make.left.mas_offset(adaptWidth750(12*2));
        make.height.mas_equalTo(adaptHeight1334(25*2));
        make.width.mas_equalTo(adaptWidth750(25*2));
    }];
    codeview.delegate = self;
}

- (void)show{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

- (void)cancelButtonClicked{
    if ([self.delegate respondsToSelector:@selector(TransactionPasswordView:clickedButtonAtIndex:)]) {
        [self.delegate declareAbnormalAlertView:self clickedButtonAtIndex:AlertButtonRight];
    }
    [self dismiss];
}

- (void)dismiss{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
