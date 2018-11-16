
//
//  PurseTableViewCell.m
//  Wallet
//
//  Created by Ying on 2018/10/19.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseTableViewCell.h"
#import "CoinManager.h"

@interface PurseTableViewCell()

@property (strong, nonatomic) UIImageView *walletImageView; ///背景
@property (strong, nonatomic) UIImageView *iconImageView;   ///用户头像
@property (strong, nonatomic) UIButton *detailButton;       ///详情按钮
@property (strong, nonatomic) UILabel *titleLabel;          ///标题
@property (strong, nonatomic) UILabel *subtitleLabel;       ///副标题

@end

@implementation PurseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)setCellWithModel:(CoinWalletModel *)model {
    self.walletName = model.walletName;
    self.titleLabel.text = model.walletName;
    self.subtitleLabel.text = @"水滴钱包";
    if ([model.isMainWallet isEqualToString:@"YES"]) {
        self.isMainWallet = YES;
    } else {
        self.isMainWallet = NO;
    }
    self.model = model;
}

/**重写cell大小*/
- (void)setFrame:(CGRect)frame {
    CGFloat margin = adaptWidth750(30);
    frame.origin.x = margin;
    frame.size.width -= 2 * frame.origin.x;
    
    [super setFrame:frame];
}

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.walletImageView];
    [self addSubview:self.iconImageView];
    [self addSubview:self.detailButton];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subtitleLabel];
    
    [self.walletImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(adaptHeight1334(86*2));
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(adaptHeight1334(23*2));
        make.left.equalTo(self).mas_offset(adaptWidth750(26*2));
        make.height.mas_equalTo(adaptHeight1334(38*2));
        make.width.mas_equalTo(adaptWidth750(38*2));
    }];
    
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).mas_offset(adaptWidth750(131*2));
        make.centerY.equalTo(self).mas_offset(adaptHeight1334(10));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).mas_offset(adaptWidth750(12*2));
        make.top.equalTo(self).mas_offset(adaptHeight1334(23*2));
    }];
    
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).mas_offset(adaptWidth750(12*2));
        make.top.equalTo(self.titleLabel.mas_bottom).mas_equalTo(adaptHeight1334(4*2));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)detailButtonAction:(UIButton *)sender {
    [self.delegate cell:self didSelectedDetailButton:sender];
}

#pragma mark -
#pragma mark - Public Method

- (void)setIsMainWallet:(BOOL)isMainWallet {
    if (isMainWallet) {
        self.titleLabel.textColor = GetColor(@"#FFFFFF");
        self.subtitleLabel.textColor = GetColor(@"#FFFFFF");
        self.walletImageView.image = GetImage(@"wallet_cell_bg_s");
        self.iconImageView.image = GetImage(@"wallet_cell_icon_s");
        [self.detailButton setImage:GetImage(@"wallet_cell_detail_s") forState:normal];
    } else {
        self.titleLabel.textColor = GetColor(@"#444444");
        self.subtitleLabel.textColor = GetColor(@"#999999");
        self.walletImageView.image = GetImage(@"wallet_cell_bg");
        self.iconImageView.image = GetImage(@"wallet_cell_icon");
        [self.detailButton setImage:GetImage(@"wallet_cell_detail") forState:normal];
    }
    _isMainWallet = isMainWallet;
}

#pragma mark -
#pragma mark - Lazy load

- (UIImageView *)walletImageView {
    if (!_walletImageView) {
        _walletImageView = [[UIImageView alloc] init];
        _walletImageView.image = GetImage(@"wallet_cell_bg");
    }
    return _walletImageView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [_iconImageView setImage:GetImage(@"wallet_cell_icon")];
    }
    return _iconImageView;
}

- (UIButton *)detailButton {
    if (!_detailButton) {
        _detailButton = [[UIButton alloc] init];
        [_detailButton setImage:GetImage(@"wallet_cell_detail") forState:normal];
        [_detailButton addTarget:self action:@selector(detailButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _detailButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.textColor = GetColor(@"#444444");
        [_titleLabel setText:@"--"];
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _subtitleLabel.textColor = GetColor(@"#999999");
        [_subtitleLabel setText:@"--"];
    }
    return _subtitleLabel;
}
@end
