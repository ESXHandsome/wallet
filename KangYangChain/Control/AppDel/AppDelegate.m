//
//  AppDelegate.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "AppDelegate.h"
#import <FlexLib/FlexLib.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FlexRestorePreviewSetting(); //Debug模式下可以热更新UI，仅限于xml文件部分的UI，原生部分的UI刷新还是需要编译运行。
    
    [Bugly startWithAppId:@"5cf51eed18"];

    [NSURLProtocol registerClass:[WLNURLProtocol class]];
    
    [DAConfig setUserLanguage:@"zh-Hans"];

    
    NSMutableDictionary *dic = [self routeTargetName:Handle actionName:@"readUserDic"];
    
//    if (data) {
    
        [self chatSetup];
        
        
        [self walletSetup];
        
//    }
    
    
    WLNMainTabBarCtr *ins = [WLNMainTabBarCtr new];
    
    
    
    
    
    [ins isLog:dic ? YES : NO];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = ins;
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
