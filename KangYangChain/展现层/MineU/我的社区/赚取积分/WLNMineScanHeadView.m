//
//  WLNMineScanHeadView.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineScanHeadView.h"

@implementation WLNMineScanHeadView

+ (WLNMineScanHeadView *)shared{
    
    
    WLNMineScanHeadView *view = [[WLNMineScanHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 65)];
    view.backgroundColor = maingray;
    
    view.topArr = @[].mutableCopy;
    view.bottomArr = @[].mutableCopy;
    view.topBtnArr = @[].mutableCopy;
    view.bottomBtnArr = @[].mutableCopy;
    return view;
    
}

- (void)setTopArr:(NSMutableArray *)topArr{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 0, DEVICEWidth - 20, 30)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 10;
    view.layer.masksToBounds = YES;
    [self addSubview:view];
    
    
    
    for (int i = 0; i< topArr.count; i ++) {
        CGFloat width = view.width / topArr.count;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(width * i, 0, width, 30)];
        button.backgroundColor = rgba(247, 79, 77, 1);
        [button setTitleColor:i == 0 ? @"white".color: @"gray".color forState:UIControlStateNormal];
        [button setTitle:topArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [view addSubview:button];
        
        [button addTarget:self action:@selector(topClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.topBtnArr addObject:button];
        
    }
    
}
- (void)topClick:(UIButton *)button{
    
    [button setTitleColor:@"white".color forState:UIControlStateNormal];
    
    for (UIButton *btn in self.topBtnArr) {
        if (btn != button) {
            [btn setTitleColor:@"gray".color forState:UIControlStateNormal];
        }
    }
    
    if (_didTopClick) {
        _didTopClick();
    }
    
}
- (void)bottomClick:(UITapGestureRecognizer *)tap{
  
}


- (void)setBottomArr:(NSMutableArray *)bottomArr{
    
    for (int i = 0; i< bottomArr.count; i ++) {
        CGFloat width = DEVICEWidth / bottomArr.count;
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(width * i, 35,width, 35)];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:@"black".color forState:UIControlStateNormal];
        [button setTitle:bottomArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:button];
        [button addTarget:self action:@selector(bottomClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomBtnArr addObject:button];
        
    }
}

@end
