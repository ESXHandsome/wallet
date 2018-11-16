//
//  CreatWalletHomeButton.m
//  Wallet
//
//  Created by Ying on 2018/10/26.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "CreatWalletHomeButton.h"

@implementation CreatWalletHomeButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = adaptHeight1334(22*2);
        self.layer.masksToBounds = YES;
        [self.layer setBorderColor:[UIColor whiteColor].CGColor];
        [self.layer setBorderWidth:0.5];
        self.titleLabel.textColor = GetColor(@"#FFFFFF");
        self.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [self addTarget:self action:@selector(ButtonTouchDown:)  forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(ButtonCancel:) forControlEvents:UIControlEventTouchUpOutside];
    }
    return self;
}

- (void)ButtonTouchDown:(UIButton *)sender {
    sender.selected = YES;
}

- (void)ButtonCancel:(UIButton *)sender {
    sender.selected = NO;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        [self setTitleColor:GetColor(@"#53C6F0") forState:normal];
        [self.layer setBorderColor:GetColor(@"#53C6F0").CGColor];
    } else {
        [self setTitleColor:GetColor(@"#FFFFFF") forState:normal];
        [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    }
    
}


@end
