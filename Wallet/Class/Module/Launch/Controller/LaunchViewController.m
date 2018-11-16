//
//  LaunchViewController.m
//  Wallet
//  起始页
//  Created by Ying on 2018/10/22.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "LaunchViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
#import "LaunchViewModel.h"
#import "CreatWalletHomeViewController.h"


@interface LaunchViewController () <LaunchViewModelDelegate>

@property (strong, nonatomic) LaunchViewModel *viewModel;

@end

@implementation LaunchViewController

#pragma mark -
#pragma mark - Life cyrcle 声明周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**起始配置*/
    [self.viewModel configAppLaunch];
    
}

#pragma mark -
#pragma mark - Private key 私有函数

/**改变当前的根视图控制器*/
- (void)changWindowToRootViewController:(UIViewController *)controller {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = app.window.rootViewController;
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
    navigation.navigationBar.hidden = YES;
    app.window.rootViewController = navigation;
    [vc removeFromParentViewController];
}

#pragma mark -
#pragma mark - LaunchViewModel delegate

- (void)launchConfigSuccessed {
   
}

- (void)isNewUser {
    [self changWindowToRootViewController:CreatWalletHomeViewController.new];
}

- (void)isOldUser {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = app.window.rootViewController;
    app.window.rootViewController = RootViewController.new;
    [vc removeFromParentViewController];
}

#pragma mark -
#pragma mark - Lazy load 懒加载

- (LaunchViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LaunchViewModel alloc] init];
        _viewModel.delegate = self;
    }
    return _viewModel;
}

@end

