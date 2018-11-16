//
//  RootViewController.m
//  Wallet
//
//  Created by Ying on 2018/10/17.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "RootViewController.h"
#import "UserViewController.h"
#import "WalletViewController.h"

@interface RootViewController () <UITabBarControllerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)creatUI {
    self.delegate = self;
    
    UserViewController *userViewController = [UserViewController new];
    WalletViewController *walletViewController = [WalletViewController new];
    
    userViewController.title = ZBLocalized(@"Me.text");
    walletViewController.title = ZBLocalized(@"Wallet.text");
    
    [userViewController.tabBarItem setImage:[GetImage(@"tab_user") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [userViewController.tabBarItem setSelectedImage:[GetImage(@"tab_user_sel") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [walletViewController.tabBarItem setImage:[GetImage(@"tab_wallet") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [walletViewController.tabBarItem setSelectedImage:[GetImage(@"tab_wallet_sel") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UINavigationController *userNavigation = [[UINavigationController alloc] initWithRootViewController:userViewController];
    UINavigationController *walletNavigation = [[UINavigationController alloc] initWithRootViewController:walletViewController];
    
    self.viewControllers = @[walletNavigation,userNavigation];
    
}


@end
