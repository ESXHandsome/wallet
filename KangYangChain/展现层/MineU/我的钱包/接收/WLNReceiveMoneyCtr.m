//
//  WLNReceiveMoneyCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNReceiveMoneyCtr.h"

@interface WLNReceiveMoneyCtr ()<WLNFloatViewDelegate>
{
    NSString *_currrenB;
    WLNReceiveMoneyView * _cusView;
}

@property (nonatomic, strong) NSMutableDictionary *infoDic;

@end

@implementation WLNReceiveMoneyCtr
- (id)initWithData:(id)data{
    self = [super init];
    if (self) {
        
        _currrenB = data;
    }
    return self;
}
- (void)setDefaultParameter{
    
    
    self.title = @"充币".Intl;
    
    self.infoDic = [NSMutableDictionary dictionary];
        

}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    [self setDefaultParameter];
    
    _cusView =  [[WLNReceiveMoneyView alloc]initWithFrame:self.view.frame];
    _cusView.forwarder = self;
    _cusView.currentBLab.text = _currrenB;
    
    self.view = _cusView;
    
   
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"coin_type"] = BI_TITLE_ARR.firstObject;
    [self routeTargetName:Handle actionName:@"propertyGetAddress:" param:dic];
    
}
- (void)chooseBListAction:(UITapGestureRecognizer *)tap{
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR,nil];
    
    [view show];
    
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    [SVProgressHUD show];
    
    _currrenB = BI_TITLE_ARR[tag];
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"coin_type"] = BI_TITLE_ARR[tag];
    
    [self routeTargetName:Handle actionName:@"propertyGetAddress:" param:dic];
    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    [super result:data sel:sel];
    
    self.infoDic = data;
    
    _cusView.img.image = [[WLNQRCode new] jy_QRCodeFromString:self.infoDic[@"address"] size:130];
    _cusView.bottomLab.text = [NSString stringWithFormat:@"请确保向改地址发送的是%@,否则资产将会丢失且无法找回",_currrenB];
    _cusView.addressLab.text = self.infoDic[@"address"];
    _cusView.currentBLab.text = _currrenB;

    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (void)copyAddressAction{
    
    NSString *address = self.infoDic[@"address"];
    [address copyCustum];
    
    [SVProgressHUD showSuccessWithStatus:@"复制成功"];
 
}


@end
