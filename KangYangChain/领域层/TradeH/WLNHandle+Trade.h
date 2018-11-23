//
//  WLNHandle+Trade.h
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNHandle (Trade)

- (void)getAgreeBiList:(NSMutableDictionary *)dic;


- (void)holdList:(NSMutableDictionary *)dic;

- (void)agreeOrder:(NSMutableDictionary *)dic;

- (void)createAgree:(NSMutableDictionary *)dic;

- (void)closeAgreeLog:(NSMutableDictionary *)dic;

- (void)holdAgreeLog:(NSMutableDictionary *)dic;

- (void)agreeTradeList:(NSMutableDictionary *)dic;

- (void)cionChooseList:(NSMutableDictionary *)dic;

- (void)agreeAccount:(NSMutableDictionary *)dic;

- (void)closeAgree:(NSMutableDictionary *)dic;

- (void)yingSunSet:(NSMutableDictionary*)dic;


- (void)agreeCancelOrder:(NSMutableDictionary *)dic;

/*
 币币
 */


- (void)weituoAllHisList:(NSMutableDictionary *)dic;

- (void)getMarketPrice:(NSMutableDictionary *)dic;

- (void)getCion:(NSMutableDictionary *)dic;

- (void)getCionList:(NSMutableDictionary *)dic;

- (void)bbBalanceScale:(NSMutableDictionary*)dic;

- (void)getBBBillList:(NSMutableDictionary *)dic;

- (void)getBBBillDetailList:(NSMutableDictionary *)dic;

- (void)weituoAllList:(NSMutableDictionary *)dic;

- (void)weituoiSingle:(NSMutableDictionary *)dic;

- (void)weituoCancelAll:(NSMutableDictionary *)dic;

- (void)weituoCancelOne:(NSMutableDictionary *)dic;

- (void)bbBuy:(NSMutableDictionary *)dic;

- (void)bbSell:(NSMutableDictionary *)dic;

- (void)bbSellQuotation:(NSMutableDictionary *)dic;

- (void)bbBuyQuotation:(NSMutableDictionary *)dic;



/*
 c2c
 */

- (void)c2cBillList:(NSMutableDictionary *)dic;

- (void)c2cBillDetail:(NSMutableDictionary *)dic;

- (void)c2cBuyList:(NSMutableDictionary *)dic;

- (void)c2cSellList:(NSMutableDictionary *)dic;

- (void)c2cWeituoList:(NSMutableDictionary *)dic;

- (void)c2cBuyConfig:(NSMutableDictionary *)dic;

- (void)c2cBuyFirstAction:(NSMutableDictionary *)dic;

- (void)c2cBuyLastAction:(NSMutableDictionary *)dic;

- (void)c2cSellLastAction:(NSMutableDictionary *)dic;

- (void)c2cBuyConfirmAction:(NSMutableDictionary *)dic;


- (void)c2cWeituoPublishBuy:(NSMutableDictionary *)dic;

- (void)c2cWeituoPublishSell:(NSMutableDictionary *)dic;

- (void)c2cWallet:(NSMutableDictionary *)dic;

- (void)c2cBuyLimit:(NSMutableDictionary *)dic;

- (void)c2cSellLimit:(NSMutableDictionary *)dic;

- (void)c2cWeituoUpdateState:(NSMutableDictionary *)dic;

- (void)c2cOrderBuyUpdataStatus:(NSMutableDictionary *)dic;

- (void)c2cOrderSellUpdataStatus:(NSMutableDictionary *)dic;

- (void)c2cTimeOutCancel:(NSMutableDictionary *)dic;

- (void)c2cChangePayType:(NSMutableDictionary *)dic;

- (void)c2cSellConfig:(NSMutableDictionary *)dic;

/**
 行情
 */
- (void)marketBiList:(NSMutableDictionary *)dic;

- (void)marketList:(NSMutableDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
