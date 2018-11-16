//
//  WalletTableHeaderView.m
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "WalletTableHeaderView.h"

@interface WalletTableHeaderView ()

@property (strong, nonatomic) UIButton *purseButton; ///钱包按钮

@property (strong, nonatomic) UIButton *addButton; ///添加按钮

@property (strong, nonatomic) UILabel *totalAssetsLabel; ///总资产

@property (strong, nonatomic) UILabel *assetDeatil; ///资产明细

@end

@implementation WalletTableHeaderView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.image = GetImage(@"table_header");
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, adaptHeight1334(136*2)+STATUS_BAR_HEIGHT);

        /**默认imageView不支持交互,开启交互*/
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.purseButton];
        [self addSubview:self.totalAssetsLabel];
        [self addSubview:self.assetDeatil];
        
        [self.purseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).mas_offset(adaptHeight1334(14*2)+STATUS_BAR_HEIGHT);
            make.left.equalTo(self).mas_offset(adaptWidth750(20.7*2));
        }];
        [self.totalAssetsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).mas_offset(adaptHeight1334(33*2)+STATUS_BAR_HEIGHT);
            make.centerX.equalTo(self);
        }];
        
        [self.assetDeatil mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.totalAssetsLabel.mas_bottom).offset(adaptHeight1334(8));
            make.centerX.equalTo(self);
            make.height.mas_equalTo(adaptHeight1334(48*2));
        }];
    }
    return self;
}

#pragma mark -
#pragma mark - Button action

- (void)purseButtonAction {
    [self.delegate purseButtonClicked];
}

- (void)addButtonAction {
    [self.delegate addButtonClicked];
}

#pragma mark -
#pragma mark - lazy load

- (UILabel *)totalAssetsLabel {
    if (!_totalAssetsLabel) {
        _totalAssetsLabel = [[UILabel alloc] init];
        _totalAssetsLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:adaptFontSize(12*2)];
        _totalAssetsLabel.textColor = [UIColor colorWithString:@"#FFFFFF"];
        _totalAssetsLabel.text = ZBLocalized(@"TotalAsset.text");
    }
    return _totalAssetsLabel;
}

- (UILabel *)assetDeatil {
    if (!_assetDeatil) {
        _assetDeatil = [[UILabel alloc] init];
        _assetDeatil.textColor = [UIColor colorWithString:@"#FFFFFF"];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"30.00"];
        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Semibold" size:34.0] range:NSMakeRange(0, str.length-3)];
        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Semibold" size:24.0] range:NSMakeRange(str.length-3, 3)];
        _assetDeatil.attributedText = str;
        
    }
    return _assetDeatil;
}

- (UIButton *)purseButton {
    if (!_purseButton) {
        _purseButton = [[UIButton alloc] init];
        [_purseButton setImage:GetImage(@"nav_wallet") forState:normal];
        [_purseButton addTarget:self action:@selector(purseButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _purseButton;
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        [_addButton setImage:GetImage(@"nav_add") forState:normal];
        [_addButton addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

@end
