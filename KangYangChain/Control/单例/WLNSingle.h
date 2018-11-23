//
//  WLNSingle.h
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLNSingle : NSObject

@property (nonatomic, strong) Money *btc_model;

@property (nonatomic, strong) Money *usdt_model;

@property (nonatomic, strong) Money *eth_model;

@property (nonatomic, strong) Money *current_model;

@property (nonatomic, strong) NSMutableArray *bListArr;

@property (nonatomic, strong) NSMutableArray *bnameListArr;

@property (nonatomic, strong) NSString *currentType;


+ (WLNSingle *)shared;

@end
