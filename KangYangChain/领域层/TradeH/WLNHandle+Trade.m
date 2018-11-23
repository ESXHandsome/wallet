//
//  WLNHandle+Trade.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Trade.h"

@implementation WLNHandle (Trade)

- (void)agreeCancelOrder:(NSMutableDictionary *)dic{
    
    [self __requestWith:AgreeCancelOrder dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
    
}
- (void)getAgreeBiList:(NSMutableDictionary *)dic{
    
    [self __requestWith:GetBiList dic:dic sel:_cmd isPost:NO hiddenTip:YES];
}

- (void)agreeOrder:(NSMutableDictionary *)dic{
    
    [self __requestWith:AgreeOrder dic:dic sel:_cmd isPost:NO];
  
}
- (void)createAgree:(NSMutableDictionary *)dic{
    
    [self __requestWith:CreateAgree dic:dic sel:_cmd isPost:YES];
    
   
}
- (void)closeAgreeLog:(NSMutableDictionary *)dic{
    
    [self __requestWith:CloseAgreeLog dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)holdAgreeLog:(NSMutableDictionary *)dic{
    
    [self __requestWith:HoldAgreeLog dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)agreeTradeList:(NSMutableDictionary *)dic{
    
    [self __requestWith:AgreeTradeList dic:dic sel:_cmd isPost:YES];
    
}
- (void)cionChooseList:(NSMutableDictionary *)dic{
    
    [self __requestWith:CionChooseList dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)agreeAccount:(NSMutableDictionary *)dic{
    
    [self __requestWith:AgreeAccount dic:dic sel:_cmd isPost:YES];
}

- (void)closeAgree:(NSMutableDictionary *)dic{
    
    [self __requestWith:CloseAgree dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)yingSunSet:(NSMutableDictionary*)dic{
    
    [self __requestWith:YingSunSet dic:dic sel:_cmd isPost:YES];
    
}

- (void)holdList:(NSMutableDictionary *)dic{
    
    [self __requestWith:HoldList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)getMarketPrice:(NSMutableDictionary *)dic{
    
    [self __requestWith:GetMarketPrice dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)getCion:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:GetCion dic:dic sel:_cmd isPost:NO];
    
}
- (void)getCionList:(NSMutableDictionary *)dic{
    
    [self __requestWith:GetCionList dic:dic sel:_cmd isPost:NO];
    
}
- (void)bbBuy:(NSMutableDictionary *)dic{
    
    [self __requestWith:BBBuy dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)bbSell:(NSMutableDictionary *)dic{
    
    [self __requestWith:BBSell dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)getBBBillList:(NSMutableDictionary *)dic{
    
    [self __requestWith:GetBBBillList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)getBBBillDetailList:(NSMutableDictionary *)dic{
    
    [self __requestWith:GetBBBillDetailList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)weituoAllList:(NSMutableDictionary *)dic{
    
    [self __requestWith:WeituoAllList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)weituoAllHisList:(NSMutableDictionary *)dic{
    
    [self __requestWith:WeituoAllHisList dic:dic sel:_cmd isPost:NO];
    
}
- (void)weituoCancelAll:(NSMutableDictionary *)dic{
    
    [self __requestWith:WeituoCancelAll dic:dic sel:_cmd isPost:NO];
    
}
- (void)weituoCancelOne:(NSMutableDictionary *)dic{
    
    [self __requestWith:WeituoCancelOne dic:dic sel:_cmd isPost:NO];

    
}
- (void)weituoiSingle:(NSMutableDictionary *)dic{
    
    [self __requestWith:WeituoSingle dic:dic sel:_cmd isPost:NO];

}
- (void)bbSellQuotation:(NSMutableDictionary *)dic{
 
    
    [self __requestWith:BBSellQuotation dic:dic sel:_cmd isPost:NO];
    
}

- (void)bbBuyQuotation:(NSMutableDictionary *)dic{
    
    [self __requestWith:BBBuyQuotation dic:dic sel:_cmd isPost:NO];

    
}
- (void)bbBalanceScale:(NSMutableDictionary*)dic{
    
    [self __requestWith:BBBalanceScale dic:dic sel:_cmd isPost:NO hiddenTip:YES];
}

#pragma mark - C2C

- (void)c2cBillList:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBillList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)c2cBuyList:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBuyList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)c2cSellList:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CSellList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)c2cWeituoList:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CWeituoList dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)c2cBuyConfig:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBuyConfig dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)c2cSellConfig:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CSellConfig dic:dic sel:_cmd isPost:NO];
    
    
}
- (void)c2cBuyFirstAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBuyFirstAction dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
    
}
- (void)c2cBillDetail:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBillDetail dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)c2cBuyLastAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBuyLastAction dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)c2cBuyConfirmAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBuyConfirmAction dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)c2cWeituoPublishBuy:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CWeituoPublishBuy dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
    
}

- (void)c2cWeituoPublishSell:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:C2CWeituoPublishSell dic:dic sel:_cmd isPost:NO hiddenTip:YES];

    
}
- (void)c2cWallet:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CWallet dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}

- (void)c2cBuyLimit:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CBuyLimit dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)c2cSellLimit:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CSellLimit dic:dic sel:_cmd isPost:NO hiddenTip:YES];

}
- (void)c2cWeituoUpdateState:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:C2CWeituoUpdateState dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
    
}
- (void)c2cOrderBuyUpdataStatus:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2COrderBuyUpdataStatus dic:dic sel:_cmd isPost:NO hiddenTip:YES];
}
- (void)c2cOrderSellUpdataStatus:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2COrderSellUpdataStatus dic:dic sel:_cmd isPost:NO hiddenTip:YES];

    
}
- (void)c2cTimeOutCancel:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CTimeOutCancel dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)c2cChangePayType:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CChangePayType dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)c2cSellLastAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:C2CSellLastAction dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
    
}

#pragma mark - 行情

- (void)marketBiList:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:MarketBiList dic:dic sel:_cmd isPost:NO hiddenTip:YES];
    
}
- (void)marketList:(NSMutableDictionary *)dic{
    
    [self __requestWith:MarketList dic:dic sel:_cmd isPost:NO];
    
}
@end
