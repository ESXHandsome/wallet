//
//  WLNTradeAgreeOrderCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreeOrderCell.h"

@implementation WLNTradeAgreeOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.timeLab.text = dic[@"time"];
    self.typeLab.text = [NSString stringWithFormat:@"%@ %@",dic[@"type"],dic[@"coinname"]];
    self.numLab.text = [NSString stringWithFormat:@"数量:%@",dic[@"num"]];
    
}
- (void)setBibiDic:(NSMutableDictionary *)bibiDic{
    
    self.timeLab.text = bibiDic[@"end_time"];
    
    self.typeLab.text = [NSString stringWithFormat:@"%@%@",bibiDic[@"type"],bibiDic[@"curr"]];
    self.numLab.text = [NSString stringWithFormat:@"数量:%@",bibiDic[@"num"]];
    self.serviceLab.text = [NSString stringWithFormat:@"手续费:%@",bibiDic[@"buy_service"]];
    self.blanceLab.text = [NSString stringWithFormat:@"余额:%@",bibiDic[@"buy"]];

}
@end
