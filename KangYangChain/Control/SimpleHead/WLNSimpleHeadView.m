//
//  WLNSimpleHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNSimpleHeadView.h"

@implementation WLNSimpleHeadView


- (instancetype)initWithFrame:(CGRect)frame initWithDelegate:(id<WLNSimpleHeadViewDelegate>)delegate titleArr:(NSArray *)arr
{
    self=  [self initWithFrame:frame initWithDelegate:delegate titleArr:arr];
    
    if (self) {
    
        
    }
    
    return self;
    
}

- (instancetype)initWithDelegate:(id<WLNSimpleHeadViewDelegate>)delegate titleArr:(NSArray *)arr{
    
    self = [super initWithFrame:CGRectMake(0, 0, DEVICEWidth, 45)];
    
    if (self) {
    
        self.backgroundColor = maingray;
        self.delegate = delegate;
        [self createUI:arr];
        self.specialTag = 1000;
        
    }
    
    
    return self;
    
}
- (void)createUI:(NSArray *)arr{
    
    
    NSInteger width = DEVICEWidth / arr.count;
    
    for (int i = 0; i < arr.count; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake( width * i, 0, width, 44);
        button.tag = i;
        
        [button setTitleColor:i == 0 ? UIColor.blackColor : UIColor.grayColor forState:UIControlStateNormal];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        button.backgroundColor = UIColor.whiteColor;
        
        
        [self addSubview:button];
        [self.btnArr addObject:button];
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
  
}
- (void)click:(UIButton *)button{
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(simpleClickBack:tag:)]) {
        [self.delegate simpleClickBack:button tag:button.tag];
    }
    
    if (button.tag == self.specialTag) {
        return;
    }
    
    for (UIButton *btn  in self.btnArr) {
        
        if (button != btn) {
            
            [btn setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
            
        }else{
            [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];

        }
    }
    
   
    
    
}
- (NSMutableArray *)btnArr{
    if (_btnArr == nil) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}
@end
