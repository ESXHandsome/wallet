//
//  LoginTableViewCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "LoginTableViewCell.h"
@interface LoginTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *rightLabel;
@property (strong, nonatomic) UITextField *textPhoneNum;
@property (strong, nonatomic) UITextField *textCodeNum;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIView *tfBackView;

@end
@implementation LoginTableViewCell
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self drawUIOne];
    }
    return self;
}

-(void)drawUIOne{
    
 self.backgroundColor = [UIColor colorWithString:@"FFFFFF"];
    
    [self addSubview:self.rightLabel];
    [self addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.left.mas_offset(adaptWidth750(5*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.right.mas_offset(adaptWidth750(-36*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
    
  
}

- (void)drawUITwo {
    
  self.backgroundColor = [UIColor colorWithString:@"FFFFFF"];

    [self addSubview:self.titleLabel];
    [self addSubview:self.textPhoneNum];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.left.mas_offset(adaptWidth750(5*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];

    [self.textPhoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
         make.width.mas_equalTo(adaptHeight1334(200*2));
        make.left.equalTo(self.titleLabel.mas_right).mas_offset(adaptWidth750(9.1*2));
    }];
    
}


-(void)drawUIThree{
    
    self.backgroundColor = [UIColor colorWithString:@"FFFFFF"];
    
    [self addSubview:self.textCodeNum];
    [self addSubview:self.button];
    [self addSubview:self.tfBackView];
    
    [self.textCodeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.left.mas_offset(adaptWidth750(5*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
         make.width.mas_equalTo(adaptHeight1334(200*2));
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_offset(adaptHeight1334(14*2));
        make.right.mas_offset(adaptWidth750(-17*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(8.5*2));
        make.left.mas_offset(adaptWidth750(259*2));
        make.height.mas_equalTo(adaptHeight1334(29*2));
        make.width.mas_equalTo(adaptWidth750(1*2));
    }];
    
}

- (void)cornerRadius:(type)type {
    if (type == top) {
        [self drawUIOne];
        [self.titleLabel setText:@"国家/地区"];
        [self.rightLabel setText:@"中国"];
    } else if (type == medium){
         [self.titleLabel setText:@"+86"];
        [self drawUITwo];
        
    } else if (type == bottom) {
        [self drawUIThree];
        
    } else  {
        
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.textColor = GetColor(@"#444444");
    }
    return _titleLabel;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitleColor:[UIColor colorWithString:@"#6072F5"] forState:UIControlStateNormal];
        [_button setTitle:@"获取验证码" forState:UIControlStateNormal];
         _button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        [_button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor colorWithString:@"E9E9E9"];
//        _tfBackView.backgroundColor = [UIColor redColor];
    }
    return _tfBackView;
}
- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _rightLabel.textColor = GetColor(@"#444444");
    }
    return _rightLabel;
}
-(UITextField *)textPhoneNum {
    if (_textPhoneNum == nil) {
        _textPhoneNum = [[UITextField alloc] init];
        _textPhoneNum.placeholder = @"请输入手机号码";
        _textPhoneNum.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        _textPhoneNum.backgroundColor =[ UIColor colorWithString:@"#FFFFFF"];
//        _textPhoneNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textPhoneNum;
}
-(UITextField *)textCodeNum {
    if (_textCodeNum == nil) {
        _textCodeNum = [[UITextField alloc] init];
        _textCodeNum.placeholder = @"请输入手机验证码";
        _textCodeNum.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        _textCodeNum.backgroundColor =[ UIColor colorWithString:@"#FFFFFF"];
//        _textCodeNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textCodeNum;
}

-(void) btnClick {
    
    NSLog(@"获取验证码");
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
