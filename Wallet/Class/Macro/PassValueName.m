//
//  PassValueName.m
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PassValueName.h"

@implementation PassValueName

+(instancetype)shareInstanc {

    static PassValueName *shareVC=nil;
    
    if(shareVC==nil){
        shareVC=[[PassValueName alloc]init];
        
    }
    return shareVC;
}



@end
