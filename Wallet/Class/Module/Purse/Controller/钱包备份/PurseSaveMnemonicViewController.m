//
//  PurseSaveMnemonicViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//
#import "PurseVerificationMnemonicViewController.h"
#import "PurseSaveMnemonicViewController.h"
#import "UserConfigManager.h"
#import "PassValueName.h"
@interface PurseSaveMnemonicViewController ()

@property (strong, nonatomic) UILabel *titleLabel; ///内容输入框
@property (strong, nonatomic) UILabel *textLabel; ///内容输入框
@property (strong, nonatomic) UIButton *backupButton; ///返回按钮
@property (strong, nonatomic) UILabel *messageLable;
@property (nonatomic, strong) UIView *tfBackView;
@property (nonatomic,strong) NSString *phrase;


@end

@implementation PurseSaveMnemonicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
    [self alertmessage];
    NSString *walletName=[PassValueName shareInstanc].walletName;
    
    NSDictionary *userdic= [UserConfigManager getUserConfigDic];
    
    NSDictionary *newdic=[userdic valueForKey:walletName];
    self.phrase=[newdic valueForKey:@"ETH_PHRASE"];
}


- (void)creatUI {
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    [self.view addSubview:self.textLabel];
    [self.view addSubview:self.tfBackView];
    [self.view addSubview:self.backupButton];
    [self.view addSubview:self.titleLabel];
     [self.view addSubview:self.messageLable];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);

        make.top.equalTo(self.view).mas_offset(adaptHeight1334(23*2)+NAVIGATION_BAR_HEIGHT);
        
        make.height.mas_equalTo(adaptHeight1334(20*2));
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_equalTo(adaptHeight1334(8*2));
        make.width.mas_equalTo(adaptWidth750(300*2));
    }];
    
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textLabel.mas_bottom).mas_equalTo(adaptHeight1334(21*2));
        make.width.mas_equalTo(adaptWidth750(342*2));
         make.height.mas_equalTo(adaptHeight1334(134*2));
    }];
    [self.messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.tfBackView.mas_right).offset(adaptWidth750(-35*2));
        make.left.equalTo(self.tfBackView.mas_left).offset(adaptWidth750(34*2));
        make.top.equalTo(self.tfBackView.mas_top).offset(adaptHeight1334(17));
        make.height.equalTo(self.tfBackView.mas_height).offset(adaptHeight1334(-40));
       
    }];
    [self.backupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.tfBackView.mas_bottom).mas_equalTo(adaptHeight1334(36*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
    }];
    
   
}

- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor colorWithString:@"#4E637B"];
    }
    return _tfBackView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        NSString *testString = @"请记下您的钱包助记词并保存到安全的地方";
        _titleLabel.textColor = GetColor(@"#444444");
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(14*2)];
        _titleLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(15)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_titleLabel setAttributedText:setString];
    }
    return _titleLabel;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        NSString *testString = @"钱包助记词用于恢复钱包资产，拥有助记词即可完全控制钱包资产，请务必妥善保管，丢失助记词即丢失钱包资产。Drips不储存用户助记词，无法提供找回功能。";
        _textLabel.textColor = GetColor(@"#999999");
          _textLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(12*2)];
        _textLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(15)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_textLabel setAttributedText:setString];
    }
    return _textLabel;
}

- (UILabel *)messageLable {
    if (!_messageLable) {
        _messageLable = [[UILabel alloc] init];
        NSString *walletName=[PassValueName shareInstanc].walletName;
        
        NSDictionary *userdic= [UserConfigManager getUserConfigDic];
        
        NSDictionary *newdic=[userdic valueForKey:walletName];
        NSString *testString = [newdic valueForKey:@"ETH_PHRASE"];
        _messageLable.textColor = GetColor(@"#EDF4FB");
        _messageLable.font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptFontSize(16*2)];
        _messageLable.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(15)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_messageLable setAttributedText:setString];
    }
    return _messageLable;
}



- (UIButton *)backupButton {
    if (!_backupButton) {
        _backupButton = [[UIButton alloc] init];
        [_backupButton setTitle:@"下一步" forState:normal];
        [_backupButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_backupButton addTarget:self action:@selector(checkMnemonic) forControlEvents:UIControlEventTouchUpInside];
        _backupButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_backupButton setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _backupButton;
}

-(void)alertmessage{
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil
                          message:@"泄漏助记词将导致资产丢失请认真抄写，切勿截屏！"
                          delegate:nil
                          cancelButtonTitle:@"确认"
                          otherButtonTitles:nil, nil];
    [alert show];
}



-(void)checkMnemonic {
    [PassValueName shareInstanc].walletPhrase=self.phrase;
    self.title=@"钱包备份";
    PurseVerificationMnemonicViewController *controller = [[PurseVerificationMnemonicViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
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
