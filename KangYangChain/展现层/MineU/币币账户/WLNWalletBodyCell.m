//
//  WLNWalletBodyCell.m
//  WLNWallet
//
//  Created by furao on 2018/9/29.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNWalletBodyCell.h"

@implementation WLNWalletBodyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.bizhongLab.text = dic[@"coin"];
    self.canuse.text = dic[@"number"];
    self.notuse.text = dic[@"freeze_num"];
    
    
}
@end
