//
//  WLNWalletHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/18.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNWalletHeadView.h"

@implementation WLNWalletHeadView



- (void)reloadData{
    
    self.model = [WLNSingle shared].current_model;

    
}
- (void)setModel:(Money *)model{
    
    _model = model;
    
    self.balanceLab.text = [NSString stringWithFormat:@"%.5f",model.changeBalance];
    self.rmbLab.text = [NSString stringWithFormat:@"≈ %.2f CNY",model.rmb.doubleValue * model.changeBalance];
    self.bizhongChoseLab.text = [WLNSingle shared].currentType;
    self.bizhongTypeLab.text = [WLNSingle shared].currentType;
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    self.balanceLab.text = dic[@"number"];
    
    
    
}


@end
