//
//  PurseDetailTableHeaderView.m
//  Wallet
//
//  Created by Ying on 2018/10/30.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseDetailTableHeaderView.h"

@interface PurseDetailTableHeaderView ()



@end

@implementation PurseDetailTableHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, adaptHeight1334(124*2));
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(adaptHeight1334(25*2));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(adaptHeight1334(38*2));
        make.width.mas_equalTo(adaptWidth750(38*2));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).mas_offset(adaptHeight1334(12*2));
        make.centerX.equalTo(self);
    }];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.cornerRadius = adaptHeight1334(38);
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.textColor = GetColor(@"#474747");
        _titleLabel.text = @"--";
    }
    return _titleLabel;
}
@end
