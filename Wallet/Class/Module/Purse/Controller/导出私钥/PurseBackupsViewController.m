//
//  PurseBackupsViewController.m
//  Wallet
//  钱包备份
//  Created by 狮子头 on 2018/11/6.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseBackupsViewController.h"
#import "PurseSaveMnemonicViewController.h"
@interface PurseBackupsViewController ()

@property (strong, nonatomic) UILabel *textLabel; ///内容输入框
@property (strong, nonatomic) UIButton *backupButton; ///返回按钮
@property (nonatomic, strong) UIView *tfBackView;
@end

@implementation PurseBackupsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

#pragma mark -
#pragma mark - Private method

- (void)creatUI {
     self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
   
    [self.view addSubview:self.backupButton];
     [self.view addSubview:self.tfBackView];
    [self.tfBackView addSubview:self.textLabel];
    
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(70.5*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(15*2));
        make.height.mas_equalTo(adaptHeight1334(78*2));
        make.width.mas_equalTo(adaptWidth750(346*2));
    }];
    [self.backupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textLabel.mas_bottom).mas_equalTo(adaptHeight1334(36*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.tfBackView.mas_right).offset(adaptWidth750(-40));
        make.left.equalTo(self.tfBackView.mas_left).offset(adaptWidth750(28));
        make.top.equalTo(self.tfBackView.mas_top).offset(adaptHeight1334(18));
        make.height.equalTo(self.tfBackView.mas_height).offset(adaptHeight1334(-40));
    }];
}

#pragma mark -
#pragma mark - Action

- (void)backupButtonAction {
    
    self.title=@"钱包备份";
    PurseSaveMnemonicViewController *controller = [[PurseSaveMnemonicViewController alloc] init];
 
    [self.navigationController pushViewController:controller animated:YES];
    
}

#pragma mark -
#pragma mark - Lazy load

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        NSString *testString = @"重要提示：拥有钱包备份就能完全控制钱包资产，因此强烈建议您在使用钱包前做好备份，并将钱包备份保存到安全的地方。";
        _textLabel.textColor = GetColor(@"#4E637B");
        _textLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _textLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(15)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_textLabel setAttributedText:setString];
    }
    return _textLabel;
}

- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [GetColor(@"#7CC1FF") colorWithAlphaComponent:0.1];
    }
    return _tfBackView;
}

- (UIButton *)backupButton {
    if (!_backupButton) {
        _backupButton = [[UIButton alloc] init];
        [_backupButton setTitle:@"立即备份" forState:normal];
        [_backupButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_backupButton addTarget:self action:@selector(backupButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _backupButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_backupButton setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _backupButton;
}
@end
