//
//  WLNTradeAgreementLeftCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/5.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreementLeftCtr.h"

@interface WLNTradeAgreementLeftCtr ()<UITableViewDelegate,UITableViewDataSource,WLNFloatViewDelegate>
{
    WLNTradeTradeCell *_headCell;
    WLNFloatView *_priceFloatView;
    WLNFloatView *_levelFloatView;
    WLNTradeTradeHeadView *_headView;
    
}
@property (nonatomic, strong) NSMutableArray *clistDataArr;
@property (nonatomic, strong) NSMutableArray *plistDataArr;
@property (nonatomic, strong) NSString *amount;

@property (nonatomic, strong) NSMutableDictionary *coinDic;
@property (nonatomic, strong) NSMutableDictionary *ctypeDic;
@property (nonatomic, strong) NSMutableDictionary *leverDic;





@end

@implementation WLNTradeAgreementLeftCtr

- (CGRect)resetTabFrame{
    return CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 44 - 64);
}

- (void)setDefaultParameter{
    
    self.clistDataArr = [NSMutableArray array];
    self.plistDataArr = [NSMutableArray array];
    
    
    self.ctypeDic = @{@"name":@"限价单",@"value":@"1"}.mutableCopy;
    self.leverDic = @{@"name":@"20X",@"value":@"20"}.mutableCopy;
    

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDefaultParameter];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNTradeTradeCell.class forCellReuseIdentifier:@"WLNTradeTradeCell"];
    [self.tab  registerClass:WLNTradeTradeBodyCell.class forCellReuseIdentifier:@"WLNTradeTradeBodyCell"];
    
    
    
    
    _headView = [[WLNTradeTradeHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 48)];
    self.tab.tableHeaderView = _headView;
    
    weakSelf(self);
    
    [_headView setDidClickBlock:^(NSMutableDictionary * _Nonnull dic) {
        
        weakself.coinDic = dic;
        
        [weakself getListByID];

        [weakself.tab reloadData];
        
        
    }];
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"cionChooseList:" param:dic];
  
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"agreeTradeList:"]) {
        
        self.clistDataArr = data[@"clist"];
        self.plistDataArr = data[@"plist"];
        self.amount = data[@"amount"];
        
        [self.tab reloadData];
        
    }else if ([sel isEqualToString:@"createAgree:"]){
        
        [SVProgressHUD showSuccessWithStatus:@"买入成功"];
        
        
    }else if ([sel isEqualToString:@"cionChooseList:"]){
        
        _headView.dataArrs = data;
        self.coinDic = _headView.dataArrs.firstObject;
        
        [self getListByID];
        
        
    }
    
    
    
}
/*
 根据id获取列表数据
 */
- (void)getListByID{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"uid"] = self.userModel.userid;
    dic[@"coinid"] = self.coinDic[@"id"];
    [self routeTargetName:Handle actionName:@"agreeTradeList:" param:dic];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WLNTradeAgreementLeftHeadView *view = [[WLNTradeAgreementLeftHeadView alloc]init];
    view.layer.masksToBounds = YES;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 95;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : self.clistDataArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
       return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self body_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
}
- (UITableViewCell *)head_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeCell"];
    cell.forwarder = self;
    
    cell.dic = self.coinDic;
    
    cell.availableLab.text = [NSString stringWithFormat:@"可用 %@ USDT",self.amount];
    cell.ctypeDic= self.ctypeDic;
    cell.levelDic = self.leverDic;
    cell.listArr = self.plistDataArr;
    
    _headCell = cell;
    
    
    return cell;
    
}
- (UITableViewCell *)body_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeBodyCell"];
    cell.dic = self.clistDataArr[indexPath.row];
    
    return cell;
    
}
#pragma mark - 买涨买跌
- (void)byAction:(UITapGestureRecognizer *)tap{
    
    if (_headCell.biTxt.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入数量"];
        return;
    }
    
    NSMutableDictionary *dic =@{}.mutableCopy;
    
    dic[@"type"]    = tap.view.tag == 0 ? @"1" : @"2";
    dic[@"uid"]     = self.userModel.userid;
    dic[@"ctype"]   = self.ctypeDic[@"value"];
    dic[@"coinid"]  = self.coinDic[@"id"];
    dic[@"lever"]   = self.leverDic[@"value"];
    dic[@"price"]   = self.coinDic[@"price"];
    dic[@"num"]     = _headCell.biTxt.text;
    dic[@"maxline"] = _headCell.maxTxt.text;
    dic[@"minline"] = _headCell.minTxt.text;
    
    
    HYAlertView *alert = [[HYAlertView alloc]initWithTitle:@"温馨提示" message:@"确定买入?" buttonTitles:@"取消",@"确定", nil];
    
    weakSelf(self);
    [alert showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
        
        if (selectIndex == 1) {
            
            [weakself routeTargetName:Handle actionName:@"createAgree:" param:dic];

        }

        
    }];
    
    
  
    
    
}

- (void)danChooseAction:(UITapGestureRecognizer *)tap{
    
    _priceFloatView = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"市价单",@"限价单", nil];
    
    [_priceFloatView show];
    
}
- (void)chooseAction:(UITapGestureRecognizer *)tap{
    
    _levelFloatView = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:@"20X",@"30X",@"50X", nil];
    
    [_levelFloatView show];
    
    
}

- (void)floatClickBackFloatView:(WLNFloatView *)floatView button:(UIButton *)button tag:(NSInteger)tag{
    
    if (floatView == _priceFloatView) {
       
        NSArray *arr =  @[@{@"name":@"市价单",@"value":@"1"}.mutableCopy,
                          @{@"name":@"限价单",@"value":@"2"}.mutableCopy];
        
        self.ctypeDic =arr[tag];

        
    }else if (floatView == _levelFloatView){
        
        NSArray *arr = @[@{@"name":@"20X",@"value":@"20"}.mutableCopy,
                         @{@"name":@"30X",@"value":@"30"}.mutableCopy,
                         @{@"name":@"50X",@"value":@"50"}.mutableCopy];
        
        self.leverDic = arr[tag];
        
        
        
    }
    [self.tab reloadData];
    
    
    
}








@end
