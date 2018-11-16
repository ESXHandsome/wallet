//
//  SetTouchID.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/14.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SetTouchID.h"
#import "VerificationTouchID.h"
#import "TransactionPasswordView.h"
#import "PassValueName.h"
#import "LLTouchID.h"

@interface SetTouchID ()
@property (nonatomic,strong) VerificationTouchID   *contentView;

@property (nonatomic,strong) TransactionPasswordView   *tfBackView;
@property (nonatomic,strong) NSString *password;
@end
@implementation SetTouchID

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}


-(void)initOpenTouchID {
    
    [self showSetPasswordAlert];
   
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHiden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

-(void)keyboardWillBeHiden:(NSNotification *)notification {
    CoinManager *manager=[CoinManager sharedInstance];
    NSDictionary *dict=manager.currentWalletDic;
    NSString *dictpassword=[dict valueForKey:@"password"];
    self.password=[PassValueName shareInstanc].TransactionpPassword;
        if ([self.password isEqualToString:dictpassword]) {
            TransactionPasswordView *manager=[[TransactionPasswordView alloc] init];
            [manager dismiss];
            [LLTouchID validateTouchID];
            
        } else {
    
            NSLog(@"输入密码有错");
        }
}



- (void)showSetPasswordAlert{
    TransactionPasswordView *alertView = [[TransactionPasswordView alloc]initWithTitle:@"交易密码" delegate:self ];
    [alertView show];
}

-(void)SuccessForTouchID {
    
    
    
}


@end
