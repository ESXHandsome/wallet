//
//  WLNTradeLawBPublishCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeLawBPublishCell.h"

@implementation WLNTradeLawBPublishCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.numTxt addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];
        
        [self.fudongTxt addTarget:self action:@selector(textField2TextChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return self;
    
}

-(void)textField1TextChange:(UITextField *)textField{

    
    if (textField.text.length == 0) {
        self.zuixiaoeLab.text = [NSString stringWithFormat:@"最小交易额:%@",_buyDic[@"min_pay"]];
    }else{
        self.zuixiaoeLab.text = [NSString stringWithFormat:@"%f",textField.text.floatValue * [_valueLab.text floatValue]];
    }
 
    
}
- (void)textField2TextChange:(UITextField *)textField{
    
    
    if (textField.text.length == 0) {
        self.valueLab.text = _buyDic[@"value"];
    }else{
        self.valueLab.text = [NSString stringWithFormat:@"%.2f",[textField.text floatValue] / 100 * [_buyDic[@"value"]floatValue]];
        
        self.zuixiaoeLab.text = [NSString stringWithFormat:@"%f",self.numTxt.text.floatValue *
                                 self.fudongTxt.text.floatValue / 100 * self.valueLab.text.floatValue];
        
    }
  
    
    
    
    
}
- (void)setBuyDic:(NSMutableDictionary *)buyDic{
    
    if (buyDic == nil) {
        return;
    }
    _buyDic = buyDic;
    
    self.usdtPriceLab.text = [NSString stringWithFormat:@"当前盘口价格%@ CNY",buyDic[@"price"]];
    self.valueLab.text = buyDic[@"value"];
    
    self.zuixiaoeLab.text = [NSString stringWithFormat:@"最小交易额:%@",buyDic[@"min_pay"]];
    self.minTxt.placeholder = [NSString stringWithFormat:@"单笔最低:%@",buyDic[@"min"]];
    self.maxTxt.placeholder = [NSString stringWithFormat:@"单笔最高:%@",buyDic[@"max"]];
    
    
    NSInteger choosetype = [buyDic[@"priceChooseType"] integerValue];
    if (choosetype == 0) {
        
        self.priceChooseTypeLab.text = @"固定价格";
        self.fudongLab.hidden = YES;
        self.fudongView.hidden = YES;
        
    }else{
        self.priceChooseTypeLab.text = @"浮动价格";
        self.fudongLab.hidden = NO;
        self.fudongView.hidden = NO;
    }
    
    
    

}


@end
