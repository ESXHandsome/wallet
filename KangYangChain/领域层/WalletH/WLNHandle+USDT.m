//
//  WLNHandle+USDT.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+USDT.h"

#define USDTKEY @"USDT"

@implementation WLNHandle (USDT)

//- (void)getUSDTKeys:(NSMutableDictionary *)dic{
//  
//    
//    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:USDTKEY].mutableCopy;
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
//            [WLNKeyChain saveKeychainValue:dic key:USDTKEY];
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
//}
///**
// 2.查询余额,并显示,约等于人民币金额
// */
//
//- (void)getUSDTBalance:(NSMutableDictionary *)dic{
//
//    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:USDTKEY].mutableCopy;
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
//    }];
//    
//}
//- (void)sendUSDT:(NSMutableDictionary *)dic{
//    
//
//    NSString *sendAddress = dic[@"sendAddress"];
//    
//    NSString *sendNum = dic[@"sendNum"];
//    
//    NSMutableDictionary *chainDic = [WLNKeyChain readKeychainValue:USDTKEY].mutableCopy;
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
//}
//
//
//- (void)getUSDTOrder:(NSMutableDictionary *)dic{
//    
//  
//    
//    NSMutableDictionary *chainDic =  [WLNKeyChain readKeychainValue:USDTKEY].mutableCopy;
//    
//    NSString *address = chainDic[@"address"];
//    
//    [BTCWrapper getTxlistWithAddress:address withPage:1 block:^(NSArray *array, BOOL suc) {
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
//    
//    
//    
//}
//


@end
