//
//  WLNTradeLawBOrderCell.m
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeLawBOrderCell.h"

@implementation WLNTradeLawBOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.cutBackView addSubview:self.cutView];
        
        
    }
    return self;
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic == nil) {
        return;
    }
    if ([dic[@"type"]integerValue] == 1) {
        
        self.typeLab.text = @"买入";

    }else{
        self.typeLab.text = @"卖出";
        
    }
    NSArray *arr = @[@"未付款",@"待确认",@"完成",@"自动取消",@"超时取消"];
    self.statusLab.text = arr[[dic[@"status"]integerValue]];

//    self.cutView.timestamp = [dic[@"time"]integerValue];
//    
//    weakSelf(self);
//    
//    [self.cutView setDidChangeBlock:^(NSInteger minute, NSInteger second) {
//       
//        weakself.timeLab.text = [NSString stringWithFormat:@"剩余:%ld:%ld",minute,second];
//        
//        
//    }];
    
    self.totalLab.text = dic[@"amount"];
    self.priceLab.text = dic[@"price"];
    self.numLab.text = dic[@"num"];
    
    
}
- (CZCountDownView *)cutView{
    if (_cutView == nil) {
        _cutView = [CZCountDownView countDown];
    }
    return _cutView;
}
@end
