//
//  PrivacyClauseLabel.m
//  Wallet
//
//  Created by Ying on 2018/10/26.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PrivacyClauseLabel.h"

@implementation PrivacyClauseLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.font = [UIFont systemFontOfSize:adaptFontSize(11*2)];
        [self setTextColor:GetColor(@"#FFFFFF")];
    }
    return self;
}



@end
