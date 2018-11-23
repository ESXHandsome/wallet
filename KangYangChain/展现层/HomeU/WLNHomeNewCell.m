//
//  WLNHomeNewCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHomeNewCell.h"

@implementation WLNHomeNewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.bizhongLab.text = dic[@"leftname"];
    self.bizhong2Lab.text = [NSString stringWithFormat:@"/%@",dic[@"rightname"]];
    
    self.moneyLab.text = dic[@"price"];
    self.money2Lab.text = [NSString stringWithFormat:@"¥%@",dic[@"cny"]];
    
    float wave = [dic[@"scale"] floatValue];
    if (wave > 0) {
        
        self.waveView.backgroundColor = cusgreen;
        self.moneyLab.textColor = cusgreen;

        self.waveLab.text = [NSString stringWithFormat:@"%.2f%%",wave];
        
    }else{
        self.waveView.backgroundColor = cusred;
        self.moneyLab.textColor = cusred;

        self.waveLab.text = [NSString stringWithFormat:@"%.2f%%",wave];
    }
    
    
}
@end
