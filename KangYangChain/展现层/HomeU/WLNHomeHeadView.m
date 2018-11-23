//
//  WLNHomeHeadView.m
//  KangYangChain
//
//  Created by furao on 2018/10/2.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHomeHeadView.h"

@implementation WLNHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.sc];
        self.sc.contentSize = CGSizeMake(DEVICEWidth * 5, 0);
        self.sc.pagingEnabled = YES;
        
        for (int i = 0; i < 5; i++) {
            
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(DEVICEWidth * i, 0, DEVICEWidth, self.height)];
            view.backgroundColor = [UIColor whiteColor];
            
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10,10,DEVICEWidth - 20, self.height - 10)];
            img.image = [UIImage imageNamed:@"banner"];
            
            img.layer.cornerRadius = 7;
            img.layer.masksToBounds = YES;
            
            [view addSubview:img];
            [self.sc addSubview:view];
            
            
        }
        
        
    }
    return self;
}
- (UIScrollView *)sc{
    if (_sc == nil) {
        _sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, self.height)];
        
    }
    return _sc;
}
@end
