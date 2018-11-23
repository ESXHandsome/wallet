//
//  WLNShopSectionHeadView.m
//  KangYangChain
//
//  Created by furao on 2018/10/10.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNShopSectionHeadView.h"

@implementation WLNShopSectionHeadView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self addSubview:self.img];
        [self addSubview:self.lab];
 
        
    }
    
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.img.frame = CGRectMake(10, (self.height - 25) / 2, 25, 25);
    self.lab.frame = CGRectMake(40, 0, 200, self.height);
    
    
}
- (UIImageView *)img{
    if (_img == nil) {
        _img = [[UIImageView alloc]init];
        _img.image = [UIImage imageNamed:@"Snip20181010_31"];
    }
    return _img;
}
- (UILabel *)lab{
    if (_lab == nil) {
        _lab = [[UILabel alloc]init];
        _lab.font = [UIFont systemFontOfSize:15];
        _lab.textAlignment = 0;
        
    }
    return _lab;
}
@end
