//
//  WalletTableViewCell.m
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "WalletTableViewCell.h"

@interface WalletTableViewCell()

@property (strong, nonatomic) UIImageView *underGroundView; ///底层视图
@property (strong, nonatomic) UIImageView *colorView; ///左侧颜色块
@property (strong, nonatomic) UILabel *coinLabel;  ///币种

@end

@implementation WalletTableViewCell

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

- (void)cornerRadius:(CornerType)type {
    if (type == top) {
        [self.underGroundView setImage:GetImage(@"table_top")];
        [self.iconView setImage:GetImage(@"btc")];
        [self.colorView setImage:GetImage(@"btcrectangle")];
        self.coinLabel.text = @"BTC";
        
        UIView *view = UIView.new;
        view.backgroundColor = UIColor.grayColor;
        [self.underGroundView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.underGroundView);
            make.left.equalTo(self.underGroundView).mas_offset(adaptWidth750(20));
            make.right.equalTo(self.underGroundView).mas_offset(-adaptWidth750(16));
            make.height.mas_equalTo(0.5);
        }];
    } else if (type == bottom) {
        [self.underGroundView setImage:GetImage(@"table_bottom")];
        [self.iconView setImage:GetImage(@"eth")];
        [self.colorView setImage:GetImage(@"etcrectangle")];
        self.coinLabel.text = @"ETH";
    } else {
        
    }
}

- (void)configUI {

    /**背景无色*/
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.underGroundView];
    [self.underGroundView addSubview:self.iconView];
    [self.underGroundView addSubview:self.colorView];
    [self.underGroundView addSubview:self.coinLabel];
    [self.underGroundView addSubview:self.priceLabel];
    [self.underGroundView addSubview:self.userCoinLabel];
    [self.underGroundView addSubview:self.userPriceLabel];
    
    [self.underGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).mas_offset(adaptWidth750(16*2));
        make.right.equalTo(self).mas_offset(-adaptWidth750(16*2));
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.underGroundView).mas_offset(adaptHeight1334(20*2));
        make.left.equalTo(self.underGroundView).mas_offset(adaptWidth750(26*2));
        make.bottom.equalTo(self.underGroundView).mas_offset(-adaptHeight1334(19.5*2));
        make.width.mas_equalTo(adaptWidth750(42*2));
    }];
    
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.underGroundView).mas_offset(adaptHeight1334(22*2));
        make.left.equalTo(self.underGroundView).mas_offset(adaptWidth750(14));
        make.bottom.equalTo(self.underGroundView).mas_offset(-adaptHeight1334(40));
        make.width.mas_equalTo(adaptWidth750(8));
    }];
    
    [self.coinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.underGroundView).mas_offset(adaptHeight1334(40));
        make.left.equalTo(self.iconView.mas_right).mas_offset(adaptWidth750(20));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coinLabel.mas_bottom).mas_offset(adaptHeight1334(6));
        make.left.equalTo(self.iconView.mas_right).mas_offset(adaptWidth750(22));
    }];
    
    [self.userCoinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.underGroundView).mas_offset(-adaptWidth750(40));
        make.top.equalTo(self.underGroundView).mas_offset(adaptHeight1334(40));
    }];

    [self.userPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.underGroundView).mas_offset(-adaptWidth750(42));
        make.top.equalTo(self.userCoinLabel.mas_bottom).mas_offset(adaptHeight1334(6));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma mark -
#pragma mark - Public key
- (void)setCellsText:(WalletTableCellModel *)cellModel  {
    self.priceLabel.text = cellModel.marketPrice;
    self.userCoinLabel.text = cellModel.coin;
    self.userPriceLabel.text = cellModel.coinPrice;
}

#pragma mark -
#pragma mark - lazy load

- (UIImageView *)underGroundView {
    if (!_underGroundView) {
        _underGroundView = [[UIImageView alloc] init];
        _underGroundView.backgroundColor = [UIColor clearColor];
    }
    return _underGroundView;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.layer.cornerRadius = adaptHeight1334(40);
        _iconView.layer.masksToBounds = YES;
        _iconView.backgroundColor = [UIColor grayColor];
    }
    return _iconView;
}

- (UIImageView *)colorView {
    if (!_colorView) {
        _colorView = [[UIImageView alloc] init];
        _colorView.layer.cornerRadius = adaptHeight1334(4);
        _colorView.layer.masksToBounds = YES;
        _colorView.backgroundColor = [UIColor redColor];
    }
    return _colorView;
}

- (UILabel *)coinLabel {
    if (!_coinLabel) {
        _coinLabel = [[UILabel alloc] init];
        [_coinLabel setText:@"BTC"];
        _coinLabel.font = [UIFont fontWithName:@"PingFang SC" size:adaptFontSize(32)];
    }
    return _coinLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        [_priceLabel setText:@"--"];
        _priceLabel.font = [UIFont fontWithName:@"PingFang SC" size:adaptFontSize(24)];
        _priceLabel.textColor = [UIColor grayColor];
    }
    return _priceLabel;
}

- (UILabel *)userCoinLabel {
    if (!_userCoinLabel) {
        _userCoinLabel = [[UILabel alloc] init];
        [_userCoinLabel setText:@"--"];
        _userCoinLabel.font = [UIFont fontWithName:@"PingFang SC" size:adaptFontSize(32)];
    }
    return _userCoinLabel;
}

- (UILabel *)userPriceLabel {
    if (!_userPriceLabel) {
        _userPriceLabel = [[UILabel alloc] init];
        [_userPriceLabel setText:@"--"];
        _userPriceLabel.font = [UIFont fontWithName:@"PingFang SC" size:adaptFontSize(24)];
        _userPriceLabel.textColor = [UIColor grayColor];
    }
    return _userPriceLabel;
}

@end
