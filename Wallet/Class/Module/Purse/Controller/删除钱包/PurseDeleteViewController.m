//
//  PurseDeleteViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/6.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseDeleteViewController.h"

#import "PurseDeleteConfirmViewController.h"

@interface PurseDeleteViewController ()

@property (strong, nonatomic) UILabel *textLabel; ///内容输入框
@property (strong, nonatomic) UIButton *backupButton; ///返回按钮
@property (nonatomic, strong) UIView *tfBackView;
@end

@implementation PurseDeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self creatUI];
    
}

- (void)creatUI {
     self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    [self.view addSubview:self.tfBackView];
    [self.view addSubview:self.backupButton];
     [self.tfBackView addSubview:self.textLabel];
    
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(76.5*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(15*2));
        make.height.mas_equalTo(adaptHeight1334(64*2));
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

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        NSString *testString = @"注意！删除钱包前，请务必确认已备份好钱包助记词或私钥，否则将丢失您的钱包资产";
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
        [_backupButton setTitle:@"知道了，继续" forState:normal];
        [_backupButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_backupButton addTarget:self action:@selector(backupButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _backupButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_backupButton setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _backupButton;
}

-(void)backupButtonAction {
    
    
      [self.navigationController pushViewController:PurseDeleteConfirmViewController.new animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
