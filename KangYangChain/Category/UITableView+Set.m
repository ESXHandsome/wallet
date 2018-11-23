//
//  UITableView+Set.m
//  KangYangChain
//
//  Created by edz on 2018/11/2.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UITableView+Set.h"

@implementation UITableView (Set)

- (void)fr_willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    CGFloat cornerRadius = 7.f;
    
    cell.backgroundColor = UIColor.clearColor;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGRect bounds = CGRectInset(cell.bounds, 10, 0);
    
    BOOL addLine = NO;
    
    if (indexPath.row == 0 && indexPath.row == [self numberOfRowsInSection:indexPath.section]-1) {
        
        
        CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
        
    } else if (indexPath.row == 0) {
        
        
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        
        addLine = YES;
        
    } else if (indexPath.row == [self numberOfRowsInSection:indexPath.section]-1) {
        
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        
    } else {
        
        CGPathAddRect(pathRef, nil, bounds);
        
        addLine = YES;
        
    }
    
    layer.path = pathRef;
    
    CFRelease(pathRef);
    
    layer.fillColor = UIColor.whiteColor.CGColor;
    
    
    
    if (addLine == YES) {
        
        CALayer *lineLayer = [[CALayer alloc] init];
        
        CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
        
        lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+10, bounds.size.height-lineHeight, bounds.size.width-10, lineHeight);
        
        lineLayer.backgroundColor = self.separatorColor.CGColor;
        
        [layer addSublayer:lineLayer];
        
    }
    
    UIView *testView = [[UIView alloc] initWithFrame:bounds];
    
    [testView.layer insertSublayer:layer atIndex:0];
    
    testView.backgroundColor = UIColor.clearColor;
    
    cell.backgroundView = testView;
    
    
    
    
    
}
@end
