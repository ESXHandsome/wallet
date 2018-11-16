//
//  PurseChangeImformationTableViewCell.m
//  Wallet
//
//  Created by Ying on 2018/10/31.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseChangeImformationTableViewCell.h"

@interface PurseChangeImformationTableViewCell ()

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *tailLabel;

@end

@implementation PurseChangeImformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.textLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        self.textLabel.textColor = GetColor(@"#444444");
    }
    return self;
}

- (void)setTailLabelText:(NSString *)tailLabelText {
    [self addSubview:self.tailLabel];
    self.tailLabel.text = tailLabelText;
    [self.tailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(adaptHeight1334(14.5*2));
        make.right.equalTo(self).mas_offset(adaptWidth750(-39*2));
    }];
}

- (void)setIconImage:(UIImage *)image {
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(adaptWidth750(298*2));
        make.centerY.equalTo(self);
    }];
    if (image) {
        self.iconImageView.image = image;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = adaptHeight1334(38);
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.image = GetImage(@"wallet_cell_icon");
    }
    return _iconImageView;
}

- (UILabel *)tailLabel {
    if (!_tailLabel) {
        _tailLabel = [[UILabel alloc] init];
        _tailLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _tailLabel.textColor = GetColor(@"#474747");
    }
    return _tailLabel;

}

@end
