//
//  PurseMnemonicViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseMnemonicViewController.h"

@interface PurseMnemonicViewController ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *messageLabel;

@end



@implementation PurseMnemonicViewController

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
        make.top.equalTo(self.view).mas_offset(adaptHeight1334(89*2));
        make.left.equalTo(self.view).mas_offset(adaptWidth750(25*2));
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(adaptHeight1334(123*2));
        make.width.mas_equalTo(adaptWidth750(324*2));
    }];
    
}

-(UILabel *) titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        NSString *testString = @"什么是助记词？";
        _titleLabel.textColor = GetColor(@"#6072F5");
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text=testString;
    }
    
    return _titleLabel;
}
-(UILabel *) messageLabel {
    
    if (!_messageLabel) {
        
        _messageLabel = [[UILabel alloc] init];
        NSString *testString = @"创建钱包后，会出现一个备份助记词功能，选择备份助记词，输入密码，会出现 12 个英文单词，每两个单词之间有一个空格，这12个单词就是助记词，一个钱包只有一组助记词且不能修改。这些单词都来源于一个固定词库，是由私钥根据一定算法得来的，所以私钥与助记词之间的转换是互通的，助记词实际上就是私钥的另一种表现形式。助记词的功能等同于私钥，在导入钱包中，输入助记词并设置一个密码（不用输入原密码），就能进入钱包并拥有这个钱包的掌控权，就可以把钱包中的数字资产转移走。备份助记词时, 要尽量采用物理介质备份，例如用笔抄在纸上等，尽可能不要采用截屏或者拍照之后放在联网的设备里，以防被他人窃取。";
        _messageLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _messageLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(12)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        NSRange range1 = [[setString string] rangeOfString:@"创建钱包后，会出现一个备份助记词功能，选择备份助记词，输入密码，会出现 12 个英文单词，每两个单词之间有一个空格，这12个单词就是助记词，一个钱包只有一组助记词且不能修改。这些单词都来源于一个固定词库，是由私钥根据一定算法得来的，所以私钥与助记词之间的转换是互通的，"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#000000"] range:range1];
        NSRange range2 = [[setString string] rangeOfString:@"助记词实际上就是私钥的另一种表现形式。"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#6072F5"] range:range2];
        NSRange range3 = [[setString string] rangeOfString:@"助记词的功能等同于私钥，在导入钱包中，输入助记词并设置一个密码（不用输入原密码），就能进入钱包并拥有这个钱包的掌控权，就可以把钱包中的数字资产转移走。备份助记词时, 要尽量采用物理介质备份，例如用笔抄在纸上等，尽可能"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#000000"] range:range3];
        NSRange range4 = [[setString string] rangeOfString:@"不要采用截屏或者拍照之后放在联网的设备里，"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#6072F5"] range:range4];
        NSRange range5 = [[setString string] rangeOfString:@"以防被他人窃取。"];
        [setString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#000000"] range:range5];
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
