//
//  UITableViewCell+hook.m
//  KangYangChain
//
//  Created by edz on 2018/11/8.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UITableViewCell+hook.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation UITableViewCell (hook)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleMethod:@selector(initWithStyle:reuseIdentifier:) swizzledSelector:@selector(fr_initWithStyle:reuseIdentifier:)];
        
    });
    
    
    
}
- (instancetype)fr_initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    
    UITableViewCell *cell = [self fr_initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
    
}
@end
