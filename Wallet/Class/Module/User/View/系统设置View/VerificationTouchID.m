//
//  VerificationTouchID.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "VerificationTouchID.h"
@interface VerificationTouchID ()

/** 弹窗主内容view */
@property (nonatomic,strong) UIView   *contentView;

@property (nonatomic,strong) UIView   *tfBackView;
/** 弹窗标题 */
@property (nonatomic,copy)   NSString *title;
/** message label */
@property (nonatomic,strong) UILabel  *messageLabel;

@property (nonatomic,copy)   NSString *leftButtonTitle;

@property (strong, nonatomic) UIImageView *iconImageView;   ///用户头像

@property (strong,nonatomic) UIButton *button;

@end

@implementation VerificationTouchID

- (instancetype)initWithTitle:(NSString *)title delegate:(id)delegate {
    if (self = [super init]) {
        self.title = title;
       
        
        [self setUpUI];
    }
    return self;
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
    [button setTitle:@"取消" forState:normal];
    [button setTitleColor:[UIColor colorWithString:@"#999999"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = self.title;
    
    [self.contentView addSubview:self.tfBackView];
    [self.contentView addSubview:self.iconImageView];
     [self.iconImageView setImage:GetImage(@"TouchID")];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(adaptHeight1334(150*2));
        make.height.mas_equalTo(adaptHeight1334(165*2));
        make.width.mas_equalTo(adaptWidth750(310*2));
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(adaptHeight1334(84*2));
    }];
  
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(26*2));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(44*2));
    }];
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(119*2));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(adaptHeight1334(2*2));
        make.width.mas_equalTo(adaptWidth750(310*2));
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(121*2));
        make.left.mas_offset(adaptWidth750(0));
        make.height.mas_equalTo(adaptHeight1334(44*2));
        make.width.mas_equalTo(adaptWidth750(310*2));
    }];
  
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = adaptHeight1334(38);
    }
    return _iconImageView;
}

- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor colorWithString:@"E9E9E9"];
    }
    return _tfBackView;
}

- (void)setIconImage:(nonnull UIImage *)image {
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(adaptWidth750(298*2));
        make.centerY.equalTo(self);
    }];
    if (image) {
        self.iconImageView.image = image;
    }
}

- (void)show{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}
- (void)cancelButtonClicked{
    if ([self.delegate respondsToSelector:@selector(VerificationTouchID:clickedButtonAtIndex:)]) {
        [self.delegate declareAbnormalAlertView:self clickedButtonAtIndex:AlertRightButton];
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
