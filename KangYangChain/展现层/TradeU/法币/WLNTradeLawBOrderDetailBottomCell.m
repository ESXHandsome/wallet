//
//  WLNTradeLawBOrderDetailBottomCell.m
//  KangYangChain
//
//  Created by furao on 2018/11/4.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeLawBOrderDetailBottomCell.h"

@implementation WLNTradeLawBOrderDetailBottomCell

- (void)setDic:(NSMutableDictionary *)dic{
    if (dic == nil) {
        return;
    }
    _dic = dic;
    
    self.toUserLab.text = dic[@"from_name"];
    self.bankLab.text =   dic[@"bank"];
    self.branchLab.text = dic[@"branch"];
    self.bankNumLab.text = dic[@"card_no"];
    
    
    
    
    
    self.cut.timestamp = [dic[@"time"]integerValue];
    
    weakSelf(self);
    
    [self.cut setDidChangeBlock:^(NSInteger minute, NSInteger second) {
        
        weakself.timeLab.text = [NSString stringWithFormat:@"我已支付(剩余:%ld分%ld秒)",minute,second];
        
        
    }];
    
    
    [self.cut setTimerStopBlock:^{
       
        [weakself timeOutAction];
        
        
    }];

}

- (void)setPayType:(NSInteger)payType{
    
    
    self.payTypeLab.text = PayTypeArr[payType];
    
    NSString *str = PayTypeImgArr[payType];
    self.payTypeImg.image = str.image;
    
    if (payType == 0) {

        self.otherBackView.hidden = YES;
        self.otherBackWordView.hidden = YES;
        
        
        self.yinhangBackView.hidden = NO;
        self.yinhangBackWordView.hidden = NO;
        
        
        
    }else if (payType == 1){
        
        self.accountLab.text = _dic[@"alipay_account"] ? @"未开通" :  _dic[@"alipay_account"];
        self.codeLab.text = _dic[@"alipay_qrcode"] ? @"未开通": @"保存到相册";
        
        self.yinhangBackView.hidden = YES;
        self.yinhangBackWordView.hidden = YES;
        self.otherBackView.hidden = NO;
        self.otherBackWordView.hidden = NO;
        
        
    }else if (payType == 2){
        
    
        self.accountLab.text = _dic[@"wechat_account"] ? @"未开通" :  _dic[@"wechat_account"];
        self.codeLab.text = _dic[@"wechat_qrcode"] ? @"未开通": @"保存到相册";
        
       
        self.yinhangBackView.hidden = YES;
        self.yinhangBackWordView.hidden = YES;
        self.otherBackView.hidden = NO;
        self.otherBackWordView.hidden = NO;


    }
    

    
}
- (void)timeOutAction{
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"order_id"] = _dic[@"or_sn"];
    [self routeTargetName:Handle actionName:@"c2cTimeOutCancel:" param:dic];
    
    
}



- (void)result:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD showErrorWithStatus:@"订单超时,自动取消"];
    
}
-(CZCountDownView *)cut{
    if (_cut == nil) {
        _cut = [CZCountDownView countDown];
        
    }
    return _cut;
    
}
@end
