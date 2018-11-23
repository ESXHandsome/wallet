//
//  WLNOrderHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNOrderHeadView.h"

@implementation WLNOrderHeadView

+ (instancetype)shared{
    
    
    WLNOrderHeadView *view = [[WLNOrderHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 35)];
    return view;
    
    
}

@end
