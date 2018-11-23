//
//  WLNHandle+Property.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Property.h"

@implementation WLNHandle (Property)

- (void)propertyHome:(NSMutableDictionary *)dic{
    
    [self __requestWith:PropertyHome dic:dic sel:_cmd isPost:YES hiddenTip:YES];
    
    
}
- (void)propertyAddressList:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:PropertyAddressList dic:dic sel:_cmd isPost:YES];
    
}
- (void)propertyGetAddress:(NSMutableDictionary *)dic{
    
    [self __requestWith:PropertyGetAddress dic:dic sel:_cmd isPost:YES hiddenTip:YES];
    
}
- (void)propertyRechargeList:(NSMutableDictionary *)dic{
    
    [self __requestWith:PropertyRechargeHisList dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)propertySendB:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:PropertySendB dic:dic sel:_cmd isPost:YES hiddenTip:YES];
    
}
- (void)getBCode:(NSMutableDictionary *)dic{
    
    [self __requestWith:GetBCode dic:dic sel:_cmd isPost:YES hiddenTip:YES];
    
    
}
- (void)propertyCashList:(NSMutableDictionary *)dic{
    
    [self __requestWith:PropertyCashList dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)propertyAddAddress:(NSMutableDictionary *)dic{
    
    [self __requestWith:PropertyAddressList dic:dic sel:_cmd isPost:YES hiddenTip:YES];
    
}
@end
