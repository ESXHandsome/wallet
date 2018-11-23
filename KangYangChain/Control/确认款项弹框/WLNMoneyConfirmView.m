//
//  WLNMoneyConfirmView.m
//  KangYangChain
//
//  Created by edz on 2018/11/14.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMoneyConfirmView.h"

@implementation WLNMoneyConfirmView

- (id)initWithData:(id)data{
    if (self = [super init]) {
        
        NSString *str = data;
        
        self.type = str.integerValue;
        
        
        
    }
    return self;
}
- (void)setType:(NSInteger)type{
    
    if (type == 0) {
        self.titleLab.text = @"确认线下付款";
        self.priceWordLab.text = @"支付金额";
        self.payTypeWordLab.text = @"付款方式";
        self.contentLab.text = @"如果已经付款,请点击我已付款";
        self.doneLab.text = @"我已付款";
        
    }else{
        self.titleLab.text = @"确认线下收款";
        self.priceWordLab.text = @"收款金额";
        self.payTypeWordLab.text = @"收款方式";
        self.contentLab.text = @"如果已经收款,请点击确认收款";
        self.doneLab.text = @"确认收款";
        
        
    }
    
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.priceLab.text = [NSString stringWithFormat:@"%@(CNY)",dic[@"amount"]];
    
    NSInteger payType = [dic[@"pay_type"] integerValue];
    
    self.payTypeLab.text = PayTypeArr[payType];
   

}
- (void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.backView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    self.frame = CGRectMake(30, (DEVICEHEIGHT - 130) / 2 - 50, DEVICEWidth - 60, 185);

    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:kNilOptions
                     animations:^{
                         
                         
                         self.frame = CGRectMake(30, (DEVICEHEIGHT - 130) / 2, DEVICEWidth - 60, 185);

                         
                     } completion:nil];
    
    
    

}
- (UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.3];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAction)];
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
    
}
- (void)dismissAction{
    [self.backView removeFromSuperview];
    [self removeFromSuperview];
    
}
- (void)cancelAction{
    
    [self dismissAction];
}
- (void)doneAction{
    
    [self dismissAction];
    
    if (_didPayBlock) {
        _didPayBlock();
        
    }
    
    
}
@end
