//
//  Money.h
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject <WLNModelProtocol>

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *privatekey; //私钥

@property (nonatomic, strong) NSString *address;   //地址

@property (nonatomic, strong) NSString *words;   //助记词

@property (nonatomic, strong) NSNumber *balance; //余额

@property (nonatomic, strong) NSNumber * rmb;

@property (nonatomic, strong) NSString *n_tx;

@property (nonatomic ,strong) NSString *total_received;


@property (nonatomic, assign) double changeBalance; //换算后余额

@property (nonatomic, strong) NSMutableDictionary *dic;

@end
