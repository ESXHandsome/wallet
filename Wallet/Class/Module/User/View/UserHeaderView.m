//
//  UserHeaderView.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "UserHeaderView.h"
#import "LoginViewController.h"
@interface UserHeaderView ()

@property (strong, nonatomic) UIImageView *userImage; 

@property (strong, nonatomic) UIButton *loginButton;

@property (strong, nonatomic) UIImageView *tfbackImage;

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) UILabel *phoneLabel;

@end

@implementation UserHeaderView
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = GetImage(@"userbackimage");
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, adaptHeight1334(160*2)+STATUS_BAR_HEIGHT);
     
        [self drawUI];
//        [self drawLoginUI];
    }
    return self;
}
-(void)drawUI {
    
    [self addSubview:self.loginButton];
    
    [self addSubview:self.userImage];
    [self.userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(adaptHeight1334(14*2)+STATUS_BAR_HEIGHT);
        make.height.mas_offset(adaptHeight1334(40*2));
        make.width.mas_offset(adaptWidth750(40*2));
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImage.mas_bottom).offset(adaptHeight1334(13*2));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(adaptWidth750(28*2));
        make.width.mas_offset(adaptWidth750(90*2));
    }];
}
-(void)drawLoginUI {
    
    [self addSubview:self.phoneLabel];
    [self addSubview:self.userImage];
    [self addSubview:self.nameLabel];
    
    [self.userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(adaptHeight1334(14*2)+STATUS_BAR_HEIGHT);
        make.height.mas_offset(adaptHeight1334(40*2));
        make.width.mas_offset(adaptWidth750(40*2));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImage.mas_bottom).offset(adaptHeight1334(13*2));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(adaptWidth750(20*2));
    }];
    
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(adaptHeight1334(2*2));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(adaptWidth750(17*2));
    }];
}


-(UIButton *) loginButton {
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        [_loginButton setTitle:Text(@"登录") forState:normal];
        [_loginButton setTitleColor:[UIColor colorWithString:@"#ffffff"] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        [_loginButton addTarget:self action:@selector(loginbutton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}
- (UIImageView *)userImage {
    if (!_userImage) {
        _userImage = [[UIImageView alloc] init];
        _userImage.layer.cornerRadius = adaptHeight1334(40);
        _userImage.layer.masksToBounds = YES;
        [_userImage setImage:[UIImage imageNamed:@"unloginicon"]];
    }
    return _userImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _nameLabel.textColor = GetColor(@"#444444");
        _nameLabel.text=@"啦啦啦我是赚钱小能手";
    }
    return _nameLabel;
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _phoneLabel.textColor = GetColor(@"#444444");
        _phoneLabel.text=@"+86  18860981018";
    }
    return _phoneLabel;
}
//- (void)click:(UITapGestureRecognizer *)gesture {
//    [self purseButtonAction];
//
//}

- (void)loginbutton {
    [self.delegate purseButtonClicked];
}

@end
