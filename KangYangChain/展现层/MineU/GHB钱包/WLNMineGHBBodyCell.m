//
//  WLNMineGHBBodyCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineGHBBodyCell.h"

@implementation WLNMineGHBBodyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDic:(NSMutableDictionary *)dic{
    
    self.timeLab.text = [self timestampSwitchTime:[dic[@"datestr"]integerValue] andFormatter:@"YYYY-MM-dd hh:mm:ss"] ;
    self.typeLab.text = @"GHB";
    self.numLab.text = dic[@"ghb"];
    
    //1扫码推荐奖 2互助3充值,4锁单转入，5锁单转出,6打赏扣除，7打赏收入
    NSArray *arr = @[@"扫码推荐奖",@"互助",@"充值",@"锁单转入",@"锁单转出",@"打赏扣除",@"打赏收入"];
    
    NSInteger type = [dic[@"type"]integerValue];
    
    self.stateLab.text = arr[type - 1];
    
}

@end
