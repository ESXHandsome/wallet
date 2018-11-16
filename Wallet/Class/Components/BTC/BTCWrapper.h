//
//  BTCWrapper.h
//  Wallet
//
//  Created by Ying on 2018/10/18.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTCMnemonic.h"
#import "CoreBitcoin.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTCWrapper : NSObject


//创建
+(void)createAccountWithBlock:(NSString *)passPhrase password:(NSString *)password completed:(void(^)(NSString *private,NSString *address,NSString *words))block;

//导入
+(void)importPrivateKey:(NSString *)privateKey
                success:(void(^)(NSString *private,NSString *address))successblock
                  error:(void(^)(void))errorblock;


+(BTCMnemonic *)generateMnemonicPassphrase:(NSString *)phrase withPassword:(NSString *)password;



+(NSString *)getPassphraseByMnemonic:(BTCMnemonic *)mnemonic;


//查询余额
+(void)getBalanceWithAddress:(NSString *)address
                       block:(void(^)(NSDictionary *dict,BOOL suc))block;

////查询交易记录
+(void)getTxlistWithAddress:(NSString *)address
                   withPage:(NSInteger)page
                      block:(void(^)(NSArray *array,BOOL suc))block;



//交易
+(void)sendToAddress:(NSString *)toAddress money:(NSString *)money fromAddress:(NSString *)fromAddress privateKey:(NSString *)privateKey fee:(BTCAmount)fee block:(void(^)(NSString *hashStr,BOOL suc))block;


@end

NS_ASSUME_NONNULL_END
