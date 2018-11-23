//
//  WLNTradeLawCionCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawCionCell.h"

@implementation WLNTradeLawCionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setChanged:(BOOL)changed{
    
    if (changed) {
        self.priceWordLab.text = @"注册时间";
        self.xianeWordLab.text = @"认证等级";
        self.numWordLab.text = @"放币时效";

    }
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic == nil) {
        return;
    }
    self.nameLab.text = dic[@"name"];
    self.finish_payLab.text = [NSString stringWithFormat:@"已交易%@",dic[@"finish_pay"]];
    self.rateLab.text = [NSString stringWithFormat:@"成交率%@%%",dic[@"rate"]];
    self.priceLab.text = dic[@"price"];
    self.xianeLab.text = [NSString stringWithFormat:@"%@-%@",dic[@"min_quota"],dic[@"max_quota"]];
    self.numLab.text = dic[@"num"];
    
}
- (void)setWeituoDic:(NSMutableDictionary *)weituoDic{
    
    if (weituoDic == nil) {
        return;
    }
    _weituoDic = weituoDic;
    
    self.priceLab.text = [weituoDic[@"price"]stringValue];
    self.numLab.text = weituoDic[@"num"];
    self.xianeLab.text = weituoDic[@"origin_num"];

    NSInteger type = [weituoDic[@"type"] integerValue];
    if (type == 1) {
        self.nameLab.text = @"买入USDT";
    }else if(type == 2){
        self.nameLab.text = @"卖出USDT";
    }
    
    NSArray *arr = @[@"未完成",@"已完成",@"撤销",@"暂停",@"隐藏"];
    self.statusLab.text = arr[ [weituoDic[@"status"]integerValue] - 1];

    if ([weituoDic[@"status"] integerValue] == 4) {
        self.zantingLab.text = @"继续接单";
    }else{
        self.zantingLab.text = @"暂停接单";

    }
    
    
}
- (void)setChangedDic:(NSMutableDictionary *)changedDic{
    if (changedDic == nil) {
        return;
    }
    
    
    self.nameLab.text = changedDic[@"name"];
    self.finish_payLab.text = [NSString stringWithFormat:@"已交易%@",changedDic[@"finish_pay"]];
    self.rateLab.text = [NSString stringWithFormat:@"成交率%@%%",changedDic[@"rate"]];
    self.priceLab.text = changedDic[@"registration_time"];
    self.xianeLab.text = [changedDic[@"level"] stringValue];
    
    self.numLab.text = [self timestampSwitchTime:[changedDic[@"time"]integerValue] andFormatter:nil];

}
- (void)chedanAction{

    if (_didClickAction) {
        _didClickAction(3);
    }
    
}
- (void)zantingAction{
    
    //撤销 : 3 暂停: 4 接单: 1

    if ([_weituoDic[@"status"] integerValue] == 4) {
        if (_didClickAction) {
            _didClickAction(1);
        }
    }else{
        if (_didClickAction) {
            _didClickAction(4);
        }
    }
    
}
@end
