//
//  WLNTradeHeadView.m
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNTradeHeadView.h"

@implementation WLNTradeHeadView


+ (WLNTradeHeadView *)shared{
    
    WLNTradeHeadView *view = [[WLNTradeHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 90)];
    [view shadow];
    view.backgroundColor = maingray;
    view.topArr = @[].mutableCopy;
    view.bottomArr = @[].mutableCopy;
    view.topBtnArr = @[].mutableCopy;
    view.bottomBtnArr = @[].mutableCopy;
    return view;
    
}
- (void)setTopArr:(NSMutableArray *)topArr{
    
    
    for (int i = 0; i< topArr.count; i ++) {
        CGFloat width = DEVICEWidth / topArr.count;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(width * i, 0, width, 44)];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:i == 0 ? [UIColor blackColor]: [UIColor grayColor] forState:UIControlStateNormal];
        [button setTitle:topArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        button.tag = i;
        [self addSubview:button];
        
        [button addTarget:self action:@selector(topClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.topBtnArr addObject:button];
        
    }
    
}
- (void)topClick:(UIButton*)button{
   
    if (button.tag > 0 &&  _didClickTopBLock) {
        _didClickTopBLock(button.tag);
    }
    
    
    
}
- (void)bottomClick:(UIButton *)button{
    
    button.backgroundColor = mainblue;
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    [self.bottomBtnArr enumerateObjectsUsingBlock:^(UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj != button) {
            
            obj.backgroundColor = UIColor.whiteColor;
            [obj setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
        }
        
    }];
    if (_didClickBottomBLock) {
        _didClickBottomBLock(button.tag);
        
    }
    
}
- (void)setBottomArr:(NSMutableArray *)bottomArr{
    
    for (int i = 0; i< bottomArr.count; i ++) {
        CGFloat width = DEVICEWidth / bottomArr.count;
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(width * i, 45,width, 44)];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitle:bottomArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        
        button.tag = i;
        
        if (i == 0) {
            button.backgroundColor = mainblue;
            [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        }

        [self addSubview:button];
        [button addTarget:self action:@selector(bottomClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomBtnArr addObject:button];
        
    }
}


@end
