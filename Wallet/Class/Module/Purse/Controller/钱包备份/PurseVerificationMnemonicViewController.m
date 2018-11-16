//
//  PurseVerificationMnemonicViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseVerificationMnemonicViewController.h"
#import "ViewController.h"
#import "GBTagListView.h"
#import "UserConfigManager.h"
#import "PassValueName.h"
#import "PurseDetailViewController.h"
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface PurseVerificationMnemonicViewController (){
    
    NSArray*strArray;//保存标签数据的数组
    GBTagListView*_tempTag;
    
}
@property (strong, nonatomic) UILabel *titleLabel; ///内容输入框
@property (strong, nonatomic) UILabel *textLabel; ///内容输入框
@property (strong, nonatomic) UIButton *backupButton; ///返回按钮
@property (strong, nonatomic) UILabel *messageLable;
@property (nonatomic, strong) UIView *tfBackView;
@property (nonatomic, strong) NSArray *arraypharse;

@end

@implementation PurseVerificationMnemonicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    // Do any additional setup after loading the view.
}

-(void)configUI {
    
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
        make.height.mas_equalTo(adaptHeight1334(150*2));
    }];

    [self.backupButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.tfBackView.mas_bottom).mas_equalTo(adaptHeight1334(148*2));
        make.width.mas_equalTo(adaptWidth750(322*2));
        make.height.mas_equalTo(adaptHeight1334(44*2));
    }];
    [self drawUI];
  
}

-(void)drawUI {
   
    NSString *str=[PassValueName shareInstanc].walletPhrase;
    strArray = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
 
    GBTagListView *tagList = [[GBTagListView alloc]initWithFrame:CGRectMake(adaptWidth750(10), adaptHeight1334(333*2+STATUS_BAR_HEIGHT),  adaptWidth750(342*2), 200)];
    /**允许点击 */
    tagList.canTouch = YES;
    /**可以控制允许点击的标签数 */
    tagList.canTouchNum = 12;
    /**控制是否是单选模式 */
    tagList.isSingleSelect = NO;
    tagList.signalTagColor = [UIColor colorWithString:@"#F1F8FF"];
    [tagList setTagWithTagArray:strArray];
    __weak __typeof(self)weakSelf = self;
    [tagList setDidselectItemBlock:^(NSArray *arr) {
        [_tempTag removeFromSuperview];
        GBTagListView *selectItems = [ [GBTagListView alloc]initWithFrame:CGRectMake(adaptWidth750(17*2),adaptHeight1334(tagList.frame.origin.y+tagList.frame.size.height-100+STATUS_BAR_HEIGHT), adaptWidth750(342*2), 0)];
        selectItems.signalTagColor = [UIColor whiteColor];
        selectItems.canTouch = NO;
        [selectItems setMarginBetweenTagLabel:0 AndBottomMargin:0];
        [selectItems setTagWithTagArray:arr];
        self.arraypharse=arr;
        [weakSelf.view addSubview:selectItems];
        _tempTag = selectItems;
    }];
    [self.view addSubview:tagList];
 
}


- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor colorWithString:@"#F1F8FF"];
    }
    return _tfBackView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        NSString *testString = @"验证您的钱包助记词";
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
        NSString *testString = @"请根据您记下的助记词，按顺序点击，验证您备份的助记词正确无误。";
        _textLabel.textColor = GetColor(@"#999999");
        //        _textLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
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




- (UIButton *)backupButton {
    if (!_backupButton) {
        _backupButton = [[UIButton alloc] init];
        [_backupButton setTitle:@"确定" forState:normal];
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
    NSString *str=[PassValueName shareInstanc].walletPhrase;
    strArray = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *oldstr = [strArray componentsJoinedByString:@","];
    NSString *string = [self.arraypharse componentsJoinedByString:@","];

    if ([oldstr isEqualToString:string]) {
        for (UIViewController *controller in self.navigationController.viewControllers) {
            if ([controller isKindOfClass:[PurseDetailViewController class]]) {
                PurseDetailViewController *A =(PurseDetailViewController *)controller;
                [self.navigationController popToViewController:A animated:YES];
            }
        }
        [MBProgressHUD showSuccess:@"助记词顺序验证通过，请妥善保管助记词"];
    }else{
        
        [MBProgressHUD showSuccess:@"助记词验证失败，请检查备份"];
    }
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
