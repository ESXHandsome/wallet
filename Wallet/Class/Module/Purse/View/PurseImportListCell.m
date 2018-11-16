//
//  PurseImportListCell.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/8.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseImportListCell.h"

@interface PurseImportListCell ()


@end

@implementation PurseImportListCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI {
    self.backgroundColor = UIColor.whiteColor;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self addSubview:self.titleImageView];
    [self addSubview:self.titleLabel];
    
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).mas_offset(adaptWidth750(18*2));
        make.height.mas_equalTo(adaptHeight1334(32*2));
        make.width.mas_equalTo(adaptWidth750(32*2));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.titleImageView.mas_right).mas_offset(adaptWidth750(7*2));
    }];
}

#pragma mark -
#pragma mark - 懒加载

- (UIImageView *)titleImageView {
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc] init];
        _titleImageView.layer.cornerRadius = adaptHeight1334(32);
        _titleImageView.layer.masksToBounds = YES;
    }
    return _titleImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _titleLabel.textColor = GetColor(@"#444444");
    }
    return _titleLabel;
}

@end
