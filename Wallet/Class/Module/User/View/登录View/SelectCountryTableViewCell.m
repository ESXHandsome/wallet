//
//  SelectCountryTableViewCell.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SelectCountryTableViewCell.h"

@implementation SelectCountryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.textLabel.font = [UIFont systemFontOfSize:adaptFontSize(12*2)];
        self.textLabel.textColor = GetColor(@"#444444");
    }
    return self;
}

@end
