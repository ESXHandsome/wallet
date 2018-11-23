//
//  WLNTradeBBHeadCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBHeadCell.h"

@implementation WLNTradeBBHeadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self openView];
        
        
        
        _buyArr = @[@"限价买入",@"市场快速买入"];
        
        _sellArr = @[@"限价卖出",@"市场快速卖出"];
        
        _xian = _buyArr.firstObject;

        self.redDataArr = [NSMutableArray array];
        self.greenDataArr = [NSMutableArray array];

        _listView.delegate = self;
        _listView.dataSource = self;
        _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listView.scrollEnabled = NO;
        
        [_listView registerClass:WLNTradeTradeTabCell.class forCellReuseIdentifier:@"WLNTradeTradeTabCell"];
        
        
       
        
    }
    return self;
}

- (void)chooseAction:(UITapGestureRecognizer *)tap{
    
    UIView *view = tap.view;
    _isbuy = view.tag;  //0 买 1 卖
    
    
    
    if (view.tag == 0) {
        
        
        self.buyView.backgroundColor = cusgreen;
        self.sellView.backgroundColor = UIColor.whiteColor;
        self.buyLab.textColor = UIColor.whiteColor;
        self.sellLab.textColor = cusred;
        self.doneView.backgroundColor = cusgreen;
        
    }else{
        self.buyView.backgroundColor = UIColor.whiteColor;
        self.sellView.backgroundColor = cusred;
        self.buyLab.textColor = cusgreen;
        self.sellLab.textColor = UIColor.whiteColor;
        self.doneView.backgroundColor = cusred;

    }
    self.buySellBigLab.text = view.tag == 0 ? @"买入" : @"卖出";
    
    self.xianLab.text = view.tag == 0 ? _buyArr[self.xianTag]:_sellArr[self.xianTag];
    

}
- (void)setXianTag:(NSInteger)xianTag{
    
    _xianTag = xianTag;
    
    _xian = _isbuy  == 0 ? _buyArr[self.xianTag]:_sellArr[self.xianTag];

    
}
- (void)result:(id)data sel:(NSString *)sel{
    
   
    if ([sel isEqualToString:@"bbSellQuotation:"]) {
     
        self.redDataArr = data;
        
    }else if ([sel isEqualToString:@"bbBuyQuotation:"]){
        
        self.greenDataArr = data;

    }else if ([sel isEqualToString:@"bbBalanceScale:"]){
        
        NSArray *array = [self.chooseBi componentsSeparatedByString:@"/"];
        self.canUserLab.text = [NSString stringWithFormat:@"可用%@%@",data[@"cid"],array.firstObject];
        self.canBuyLab.text = [NSString stringWithFormat:@"可买%@%@",data[@"cid"],array.lastObject];

        NSLog(@"%@",data);
        
    }
    [self.listView reloadData];
    

}
- (void)faild:(id)data sel:(NSString *)sel{
    
}
- (void)openAction:(UITapGestureRecognizer *)tap{
    
    CGRect rect= windowFrame(tap.view);
    
    self.openView.lastRect = rect;
    
    [self.openView show];
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, DEVICEWidth - 20, 1)];
    lable.backgroundColor = maingray;
    lable.layer.masksToBounds = YES;
    
    return lable;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return section == 0 ? self.redDataArr.count : self.greenDataArr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        return [self red_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self green_tableView:tableView cellForRowAtIndexPath:indexPath];
    
}
- (UITableViewCell*)red_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeTabCell"];
    
    cell.dic = self.redDataArr[indexPath.row];
    cell.colors = cusred;
    return cell;
    
}
- (UITableViewCell*)green_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeTabCell"];
    cell.dic = self.greenDataArr[indexPath.row];
    cell.colors = cusgreen;

    return cell;
    
}

