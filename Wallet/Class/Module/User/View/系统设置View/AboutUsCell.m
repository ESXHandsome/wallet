//
//  AboutUsCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/12.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "AboutUsCell.h"
@interface AboutUsCell ()

@property (strong, nonatomic) UILabel *titleLabel;          ///标题


@end
@implementation AboutUsCell

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

- (void)configUI {
    
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(adaptHeight1334(14.5*2));
        make.left.mas_offset(adaptWidth750(22*2));
        make.height.mas_equalTo(adaptHeight1334(17*2));
    }];
    
    
}

- (void)cornerRadius:(type)type {
    if (type == top) {
        
        [_titleLabel setText:@"推荐评分"];
        
    } else if (type == bottom) {
        
        [_titleLabel setText:@"检测新版"];
    } else {
        
    }
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        _titleLabel.textColor = GetColor(@"#444444");
    }
    return _titleLabel;
}



@end
