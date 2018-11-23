//
//  WLNTradeLawBOrderDetailTopCell.m
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeLawBOrderDetailTopCell.h"

@implementation WLNTradeLawBOrderDetailTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDic:(NSMutableDictionary *)dic{
    
    self.typeLab.text = [dic[@"type"] integerValue] == 1 ? @"买入USDT" :@"卖出USDT";
    
    self.totalLab.text = dic[@"amount"];
    self.priceLab.text = dic[@"price"];
    self.numLab.text = dic[@"num"];
    self.createTimeLab.text =  dic[@"add_time"];
    
    self.toUserLab.text = dic[@"from_name"];
    self.orderIDLab.text = dic[@"or_sn"];
    
    NSInteger status = [dic[@"status"]integerValue];
    
    NSArray *arr  = @[@"未付款",@"待确认",@"已完成",@"自主取消",@"超时取消"];
    
    self.statusLab.text = arr[status];
    
    
    
}
@end
