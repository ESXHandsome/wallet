//
//  WLNMineSellOutCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/15.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineSellOutCtr.h"

@interface WLNMineSellOutCtr ()
@property (nonatomic, strong) UITextField *countTxt;
@property (nonatomic, strong) NSMutableDictionary *lastDic;


@end

@implementation WLNMineSellOutCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"卖出".Intl;
    
    [self sellInfo];
    
    
}
- (id)initWithData:(id)data{
    self = [super init];
    if (self) {
        
        self.lastDic = data;
    
    }
    return self;
    
}
- (void)sellInfo{
    
    
    
}
- (void)sellAction{
    
    if (self.countTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
        
    }
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"uid"] = self.userModel.userid;
    dic[@"num"] = self.countTxt.text;
    dic[@"id"] = self.lastDic[@"id"];
    
    [self routeTargetName:Handle actionName:@"buyGHB:" param:dic];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    
    
    [SVProgressHUD showSuccessWithStatus:@"发布成功"];

    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

@end
