//
//  WLNFloatView.m
//  KangYangChain
//
//  Created by edz on 2018/10/26.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNFloatView.h"

@implementation WLNFloatView

- (instancetype)initFather:(UIView *)father delegate:(id<WLNFloatViewDelegate>)delegate ButtonTitles:(NSString *)otherButtonTitles, ...{

    
    CGRect rect =  windowFrame(father);
    
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    
    self.delegate = delegate;
    
    [self shadow];
    
    self.layer.cornerRadius = 7;
  
    if (self) {
        
        self.backgroundColor = UIColor.clearColor;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
        
        NSMutableArray *otherTitles = [NSMutableArray array];
        va_list argList;
        if (otherButtonTitles) {
            
            if ([otherButtonTitles isKindOfClass:[NSArray class]]) {
                
                [otherTitles addObjectsFromArray:(NSArray *)otherButtonTitles];
                
            }else{
                [otherTitles addObject:otherButtonTitles];
                id arg;
                va_start(argList, otherButtonTitles);
                while ((arg = va_arg(argList, id)))
                {
                    [otherTitles addObject:arg];
                }
                va_end(argList);
                
                
                
            }

            [self createBtnWith:otherTitles rect:rect];
            
        }
    
    }
    return self;
    

}
- (void)createBtnWith:(NSArray *)arr rect:(CGRect)rect{
    
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y + rect.size.height + 10, rect.size.width, arr.count * 35)];
    view.layer.cornerRadius = 7;
    view.backgroundColor = UIColor.whiteColor;
    [view shadow];
    
    [self addSubview:view];
    
    
    for (int i = 0; i < arr.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, i * 35, rect.size.width, 35);
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.tag = i;
        [button addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button];
        
    }
    
}
- (void)chooseAction:(UIButton*)button{
    
    [self dismiss];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(floatClickBack:tag:)]) {
        
        [self.delegate floatClickBack:button tag:button.tag];
        
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(floatClickBackFloatView:button:tag:)]) {
        
        [self.delegate floatClickBackFloatView:self button:button tag:button.tag];
        
        
    }
  
}
- (void)show{
  
    _isShow ? [self dismiss] : [self showNow];

}
- (void)showNow{
    
    _isShow = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self];

}
- (void)dismiss{
    
    _isShow = NO;
    
    [self removeFromSuperview];
    
    
    
}


@end
