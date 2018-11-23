//
//  UIViewController+Set.h
//  KangYangChain
//
//  Created by edz on 2018/10/26.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Set) <WLNReqstProtocol,WLNFreshProtocol,UIScrollViewDelegate>

typedef NS_ENUM(NSInteger, TAB_FRAME_TYPE) {
    
    CUT_TOPDOWN = 0,
    CUT_TOP,
    CUT_DOWN,
    
};
/**
 属性
 */
@property (nonatomic, strong) UITableView *tab;
@property (nonatomic, strong) id box;


@property (nonatomic, assign) TAB_FRAME_TYPE type;


- (void)push:(UIViewController *)vc;

- (void)push:(UIViewController *)vc title:(NSString *)title;

- (void)push:(UIViewController *)vc box:(id)box;

- (void)push:(UIViewController *)vc box:(id)box title:(NSString *)title;



- (void)tabType:(TAB_FRAME_TYPE)type;

- (void)customPop;

- (UITableView *)resetTab;

- (CGRect)resetTabFrame;

- (CGRect)resetEmptyFrame;

- (void)setDefaultParameter;

- (void)changeNav;
@end

NS_ASSUME_NONNULL_END
