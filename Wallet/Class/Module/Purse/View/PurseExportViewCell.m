//
//  PurseExportViewCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/6.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseExportViewCell.h"


@interface PurseExportViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;          ///标题
@property (strong, nonatomic) UIImageView *iconImageView;   ///用户头像


@end

@implementation PurseExportViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)cornerRadius:(type)type {
    if (type == top) {
        [self.iconImageView setImage:GetImage(@"btc")];
         [_titleLabel setText:@"BTC私钥"];

    } else if (type == bottom) {

        [self.iconImageView setImage:GetImage(@"eth")];
        [_titleLabel setText:@"ETH私钥"];
    } else {

    }
}

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    
   
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(13.5*2));
        make.left.mas_offset(adaptWidth750(18*2));
        make.height.mas_equalTo(adaptHeight1334(32*2));
        make.width.mas_equalTo(adaptWidth750(32*2));
    }];
    

    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).mas_offset(adaptWidth750(12*2));
        make.top.equalTo(self).mas_offset(adaptHeight1334(21*2));
    }];
    
 
}


- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = adaptHeight1334(38);
        _iconImageView.layer.masksToBounds = YES;
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
