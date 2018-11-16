//
//  PurseDeleteConfirmViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseDeleteConfirmViewController.h"
#import "PurseMnemonicViewController.h"
#import "PassValueName.h"
#import "UserConfigManager.h"
#import "CoinManager.h"
#import "PurseExportModel.h"
@interface PurseDeleteConfirmViewController ()<UITextViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) UILabel *textLabel; ///内容输入框
@property (strong, nonatomic) UIButton *backupButton; ///返回按钮
@property (strong, nonatomic) UITextView *textView;
@property (nonatomic, strong) UIView *tfBackView;
@property (strong, nonatomic) UIButton *titleButton; ///返回按钮
@property (strong, nonatomic) PurseExportModel *viewModel;

@end

@implementation PurseDeleteConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    [self textViewDidChange:_textView];
  
}
- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
- (void)creatUI {
    
    
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    [self.view addSubview:self.textLabel];
    [self.view addSubview:self.tfBackView];
    [self.tfBackView addSubview:self.textView];
    [self.view addSubview:self.backupButton];
    [self.view addSubview:self.titleButton];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(87*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(32*2));
        make.height.mas_equalTo(adaptHeight1334(64*2));
        make.width.mas_equalTo(adaptWidth750(311*2));
    }];
    [self.backupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.tfBackView.mas_bottom).mas_equalTo(adaptHeight1334(36*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textLabel.mas_bottom).mas_equalTo(adaptHeight1334(18*2));
        make.height.mas_equalTo(adaptHeight1334(134*2));
        make.width.mas_equalTo(adaptWidth750(342*2));
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.with.height.equalTo(self.tfBackView);
        make.right.equalTo(self.tfBackView.mas_right).offset(adaptWidth750(-40));
        make.left.equalTo(self.tfBackView.mas_left).offset(adaptWidth750(28));
        make.top.equalTo(self.tfBackView.mas_top).offset(adaptHeight1334(18));
        make.height.equalTo(self.tfBackView.mas_height).offset(adaptHeight1334(-40));
        
    }];
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.backupButton.mas_bottom).mas_equalTo(adaptHeight1334(248*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
    }];
}

- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor colorWithString:@"#FBFBFB"];
    }
    return _tfBackView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        NSString *testString = @"请输入备份的钱包助记词（12个英文单词），按空格分隔";
        _textLabel.textColor = GetColor(@"#4E637B");
        _textLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _textLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(15)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_textLabel setAttributedText:setString];
    }
    return _textLabel;
}

- (UIButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [[UIButton alloc] init];
        [_titleButton setTitle:@"什么是助记词？" forState:normal];
        [_titleButton addTarget:self action:@selector(MnemonicExplanation) forControlEvents:UIControlEventTouchUpInside];
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_titleButton setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _titleButton;
}

- (UIButton *)backupButton {
    if (!_backupButton) {
        _backupButton = [[UIButton alloc] init];
        [_backupButton setTitle:@"立即验证" forState:normal];
        [_backupButton setBackgroundImage:[UIImage imageNamed:@"rectangleclick"] forState:UIControlStateNormal];
        [_backupButton addTarget:self action:@selector(checkMnemonic) forControlEvents:UIControlEventTouchUpInside];
        _backupButton.titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        [_backupButton setTitleColor:GetColor(@"#6072F5") forState:normal];
    }
    return _backupButton;
}

-(UITextView *)textView {
    
    if( !_textView ){
        _textView = [[UITextView alloc] init];
//        _textView.font = [UIFont systemFontOfSize:adaptFontSize(16*2)];
        _textView.textColor=[UIColor colorWithString:@"#444444"];
//        _textView.textContainerInset = UIEdgeInsetsMake(adaptWidth750(18*2), adaptHeight1334(28*2), adaptWidth750(274*2), adaptHeight1334(58*2));
        _textView.delegate=self;
   
        
        
        
    }
    return  _textView;
}



- (void)textViewDidChange:(UITextView *)textView {
    UITextRange *selectedRange = [textView markedTextRange];
    NSString * newText = [textView textInRange:selectedRange]; //获取高亮部分
    if(newText.length>0)
        return;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 12;// 字体的行间距
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:adaptFontSize(16*2)],NSParagraphStyleAttributeName:paragraphStyle};
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
    
}
-(void)checkMnemonic {
    NSString *walletName=[PassValueName shareInstanc].walletName;

    NSDictionary *userdic= [UserConfigManager getUserConfigDic];

    NSDictionary *newdic=[userdic valueForKey:walletName];
    NSString *phrase=[newdic valueForKey:@"BTC_PHRASE"];
    if(_textView.text.length==0){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"提示"
                              message:@"输入内容不能为空"
                              delegate:nil
                              cancelButtonTitle:@"确认"
                              otherButtonTitles:nil, nil];
        [alert show];
    } else {
        
        if([_textView.text isEqualToString:phrase]){
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"删除钱包" message:@"钱包助记词验证通过确认是否删除钱包？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认删除", nil];
            [alertview show];
            
        }else {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"提示"
                                  message:@"助记词错误"
                                  delegate:nil
                                  cancelButtonTitle:@"确认"
                                  otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
       
     
    }
}
 - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
 {
         NSString *btnTitle = [alertView buttonTitleAtIndex:buttonIndex];
     
       if ([btnTitle isEqualToString:@"确认删除"] ) {
             CoinManager *manager = [CoinManager sharedInstance];
             [manager deleteWallet:[PassValueName shareInstanc].walletName];
            }
    }

-(void)MnemonicExplanation {
    self.title=@"什么是助记词？";
    PurseMnemonicViewController *controller = [[PurseMnemonicViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (PurseExportModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[PurseExportModel alloc] init];
    }
    return _viewModel;
}
@end
