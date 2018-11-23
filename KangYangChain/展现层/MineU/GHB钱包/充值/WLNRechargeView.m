//
//  WLNRechargeView.m
//  KangYangChain
//
//  Created by furao on 2018/11/18.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNRechargeView.h"

@implementation WLNRechargeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.numTxt addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];

        
    }
    return self;
}
- (void)textField1TextChange:(UITextField *)texf{
    
    
    self.usdtLab.text = texf.text;
    
    
    
}
@end
