//
//  WLNShopADView.m
//  KangYangChain
//
//  Created by furao on 2018/10/3.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNShopADView.h"

@implementation WLNShopADView
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
        
        [self addSubview:self.sc];
        self.sc.contentSize = CGSizeMake(DEVICEWidth * 5, 0);
        
        
        for (int i = 0; i < 5; i++) {
            
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(DEVICEWidth * i,0 , DEVICEWidth, self.height)];
            img.image = [UIImage imageNamed:@"tuiguangbg"];
            [self.sc addSubview:img];
            
            
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
