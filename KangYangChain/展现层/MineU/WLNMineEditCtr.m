//
//  WLNMineEditCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineEditCtr.h"

@interface WLNMineEditCtr ()
@property (nonatomic, strong) UITextField *nameTxt;

@end

@implementation WLNMineEditCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑姓名".Intl;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(saveChange)];

    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    
    [SVProgressHUD showSuccessWithStatus:@"更改成功"];
    
    /*读*/
    NSMutableDictionary *dic = [self routeTargetName:Handle actionName:@"readUserDic"];
    dic[@"nickname"] = self.nameTxt.text;
    
    /*写*/
    
    [self routeTargetName:Handle actionName:@"saveUserDic:" param:dic];
    
    [self.navigationController popViewControllerAnimated:YES];

    if (_diEditdBack) {
        _diEditdBack();
    }
    
    

}

- (void)saveChange{
    
    
    if (self.nameTxt.text.length == 0 ) {
    
        [SVProgressHUD showSuccessWithStatus:@"请输入内容"];
        return;
    }
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"nickname"] = self.nameTxt.text;
    
    
    [self routeTargetName:Handle actionName:@"resetName:" param:dic];
    
    
    
    
}

@end
