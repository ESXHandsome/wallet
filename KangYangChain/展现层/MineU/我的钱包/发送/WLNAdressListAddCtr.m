//
//  WLNAdressListAddCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNAdressListAddCtr.h"

@interface WLNAdressListAddCtr ()<UITableViewDataSource,UITableViewDelegate,WLNFloatViewDelegate>
{
    WLNAdressListAddCell *_cusCell;
}
@end

@implementation WLNAdressListAddCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"添加地址";
    
    self.tab.delegate = self;
    self.tab.dataSource  = self;
    [self tabType:1];
    
    
    [self.tab registerClass:WLNAdressListAddCell.class forCellReuseIdentifier:@"WLNAdressListAddCell"];
    
    
}

- (void)result:(id)data sel:(NSString *)sel{

    [super result:data sel:sel];
    if ([sel isEqualToString:@"getBCode:"]) {
        
        [SVProgressHUD showSuccessWithStatus:@"获取验证码成功"];
        
    }else if([sel isEqualToString:@"propertyAddAddress:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"添加成功"];
        
        DISPATH_AFTER(1, ^{
            
            [self customPop];
            
        });
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNAdressListAddCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNAdressListAddCell"];
    cell.forwarder = self;
    _cusCell = cell;
    
    
    return cell;
    
    
}
- (void)bChooseAction:(UITapGestureRecognizer *)tap{
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR, nil];
    
    [view show];
    
    
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _cusCell.bTypeLab.text = BI_TITLE_ARR [tag];
    
    
}
- (void)getCodeAction{
    if (_cusCell.phoneTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
        
    }
    
    [self routeTargetName:Handle actionName:@"getBCode:"];
    
    
    
}

- (void)doneAction{
    
    if (_cusCell.bTypeLab.text.length == 0) {
        
        [SVProgressHUD showErrorWithStatus:@"请输入币种"];
        return;
        
    }else if (_cusCell.addressTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入地址"];
        return;
        
    }else if (_cusCell.phoneTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
        
    }else if (_cusCell.codeTxt.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        return;
        
    }
    
    NSMutableDictionary *dic  =@{}.mutableCopy;
    dic[@"coin_type"] = _cusCell.bTypeLab.text;
    dic[@"address"] = _cusCell.addressTxt.text;
    dic[@"remark"] = _cusCell.remarkTxt.text;
    dic[@"code"] = _cusCell.codeTxt.text;
    
    
    
    
    [self routeTargetName:Handle actionName:@"propertyAddAddress:" param:dic];
    
    
}


@end
