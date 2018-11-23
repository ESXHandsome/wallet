//
//  WLNRechargeListCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNRechargeListCell.h"

@implementation WLNRechargeListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    
    self.timeLab.text = [self timestampSwitchTime:[dic[@"datestr"]integerValue] andFormatter:@"YYYY-MM-dd hh:mm:ss"] ;
    self.bTypeLab.text = @"GHB";
    self.numLab.text = dic[@"ghb"];
    
    //1扫码推荐奖 2互助3充值,4锁单转入，5锁单转出,6打赏扣除，7打赏收入
    NSArray *arr = @[@"扫码推荐奖",@"互助",@"充值",@"锁单转入",@"锁单转出",@"打赏扣除",@"打赏收入"];
    
    NSInteger type = [dic[@"type"]integerValue];
    
    self.statusLab.text = arr[type - 1];
    
    
}
@end
