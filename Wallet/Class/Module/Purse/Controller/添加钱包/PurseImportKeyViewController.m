//
//  PurseImportKeyViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/8.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseImportKeyViewController.h"
#import "CreatWalletViewController.h"
#import "ImportWalletManager.h"

@interface PurseImportKeyViewController ()

@end

@implementation PurseImportKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tipsLabel.text = Text(@"请输入备份的钱包私钥");
    self.tailLabel.text = Text(@"什么是私钥？");
}

- (void)buttonAction {
    NSString *key = self.textView.text;
    
    if (key.length < 1) {
        [self showAlet:@"私钥为空"];
        return;
    }
    
    CreatWalletViewController *controller = [[CreatWalletViewController alloc] init];
    controller.isImportKey = YES;
    [ImportWalletManager sharedInstance].privateKey = self.textView.text;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)tailLabelDidClick {
    
}

- (void)showAlet:(NSString *)message {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:Text(@"错误") message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:Text(@"确定") style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:action];
    [self presentViewController:controller animated:YES completion:nil];
}


@end
