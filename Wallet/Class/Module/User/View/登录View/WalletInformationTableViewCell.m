//
//  WalletInformationTableViewCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "WalletInformationTableViewCell.h"

@interface WalletInformationTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;          ///标题
@property (strong, nonatomic) UIImageView *iconImageView;   ///用户头像
@property (strong, nonatomic) UILabel *rightLabel;

@end


@implementation WalletInformationTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self drawUIOne];
    }
    return self;
}

-(void)drawUIOne{
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(26*2));
        make.left.mas_offset(adaptWidth750(5*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.right.mas_offset(adaptWidth750(-39*2));
        make.height.mas_equalTo(adaptHeight1334(38*2));
         make.width.mas_equalTo(adaptHeight1334(38*2));
    }];
    
    
}

- (void)drawUITwo {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.rightLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.left.mas_offset(adaptWidth750(5*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
//        make.left.equalTo(self.titleLabel.mas_right).mas_offset(adaptWidth750(9.1*2));
        make.right.mas_equalTo(adaptHeight1334(-23*2));
    }];
    
}


-(void)drawUIThree{
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14*2));
        make.left.mas_offset(adaptWidth750(5*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
        make.width.mas_equalTo(adaptHeight1334(259*2));
    }];
    
 
    
}

- (void)cornerRadius:(type)type {
    if (type == top) {
        [self drawUIOne];
        [self.titleLabel setText:@"头像"];
         [self.iconImageView setImage:GetImage(@"seticon")];
//        [self.iconImageView setImage:@"unloginicon"];
    } else if (type == medium){
        [self.titleLabel setText:@"账号"];
        [self.rightLabel setText:@"+86  183xxxx6502"];
        [self drawUITwo];
    } else if (type == next){
        [self.titleLabel setText:@"昵称"];
        [self.rightLabel setText:@"啦啦啦我是赚钱小能手"];
        [self drawUITwo];
    } else if (type == bottom) {
        [self drawUIThree];
        [self.titleLabel setText:@"退出账号 "];
    } else  {
        
    }
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = adaptHeight1334(38);
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.textColor = GetColor(@"#444444");
    }
    return _titleLabel;
}
- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _rightLabel.textColor = GetColor(@"#444444");
    }
    return _rightLabel;
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



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
