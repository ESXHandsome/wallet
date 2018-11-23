//
//  WLNMineApplyFromCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/15.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineApplyFromCtr.h"


@interface WLNMineApplyFromCtr ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *lowBuyLab;
@property (nonatomic, strong) UILabel *interestLab;
@property (nonatomic, strong) UITextField *countTxt;
@property (nonatomic, strong) UILabel *shouyiLab;
@property (nonatomic, strong) id datas;




@end

@implementation WLNMineApplyFromCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"买入".Intl;
    
    [self baseInfo];
    
    [self.countTxt addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];

    
}
- (void)baseInfo{
    
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"uid"] = [self userModel].userid;
    [self routeTargetName:Handle actionName:@"buyInfo:" param:dic];
    
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"buyInfo:"]) {
        
        self.lowBuyLab.text = [NSString stringWithFormat:@"最低可购买:%@GHB",data[@"minmum"]];
        self.interestLab.text = [NSString stringWithFormat:@"%@ %% ",data[@"scale"]];
        _datas = data;
        
    }else if ([sel isEqualToString:@"buyGHB:"]){
        
    
        [SVProgressHUD showSuccessWithStatus:@"购买成功!"];
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }
    
    
}

- (void)buyAction{
    
    if (self.countTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
        
    }
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"uid"] = [self userModel].userid;
    dic[@"num"] = self.countTxt.text;
    
    
    
    [self routeTargetName:Handle actionName:@"buyGHB:" param:dic];
    

    
    
    
}


-(void)textField1TextChange:(UITextField *)textField{
    
    double  s = [_datas[@"scale"]doubleValue];
    
    double text  = textField.text.doubleValue;
    
    
    self.shouyiLab.text = [NSString stringWithFormat:@"%.2f",s / 100 * text + text];
    

    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



@end
