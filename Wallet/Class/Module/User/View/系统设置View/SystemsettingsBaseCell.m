//
//  SystemsettingsBaseCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SystemsettingsBaseCell.h"
@implementation SystemsettingsBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-50, 46)];
        self.titleLabel.textColor = [UIColor darkGrayColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
        
        self.selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 46)];
        self.selectBtn.imageEdgeInsets = UIEdgeInsetsMake(15, SCREEN_WIDTH-35, 15, 15);//设置边距
        [self.selectBtn addTarget:self action:@selector(selectPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.selectBtn];
        
    }
    return self;
}

- (void)selectPressed:(UIButton *)sender{
    self.isSelect = !self.isSelect;
    if (self.qhxSelectBlock) {
        self.qhxSelectBlock(self.isSelect,sender.tag);
    }
    
}

@end
