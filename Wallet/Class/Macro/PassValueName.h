//
//  PassValueName.h
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PassValueName : NSObject

+(instancetype)shareInstanc;
@property(nonatomic,strong)NSString *str;
@property(nonatomic,strong)NSString *psw;
@property(nonatomic,strong)NSString *walletName;
@property(nonatomic,strong)NSDictionary *walletDic;
@property(nonatomic,strong)NSString *walletPhrase;
@property(nonatomic,strong)NSString *TransactionpPassword;
@property(nonatomic,strong)NSString *SuccessTouchID;

@end

NS_ASSUME_NONNULL_END
