//
//  WLNMineExtensionInfoCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineExtensionInfoCell.h"

@implementation WLNMineExtensionInfoCell

- (void)sellAction{
    
    NSInteger status = [_dic[@"status"] integerValue];
    
    if (status != 5) {
        
        [SVProgressHUD showErrorWithStatus:@"目前不可卖出"];
        return;
    }
    
    if (_didClickSell) {
        _didClickSell();
    }
    
}

- (void)setModel:(Order *)model{
    _model = model;
    self.timeLab.text = model.add_time;
    self.numLab.text = model.num;
    self.typesLab.text = model.type.integerValue == 1 ? @"买入": @"卖出";
    
    
    
    NSArray *arr = @[@"匹配中",@"交易中",@"完成",@"冻结",@"可卖出",@"去支付"];
    
    self.statusLab.text = arr[model.status.integerValue + 1];
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    _dic = dic;
    
    self.timeLab.text = dic[@"add_time"];
    self.numLab.text = [dic[@"num"] stringValue];
    
    NSNumber *num = dic[@"type"];
    
    self.typesLab.text = num.integerValue == 1 ? @"买入": @"卖出";
    

    
    
    
    NSInteger status = [dic[@"status"] integerValue];
    
    
    if (status > 0) {
        
        
        self.sellView.backgroundColor = status == 5 ? @"orange".color : @"gray".color;
        
        self.statusLab.text = OrderStatusArr[status - 1];
        
    }
    
    
    
    
    
    
    
}

@end
