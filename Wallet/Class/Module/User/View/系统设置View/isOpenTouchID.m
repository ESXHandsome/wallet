//
//  isOpenTouchID.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "isOpenTouchID.h"
#import "LLTouchID.h"
#import "PassValueName.h"
@implementation isOpenTouchID

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

-(void)OpenTouchID {
    
    NSString *state= [[NSUserDefaults standardUserDefaults] objectForKey:@"state"];
    if([state isEqualToString:@"YES"]){
        NSLog(@"YES");
        [LLTouchID validateTouchID];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDFailed object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDCancel object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDInputPassword object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDNoPasswordSet object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDNoAvailabel object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDNoEnrolled object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDLockout object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isOpen) name:LLValidateTouchIDSuccess object:nil];
    }else{
        NSLog(@"NO");
    }
    
}

-(void) isOpen {
    
    NSLog(@"success for TouchID");
//    NSString * isOpenTouchValue = @"YES";
////    [PassValueName shareInstanc].SuccessTouchID= isOpenTouch;
////    NSLog(@"%@",[PassValueName shareInstanc].SuccessTouchID);
//     [[NSNotificationCenter defaultCenter]postNotificationName:isOpenTouchValue object:nil];
}

@end
