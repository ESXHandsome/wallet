//
//  WLNPropertyCell.m
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNPropertyCell.h"

@implementation WLNPropertyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic.allKeys.count == 0) {
        return;
    }
    
    
    self.totalLab.text = dic[@"total"];
    self.bbLab.text = [NSString stringWithFormat:@"%@ %@",dic[@"bb"],self.currenBi];
    self.lawLab.text = [NSString stringWithFormat:@"%@ %@",dic[@"c2c"],self.currenBi];
    self.agreeLab.text = [NSString stringWithFormat:@"%@ %@", dic[@"contract"],self.currenBi];
    
    
    
}
@end
