//
//  WLNMineIntegralCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/11.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineIntegralCtr.h"

@interface WLNMineIntegralCtr ()

@end

@implementation WLNMineIntegralCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"赚取更多积分".Intl;
    
    
    
    
    
}
- (void)tuiguangAction{
    
    
    [self.navigationController pushViewController:@"WLNMineScavengingCtr".instance animated:YES];
    
    
}
- (void)fatieAction{
    
    
    [self.navigationController pushViewController:@"WLNMineCardPublishCtr".instance animated:YES];

    
}


@end
