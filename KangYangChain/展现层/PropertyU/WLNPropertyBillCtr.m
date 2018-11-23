//
//  WLNPropertyBillCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNPropertyBillCtr.h"

@interface WLNPropertyBillCtr ()<UITableViewDelegate,UITableViewDataSource,WLNSimpleHeadViewDelegate,WLNFloatViewDelegate>

{
    NSInteger _currentIndex;
    NSString *_currentB;
    WLNOrderHeadView *_chooseHeadView;
    
}
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNPropertyBillCtr
- (CGRect)resetTabFrame{
    
    return CGRectMake(0, 44, DEVICEWidth, DEVICEHEIGHT - 64 - 44);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账单";
    
    self.dataArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    [self.tab registerClass:WLNPropertyBillCell.class forCellReuseIdentifier:@"WLNPropertyBillCell"];
    
    
    WLNSimpleHeadView *head = [[WLNSimpleHeadView alloc]initWithDelegate:self titleArr:@[@"充币记录",@"提币记录"]];
    
    [self.view addSubview:head];
    
    
    
    
    _chooseHeadView = [WLNOrderHeadView shared];
    _chooseHeadView.forwarder = self;
    self.tab.tableHeaderView = _chooseHeadView;
    
    
    
    [self routeTargetName:Handle actionName:@"propertyRechargeList:"];
    
    

    
}
- (void)result:(id)data sel:(NSString *)sel{
    [super result:data sel:sel];
    
    
    self.dataArr = data[@"data"];
    [self.tab reloadData];

    
}
- (void)floatAction:(UITapGestureRecognizer *)tap{
    
    
    if (tap.view.tag == 0) {
        
        WLNFloatView *view = [[WLNFloatView alloc]initFather:tap.view delegate:self ButtonTitles: BI_TITLE_ARR,nil];
        
        [view show];
    }else{
        
        [SVProgressHUD showErrorWithStatus:@"功能未开放"];
        
    }
    
    
 
    
}
- (void)floatClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    [SVProgressHUD show];
    
    _currentB = BI_TITLE_ARR[tag];
    
    _chooseHeadView.bTypeLab.text = _currentB;

    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"coin_type"] = _currentB;

    [self routeTargetName:Handle actionName:_currentIndex == 0 ? @"propertyRechargeList:" : @"propertyCashList:" param:dic];

}

- (void)simpleClickBack:(UIButton *)button tag:(NSInteger)tag{
    
    _currentIndex = tag;
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"coin_type"] = _currentB;
    
    if (tag == 0) {
        
        [self routeTargetName:Handle actionName:@"propertyRechargeList:" param:dic];

    }else{
        
        [self routeTargetName:Handle actionName:@"propertyCashList:" param:dic];
        
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    WLNPropertyBillHeadView * view = [[WLNPropertyBillHeadView alloc]init];
    
    return view;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNPropertyBillCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNPropertyBillCell"];
    
    cell.dic = self.dataArr[indexPath.row];
    
    return cell;
    
}

@end
