//
//  PurseTableFooterView.m
//  Wallet
//
//  Created by Ying on 2018/10/30.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseTableFooterView.h"

@interface PurseTableFooterView ()

@property (strong, nonatomic) UIButton *addWalletButton;
@property (strong, nonatomic) UIView *lineView;

@end

@implementation PurseTableFooterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)configUI {
   
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, adaptHeight1334(100*2));
    
    [self addSubview:self.addWalletButton];
    [self addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(adaptHeight1334(40*2));
        make.left.equalTo(self).mas_offset(adaptWidth750(15*2));
        make.right.equalTo(self).mas_offset(-adaptWidth750(15*2));
        make.height.mas_equalTo(0.5);
    }];
    
    [self.addWalletButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).mas_equalTo(adaptHeight1334(22*2));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(adaptHeight1334(20*2));
    }];
    
}

- (UIButton *)addWalletButton {
    if (!_addWalletButton) {
        _addWalletButton = [[UIButton alloc] init];
        [_addWalletButton setImage:GetImage(@"wallet_add") forState:normal];
        float space = adaptWidth750(20);
        [_addWalletButton setImageEdgeInsets:UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0)];
        [_addWalletButton setTitleEdgeInsets:UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0)];
        [_addWalletButton setTitle:@"添加钱包" forState:normal];
        _addWalletButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        [_addWalletButton setTitleColor:GetColor(@"#6072F5") forState:normal];
        [_addWalletButton addTarget:self action:@selector(addWalletButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addWalletButton;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GetColor(@"#E9E9E9");
    }
    return _lineView;
}

- (void)addWalletButtonAction:(id)sender {
    [self.delegate addWalletButtonDidClicked];
}

@end
