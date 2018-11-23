//
//  WLNMineGHBHeadCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGHBHeadCell.h"

@implementation WLNMineGHBHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)clickAction:(UITapGestureRecognizer *)tap{
    if (_didClickBlock) {
        _didClickBlock(tap.view.tag);
        
    }
    
}
@end
