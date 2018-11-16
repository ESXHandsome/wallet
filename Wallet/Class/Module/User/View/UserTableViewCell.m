//
//  UserTableViewCell.m
//  Wallet
//
//  Created by Ying on 2018/10/19.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "UserTableViewCell.h"

@interface UserTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;          ///标题
@property (strong, nonatomic) UIImageView *iconImageView;   ///用户头像

@end

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(17.6*2));
        make.left.mas_offset(adaptWidth750(17.2*2));
        make.height.mas_equalTo(adaptHeight1334(21.6*2));
        make.width.mas_equalTo(adaptWidth750(21.6*2));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).mas_offset(adaptWidth750(9.1*2));
        make.top.equalTo(self).mas_offset(adaptHeight1334(21*2));
    }];
    
}

- (void)cornerRadius:(type)type {
    if (type == top) {
        [self.iconImageView setImage:GetImage(@"seticon")];
        [_titleLabel setText:@"系统设置"];
        
    } else if (type == bottom) {
        
        [self.iconImageView setImage:GetImage(@"aboutus")];
        [_titleLabel setText:@"关于我们"];
    } else {
        
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
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _titleLabel.textColor = GetColor(@"#444444");
    }
    return _titleLabel;
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

@end
