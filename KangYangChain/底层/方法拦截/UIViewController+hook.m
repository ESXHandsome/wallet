//
//  UIViewController+hook.m
//  KangYangChain
//
//  Created by edz on 2018/10/19.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIViewController+hook.h"
#import <objc/runtime.h>
#import "NSObject+Swizzle.h"
@implementation UIViewController (hook)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
  
        [self swizzleMethod:@selector(viewDidLoad) swizzledSelector:@selector(__viewDidLoad)];
        
        [self swizzleMethod:@selector(viewWillAppear:) swizzledSelector:@selector(fr_viewWillAppear:)];
        
        [self swizzleMethod:NSSelectorFromString(@"dealloc") swizzledSelector:@selector(fr_dealloc)];


    });
                  
    
   

    
}
- (void)fr_dealloc{
    
    NSLog(@"🐯🐯🐯 当前控制器被释放 : %@",NSStringFromClass([self class]));
    [SVProgressHUD dismiss];
    
    
}
- (void)fr_viewWillAppear:(BOOL)animated{
    
    NSLog(@"🍓🍓🍓 当前控制器 : %@",NSStringFromClass([self class]));
    
    [self __resetNav];
    [self __resetTab];
    
    [self fr_viewWillAppear:animated];

}
- (void)__resetTab{
//    self.tabBarController.tabBar.hidden = YES;
}
- (void)__resetNav{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent; //设置电池栏位白色效果
    self.navigationController.navigationBar.barTintColor = rgba(29, 36, 61, 1);
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
 
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"newback"] style:UIBarButtonItemStyleDone target:self action:@selector(customPop)];
  
}

- (void)__viewDidLoad{
    

    
    [self __viewDidLoad];
    
}





@end