- (void)buyAction{
    
    
    
    if (self.priceTxt.text.length == 0 && _xianTag == 0) {
        
        [SVProgressHUD showErrorWithStatus:@"请输入价格"];
        return;
        
    }else if (self.numTxt.text.length == 0){
        
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
        
    }
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    dic[@"userid"] = self.userModel.userid;
    dic[@"price"] = _xianTag == 0 ? self.priceTxt.text : self.priceLab.text;
    dic[@"quantity"] = self.numTxt.text;
    dic[@"coin"] = _chooseBi;
    
    NSArray *array = [_chooseBi componentsSeparatedByString:@"/"];
    dic[@"buy"] = array.firstObject;
    dic[@"buyend"] = array.lastObject;
    
    dic[@"mecth"] = _xian;
    dic[@"totalprice"] = [NSString stringWithFormat:@"%f",self.priceTxt.text.floatValue * self.numTxt.text.floatValue];

    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:_isbuy == 0 ? @"确定买入?" :@"确定卖出?" buttonTitles:@"取消",@"确定", nil];
    
    weakSelf(self);
    
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
       
        if (selectIndex == 1) {
            
            if (weakself.didBackDicBlock) {
                weakself.didBackDicBlock(dic,_isbuy);
            }
        }
        
    }];
   
    
}
- (void)chooseXainshiAction:(UITapGestureRecognizer *)tap{
    
    NSArray *arr = _isbuy == 0 ? _buyArr:_sellArr;
    
    
    WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:arr, nil];
    
    [view show];
    
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    self.xianTag = tag;
    
    if (tag == 0) {
        self.priceView.hidden = NO;
        self.shijiaView.hidden = YES;
    }else{
        self.priceView.hidden = YES;
        self.shijiaView.hidden = NO;
        self.shijiaLab.text = [NSString stringWithFormat:@"参考市场价格 %@",self.priceLab.text];
        
        
    }
    
    
    
    
}
- (WLNTradeBBOpenView *)openView{
    if (_openView == nil) {
        _openView = [[WLNTradeBBOpenView alloc]initWithFrame:CGRectZero];
        
        weakSelf(self);
        
        [_openView setDidChooseBlock:^(NSMutableDictionary * _Nonnull dic) {
            
            [weakself changePriceLabsWith:dic];
            
            NSArray *array = [weakself.chooseBi componentsSeparatedByString:@"/"];

            weakself.buySellBiBigLab.text = array.firstObject;
            
            [weakself requstKeyongKemai];

            
            
        }];
        
        
        
        [_openView setDidRequstFinish:^(NSMutableDictionary * _Nonnull dic) {
            
          
            [weakself changePriceLabsWith:dic];
            
            NSMutableDictionary *dicp =@{}.mutableCopy;
            
            dicp[@"coin"] = dic[@"currency"];
            
            [weakself routeTargetName:Handle actionName:@"bbBuyQuotation:" param:dicp];
            
            [weakself routeTargetName:Handle actionName:@"bbSellQuotation:" param:dicp];

            
            [weakself requstKeyongKemai];
            
            
        }];
        
        
        
    }
    return _openView;
    
}
- (void)changePriceLabsWith:(NSMutableDictionary *)dic{
    
    
    self.typeLab.text = dic[@"currency"];
    
    self.chooseBi = dic[@"currency"];
    
    self.dollarLab.text = [NSString stringWithFormat:@"$%@",dic[@"usd"]];

    NSArray *array = [self.chooseBi componentsSeparatedByString:@"/"];
    
    
    self.priceWordLab.text = [NSString stringWithFormat:@"价格(%@)",array.lastObject];
    self.numWordLab.text = [NSString stringWithFormat:@"数量(%@)",array.firstObject];
    
    

    if ([dic[@"rise"] floatValue] > 0) {
        
        self.priceLab.textColor = cusgreen;
        self.riseLab.backgroundColor = cusgreen;
        self.kaxianImg.image = @"kxian2".image;
        self.riseLab.text = [NSString stringWithFormat:@"+%.6f%%",[dic[@"rise"]floatValue]];

    }else{
        self.priceLab.textColor = cusred;
        self.riseLab.backgroundColor = cusred;
        self.kaxianImg.image = @"kxian".image;

        self.riseLab.text = [NSString stringWithFormat:@"%.6f%%",[dic[@"rise"]floatValue]];

    }
    
    
    self.priceLab.text = dic[@"price"];
    
    
    
    
    
    
    
}
- (void)requstKeyongKemai{
    
    NSMutableDictionary *dicp2 = @{}.mutableCopy;
    
    dicp2[@"userid"] = self.userModel.userid;
    
    NSArray *array = [self.chooseBi componentsSeparatedByString:@"/"];
    
    dicp2[@"cid"] = array.firstObject;
    dicp2[@"cid2"] = array.lastObject;
    
    [self routeTargetName:Handle actionName:@"bbBalanceScale:" param:dicp2];
    
    
}

- (void)priceChangeAction:(UITapGestureRecognizer *)tap{
    
    NSInteger tag = tap.view.tag;
    
    float price = self.priceTxt.text.floatValue;
    
    if (tag == 0) {
        
        price -= 0.000001;
        if (price <= 0) {
            price = 0;
        }
        
    }else{
        price += 0.000001;

    }
    self.priceTxt.text = [NSString stringWithFormat:@"%f",price];
    
    
    
}
- (void)numChangeAction:(UITapGestureRecognizer *)tap{
    
    NSInteger tag = tap.view.tag;
    
    float price = self.numTxt.text.floatValue;
    
    if (tag == 0) {
        
        price -= 0.000001;
        if (price <= 0) {
            price = 0;
        }
        
    }else{
        price += 0.000001;
        
    }
    self.numTxt.text = [NSString stringWithFormat:@"%f",price];
    
    
    
}
- (NSMutableDictionary *)reqDic{
    if (_reqDic == nil) {
        _reqDic = [NSMutableDictionary dictionary];
//        _reqDic[@""] =
    }
    return _reqDic;
}

@end
