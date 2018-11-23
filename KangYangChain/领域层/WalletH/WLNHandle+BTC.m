//
//  WLNHandle+BTC.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+BTC.h"

#define BTCKEY @"BTC"

@implementation WLNHandle (BTC)
/**
 获取私钥公钥地址
 */
//
//- (void)getBTCKeys:(NSMutableDictionary *)dic{
//    
//
//    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:BTCKEY].mutableCopy;
//    
//    if (chainDic) {
//        
//        if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
//            
//            [self.reqDelegate result:chainDic sel:NSStringFromSelector(_cmd)];
//        }
//        
//    }else{
//        
//        [BTCWrapper createAccountWithBlock:^(NSString *private, NSString *address, NSString *words) {
//            
//            NSMutableDictionary *dic =@{}.mutableCopy;
//            dic[@"private"] = private;
//            dic[@"address"] = address;
//            dic[@"words"] = words;
//            
//            [WLNKeyChain saveKeychainValue:dic key:BTCKEY];
//            
//            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
//                
//                [self.reqDelegate result:dic sel:NSStringFromSelector(_cmd)];
//                
//            }
//            
//            
//        }];
//        
//        
//    }
//    
//    
//    
//}
//
//
///**
// 2.查询余额,并显示,约等于人民币金额
// */
//
//- (void)getBTCBalance:(NSMutableDictionary *)dic{
// 
//    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:BTCKEY].mutableCopy;
//
//    NSString *address = chainDic[@"address"];
//    
//    [BTCWrapper getBalanceWithAddress:address block:^(NSDictionary *dict, BOOL suc) {
//        
//        
//        if (suc) {
//            
//            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
//                
//                [self.reqDelegate result:dict[address][@"final_balance"] sel:NSStringFromSelector(_cmd)];
//                
//            }
//        }else{
//            
//            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
//                
//                [self.reqDelegate faild:dict sel:NSStringFromSelector(_cmd)];
//                
//            }
//        }
//        
//        
//        
//    }];
//    
//}
//
//
///**
// 转账
// */
//- (void)sendBTC:(NSMutableDictionary *)dic{
//
//    
//    NSString *sendAddress = dic[@"sendAddress"];
//    
//    NSString *sendNum = dic[@"sendNum"];
//    
//    
//    NSMutableDictionary *chainDic = [WLNKeyChain readKeychainValue:BTCKEY].mutableCopy;
//    
//    [BTCWrapper sendToAddress:sendAddress  money:sendNum fromAddress:chainDic[@"address"] privateKey:chainDic[@"private"] fee:1 block:^(NSString *hashStr, BOOL suc) {
//        
//        if (suc) {
//            
//            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
//                
//                [self.reqDelegate result:hashStr sel:NSStringFromSelector(_cmd)];
//                
//            }
//            
//            
//        }else{
//            
//            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
//                
//                [self.reqDelegate faild:hashStr sel:NSStringFromSelector(_cmd)];
//                
//            }
//            
//        }
//   
//    }];
//    
//    
//    
//}
//
///**
// 3.查询交易记录
// */
//- (void)getBTCOrder:(NSMutableDictionary *)dic{
//    
// 
//    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:BTCKEY].mutableCopy;
//    
//    
//    [BTCWrapper getTxlistWithAddress:@"1J5MNotTENrEc8jMaWcFZVyACnzfDprTni" withPage:1 block:^(NSArray *array, BOOL suc) {
//        
//        
//        if (suc) {
//            
//            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(result:sel:)]) {
//                
//                [self.reqDelegate result:array.mutableCopy sel:NSStringFromSelector(_cmd)];
//                
//            }
//            
//            
//        }else{
//            
//            if (self.reqDelegate && [self.reqDelegate respondsToSelector:@selector(faild:sel:)]) {
//                
//                [self.reqDelegate faild:array sel:NSStringFromSelector(_cmd)];
//                
//            }
//        }
//        
//        
//    }];
//}

@end
