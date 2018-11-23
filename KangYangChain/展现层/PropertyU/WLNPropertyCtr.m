//
//  WLNPropertyCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNPropertyCtr.h"

@interface WLNPropertyCtr ()<UITableViewDelegate,UITableViewDataSource,WLNFloatViewDelegate>
{
    NSString *_currentB;
    
}
@property (nonatomic, strong) WLNPropertyHeadView *headView;

@property (nonatomic, strong) WLNFloatView *floatView;

@property (nonatomic, strong) NSMutableDictionary *infoDic;


@end

@implementation WLNPropertyCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资产".Intl;
    
    
    [self tabType:0];
    
    self.tab.dataSource = self;
    self.tab.delegate = self;
    
    self.tab.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.tab registerClass:WLNPropertyCell.class forCellReuseIdentifier:@"WLNPropertyCell"];
    
    
    _currentB = BI_TITLE_ARR.firstObject;
    
    [self pullUpLoading];
    
}
- (void)pullUpLoading{
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"coin_type"] = _currentB;
    [self routeTargetName:Handle actionName:@"propertyHome:" param:dic];

    
}
- (void)result:(id)data sel:(NSString *)sel{
    [super result:data sel:sel];
    
    self.infoDic = [data mutableCopy];
    
    self.infoDic[@"coin_type"] = _currentB;
    
    [self.tab reloadData];
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   
    self.headView.dic = self.infoDic;
    
    return self.headView;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 250;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNPropertyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNPropertyCell"];
    cell.currenBi = _currentB;
    
    cell.dic = self.infoDic;
    cell.forwarder = self;
    
    return cell;
    
    
}

#pragma mark - 自定义方法

- (void)detailAcion:(UITapGestureRecognizer *)tap{

    NSInteger tag = tap.view.tag;
    
    NSArray *arr = @[@"WLNMineBBWalletCtr",@"WLNMineLawWalletCtr",@"WLNMineAgreeWalletCtr"];
    
    NSString *str = arr[tag];
    
    [self push:str.instance];
    
    
}


- (void)clickAction:(UITapGestureRecognizer *)tap{

    if (self.infoDic.allKeys.count == 0) {
        [SVProgressHUD showErrorWithStatus:@"请稍后重试"];
        return;
    }
    
    NSArray *arr = @[[[WLNReceiveMoneyCtr alloc]initWithData:_currentB],[[WLNRSendMoneyCtr new]initWithData:self.infoDic],[WLNChangeCtr new],[WLNPropertyBillCtr new]];

    [self push:arr[tap.view.tag]];
    

}
- (void)changeBiAction:(UITapGestureRecognizer *)tap{
    
  
    self.floatView = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles:BI_TITLE_ARR, nil];
    
    [self.floatView show];
    
    
}

- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    [SVProgressHUD show];
    
    _currentB = BI_TITLE_ARR[tag];
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"coin_type"] = _currentB;
    [self routeTargetName:Handle actionName:@"propertyHome:" param:dic];

    
}

- (WLNPropertyHeadView *)headView{
    if (_headView == nil) {
        _headView = [[WLNPropertyHeadView alloc]init];
        _headView.forwarder = self;
        
    }
    return _headView;
}

@end
