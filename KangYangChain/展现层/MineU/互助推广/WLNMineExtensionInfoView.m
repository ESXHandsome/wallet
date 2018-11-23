//
//  WLNMineExtensionInfoView.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineExtensionInfoView.h"

@implementation WLNMineExtensionInfoView

- (void)shenqing:(UITapGestureRecognizer *)tap{
    
    self.shenqingLab.textColor = [UIColor blackColor];
    self.maichuLab.textColor = [UIColor grayColor];
    
    if (_didClickBaodan) {
        _didClickBaodan();
    }
    
}
- (void)maichu:(UITapGestureRecognizer *)tap{
    
    self.shenqingLab.textColor = [UIColor grayColor];
    self.maichuLab.textColor = [UIColor blackColor];
    
    if (_didClickMaichu) {
        _didClickMaichu();
    }
    
}

@end
