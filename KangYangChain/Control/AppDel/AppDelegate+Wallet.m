//
//  AppDelegate+Wallet.m
//  KangYangChain
//
//  Created by furao on 2018/10/26.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "AppDelegate+Wallet.h"

@implementation AppDelegate (Wallet)

- (void)walletSetup{
    
 
    [self routeTargetName:Handle actionName:@"getCionList:"];

    
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    
    if ([sel isEqualToString:@"getCionList:"]) {
        
        [WLNSingle shared].bListArr = data;
        
        for (int i = 0; i <[WLNSingle shared].bListArr.count ; i++) {
            NSMutableDictionary *dic = [WLNSingle shared].bListArr[i];
            [[WLNSingle shared].bnameListArr addObject:dic[@"english_name_abb"]];
            
        }

    }
    

    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
    
}



@end
