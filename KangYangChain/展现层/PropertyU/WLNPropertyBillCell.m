//
//  WLNPropertyBillCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNPropertyBillCell.h"

@implementation WLNPropertyBillCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.timeLab.text = [self timestampSwitchTime:[dic[@"add_time"]integerValue] andFormatter:@"YYYY-MM-dd"];
    self.bTypeLab.text = dic[@"coin_type"];
    self.numLab.text = dic[@"amount"];
    
    NSInteger status = [dic[@"status"] integerValue];
    
    
    if (status == 0) {
        
        self.statusLab.text = @"成功";

    }else if (status == 1){
        
        self.statusLab.text = @"成功";

    }else{
        self.statusLab.text = @"成功";

    }
    
    
}
@end
