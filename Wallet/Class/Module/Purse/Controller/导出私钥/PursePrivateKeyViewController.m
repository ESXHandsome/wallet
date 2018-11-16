//
//  PursePrivateKeyViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PursePrivateKeyViewController.h"
#import "PursePrivateKeyCellTableViewCell.h"
#import "PassValueName.h"
@interface PursePrivateKeyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UILabel *textLabel; ///内容输入框
@property (strong, nonatomic) UILabel *textTitle; ///内容输入框
@property (strong, nonatomic) UITableView *tableView;       ///表格视图
@property (nonatomic, strong) UIView *tfBackView;
@end

@implementation PursePrivateKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}
- (void)creatUI {
    
     self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    [self.view addSubview:self.textTitle];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.tfBackView];
    [self.tfBackView addSubview:self.textLabel];
    
    
  
    [self.tfBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(adaptWidth750(346*2));
        make.left.mas_equalTo(adaptWidth750(15*2));
        make.top.mas_equalTo(adaptHeight1334(76.5*2));
        make.height.mas_equalTo(adaptHeight1334(64*2));
    }];
    [self.textTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textLabel.mas_bottom).mas_equalTo(adaptHeight1334(32*2));
        make.width.mas_equalTo(adaptWidth750(239*2));
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textTitle.mas_bottom).mas_equalTo(adaptHeight1334(15.5*2));
        make.width.mas_equalTo(adaptWidth750(346*2));
        make.left.mas_equalTo(adaptWidth750(15*2));
        make.height.mas_equalTo(adaptHeight1334(150*2));
    }];

    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.tfBackView.mas_right).offset(adaptWidth750(-40));
        make.left.equalTo(self.tfBackView.mas_left).offset(adaptWidth750(28));
        make.top.equalTo(self.tfBackView.mas_top).offset(adaptHeight1334(18));
        make.height.equalTo(self.tfBackView.mas_height).offset(adaptHeight1334(-40));
    }];
    
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptHeight1334(75*2);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PursePrivateKeyCellTableViewCell *cell = (PursePrivateKeyCellTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"PursePrivateKeyCellTableViewCell" forIndexPath:indexPath];
    NSDictionary *dict=[PassValueName shareInstanc].walletDic;
    if (indexPath.row == 0) {
        [cell cornerRadius:top];
        
        NSLog(@"%@",[dict valueForKey:@"ADDRESS"]);
    } else {
        [cell cornerRadius:bottom];
    }
    return cell;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView=[[UITableView alloc ]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled=NO;
        _tableView.tableFooterView = UIView.new;
        [_tableView registerClass:PursePrivateKeyCellTableViewCell.class forCellReuseIdentifier:@"PursePrivateKeyCellTableViewCell"];
    }
    return _tableView;
}
- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [GetColor(@"#7CC1FF") colorWithAlphaComponent:0.1];
    }
    return _tfBackView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        NSString *testString = @"注意！拥有私钥就能完全控制该地址的资产，不要分享给任何人。";
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


- (UILabel *)textTitle {
    if (!_textTitle) {
        _textTitle = [[UILabel alloc] init];
        NSString *testString = @"以下是BTC的地址和私钥，点击可复制";
        _textTitle.textColor = GetColor(@"#4E637B");
        _textTitle.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _textTitle.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(15)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_textTitle setAttributedText:setString];
    }
    return _textTitle;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
