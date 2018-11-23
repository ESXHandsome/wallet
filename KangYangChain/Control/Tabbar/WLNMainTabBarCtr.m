//
//  WLNMainTabBarCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMainTabBarCtr.h"
@interface WLNMainTabBarCtr ()<UITabBarControllerDelegate>
{
    NSArray *_logArr;
    NSArray *_unLogArr;
    BOOL _islog;
    UIViewController *_selectVC;
    
}
@end

@implementation WLNMainTabBarCtr
- (id)init{
    self = [super init];
    if (self){
        
        self.delegate = self;
        self.tabBar.barTintColor = [UIColor whiteColor];
        self.tabBar.tintColor = rgba(8, 36, 158, 1);
//        self.tabBar.translucent = NO;

        UIViewController *homePageViewCtr =  [NSClassFromString(@"WLNHomeCtr") new];
        UIViewController *tradePageViewCtr =  [NSClassFromString(@"WLNTradeCtr") new];
        UIViewController *propertyViewCtr =   [NSClassFromString(@"WLNPropertyCtr") new];
        UIViewController *shopCtr =  [NSClassFromString(@"WLNShopCtr") new];
        UIViewController *mineCtr   =  [NSClassFromString(@"WLNMineCtr") new];
        UIViewController *log = [NSClassFromString(@"WLNLogCtr") new];
        log.hidesBottomBarWhenPushed = YES;
        
        
        UINavigationController *baseNavOne   = [[UINavigationController alloc] initWithRootViewController:homePageViewCtr];
        UITabBarItem *baseNavOneBar = [[UITabBarItem alloc]initWithTitle:@"首页".Intl image:[[UIImage imageNamed:@"home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"homes"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        baseNavOne.tabBarItem = baseNavOneBar;
        
        
        
        UINavigationController *tradeNavTwo   = [[UINavigationController alloc] initWithRootViewController:tradePageViewCtr];
         UITabBarItem *tradeNavTwoBar = [[UITabBarItem alloc]initWithTitle:@"交易所".Intl image:[[UIImage imageNamed:@"exchange"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"exchanges"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        tradeNavTwo.tabBarItem = tradeNavTwoBar;
        
        
        
        UINavigationController *propertyNavTwo = [[UINavigationController alloc] initWithRootViewController:propertyViewCtr];
        UITabBarItem *propertyNavTwoBar = [[UITabBarItem alloc]initWithTitle:@"资产".Intl image:[[UIImage imageNamed:@"assets"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"assetss"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        propertyNavTwo.tabBarItem = propertyNavTwoBar;
        
        
        

        UINavigationController *shopNavTwo  = [[UINavigationController alloc] initWithRootViewController:shopCtr];
        UITabBarItem *shopNavTwoBar = [[UITabBarItem alloc]initWithTitle:@"商城".Intl image:[[UIImage imageNamed:@"shop"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"shops"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        shopNavTwo.tabBarItem = shopNavTwoBar;
        
        
        

        UINavigationController *mineNavFour  = [[UINavigationController alloc] initWithRootViewController:mineCtr];
        UITabBarItem *mineNavFourBar = [[UITabBarItem alloc]initWithTitle:@"我的".Intl image:[[UIImage imageNamed:@"mine"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"mines"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        mineNavFour.tabBarItem = mineNavFourBar;
        
        
        UINavigationController *logNav  = [[UINavigationController alloc] initWithRootViewController:log];
   
        
        _unLogArr = @[logNav];
        _logArr = @[baseNavOne, tradeNavTwo, propertyNavTwo, shopNavTwo,mineNavFour];
    
     


    }
    
    return self;

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.tabBar.hidden =  _islog ? NO :YES;

}
- (void)isLog:(BOOL)bol{
    
    _islog = bol;
    self.viewControllers = bol ? _logArr : _unLogArr;
    self.tabBar.hidden = bol ? NO :YES;

}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    _selectVC = viewController;
    
    
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    
    UINavigationController *Nav = (UINavigationController *)viewController;
    
    
    if ([Nav.viewControllers.firstObject isKindOfClass:@"WLNShopCtr".instance.class]) {
        
        UINavigationController  *vc = (UINavigationController *)tabBarController.selectedViewController;
        
        [vc.viewControllers.firstObject push:@"WLNHTMLCtr".instance box:ShopURL title:@"商城"];
        
        return NO;

    }
    return YES;
    
    
    
}

@end
