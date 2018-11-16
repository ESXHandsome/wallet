//
//  PursePrivateKeyCellTableViewCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/7.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PursePrivateKeyCellTableViewCell.h"
#import "PassValueName.h"
@interface PursePrivateKeyCellTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;          ///标题
@property (strong, nonatomic) UILabel *messageLable;   ///用户头像


@end


@implementation PursePrivateKeyCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)cornerRadius:(type)type {
    if (type == top) {
        [_titleLabel setText:@"地址"];
     NSDictionary *dict=[PassValueName shareInstanc].walletDic;
        [_messageLable setText:[dict valueForKey:@"ADDRESS"]];
    } else if (type == bottom) {
        
        [_titleLabel setText:@"私钥"];
        NSDictionary *dict=[PassValueName shareInstanc].walletDic;
        [_messageLable setText:[dict valueForKey:@"PRIVATE_KEY"]];

    } else {
        
    }
}

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.messageLable];
    [self addSubview:self.titleLabel];
    
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(30*2));
        make.left.mas_offset(adaptWidth750(20*2));
        make.width.mas_offset(adaptWidth750(60));

        
    }];
    
    
    
    [self.messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).mas_offset(adaptWidth750(19*2));
        make.top.equalTo(self).mas_offset(adaptHeight1334(30*2));
        make.width.mas_offset(adaptWidth750(246*2));
    }];
    
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(14*2)];
        _titleLabel.textColor = GetColor(@"#444444");
        _titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        _titleLabel.numberOfLines=0;
    }
    return _titleLabel;
}

- (UILabel *)messageLable {
    if (!_messageLable) {
        _messageLable = [[UILabel alloc] init];
        _messageLable.lineBreakMode = UILineBreakModeWordWrap;
        _messageLable.numberOfLines=0;
        _messageLable.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _messageLable.textColor = GetColor(@"#444444");
        
    }
    return _messageLable;
}
@end
