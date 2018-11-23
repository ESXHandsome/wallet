//
//  WLNMineFormBottomCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/16.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineFormBottomCell.h"

@implementation WLNMineFormBottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)payGHB{
    if (_didPayGHBBlock) {
        _didPayGHBBlock();
    }
}
- (void)setLastDic:(NSMutableDictionary *)lastDic{
    
    _lastDic = lastDic;
    
    
}

- (void)setDic:(NSMutableDictionary *)dic{
    
    self.nameLab.text = dic[@"nickname"];
    self.phoneLab.text = dic[@"user_phone"];
    self.numLab.text = [dic[@"num"] stringValue];
    
    
    NSInteger status = [dic[@"status"] integerValue];
    
    NSArray *arr = @[@"支付中",@"完成",@"取消"];
    
    
    if (status > 0) {
        
        self.statusLab.text = arr[status - 1];
    }
    
    
    
    self.payBtn.alpha = ([self.lastDic[@"type"] integerValue] == 1 && status == 1 )  ? 1 : 0;

    
    
    
    
}
@end
