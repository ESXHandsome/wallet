//
//  UserAgreementViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "UserAgreementViewController.h"

@interface UserAgreementViewController ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *messageLabel;

@end

@implementation UserAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawUI];
}
-(void)drawUI {
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.messageLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_offset(adaptHeight1334(32*2)+NAVIGATION_BAR_HEIGHT);
        make.height.mas_equalTo(adaptHeight1334(20*2));
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.mas_offset(adaptHeight1334(67*2)+NAVIGATION_BAR_HEIGHT);
        make.width.mas_equalTo(adaptHeight1334(314*2));
    }];
    
}

-(UILabel *) titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        NSString *testString = @"《Drips用户服务协议》";
        _titleLabel.textColor = GetColor(@"#444444");
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text=testString;
    }
    
    return _titleLabel;
}
-(UILabel *) messageLabel {
    
    if (!_messageLabel) {
        
        _messageLabel = [[UILabel alloc] init];
        NSString *testString = @"此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款。此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款。此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款。此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款。";
        _messageLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _messageLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(12)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        NSRange range1 = [[setString string] rangeOfString:@"此处是Drips用户服务协议及隐私条款，此处是"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#444444"] range:range1];
        NSRange range2 = [[setString string] rangeOfString:@"Drips用户服务协议及隐私条款"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#101010"] range:range2];
        NSRange range3 = [[setString string] rangeOfString:@"此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款。此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款。此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款。此处是Drips用户服务协议及隐私条款，此处是Drips用户服务协议及隐私条款此处是Drips用户服务协议及隐私条款。"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#444444"] range:range3];
        [_messageLabel setAttributedText:setString];
        
    }
    
    return _messageLabel;
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
