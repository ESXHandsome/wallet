//
//  AboutUsHeaderView.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "AboutUsHeaderView.h"
@interface AboutUsHeaderView ()

@property (strong, nonatomic) UIImageView *userImage; 
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *messageLabel;

@end
@implementation AboutUsHeaderView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self drawUI];
    }
    return self;
}
-(void)drawUI {
    
    [self addSubview:self.userImage];
    
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.messageLabel];
    
    [self.userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(0);
        make.height.mas_offset(adaptHeight1334(140*2));
        make.width.mas_offset(adaptWidth750(180*2));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_offset(adaptWidth750(93.5*2));
        make.height.mas_equalTo(adaptWidth750(22*2));
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(adaptHeight1334(10*2));
        make.centerX.equalTo(self);
        make.width.mas_offset(adaptWidth750(163*2));
    }];
}



-(UILabel *) titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        NSString *testString = @"Drips v1.0.1";
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
        NSString *testString = @"Drips是一款数字货币钱包为您提供安全便捷的管理方案";
        _messageLabel.textColor = GetColor(@"#4E637B");
        _messageLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _messageLabel.numberOfLines = 0;
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle  setLineSpacing:adaptFontSize(15)];
        NSMutableAttributedString  *setString = [[NSMutableAttributedString alloc] initWithString:testString];
        [setString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
        [_messageLabel setAttributedText:setString];
     
       
    }
    
    return _messageLabel;
}


- (UIImageView *) userImage {
    if (!_userImage) {
        _userImage = [[UIImageView alloc] init];
        _userImage.layer.masksToBounds = YES;
        [_userImage setImage:[UIImage imageNamed:@"aboutusbackimage"]];
    }
    return _userImage;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
