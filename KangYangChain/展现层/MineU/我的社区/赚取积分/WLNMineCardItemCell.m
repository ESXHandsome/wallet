//
//  WLNMineCardItemCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/6.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineCardItemCell.h"

@implementation WLNMineCardItemCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.img];
        [self addSubview:self.addBtn];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.img.frame = self.bounds;
    self.addBtn.frame = self.bounds;
}
- (UIImageView *)img{
    if (_img == nil) {
        _img = [[UIImageView alloc]initWithFrame:CGRectZero];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.layer.masksToBounds = YES;
        
    }
    return _img;
}
- (UIButton *)addBtn{
    if (_addBtn == nil) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _addBtn.backgroundColor =[UIColor.grayColor colorWithAlphaComponent:0.3];
        [_addBtn addTarget:self action:@selector(addAciton) forControlEvents:UIControlEventTouchUpInside];
        [_addBtn setBackgroundImage:@"ziyuanaddpic".image forState:UIControlStateNormal];
        _addBtn.hidden = YES;
        
        
    }
    return _addBtn;
}

@end
