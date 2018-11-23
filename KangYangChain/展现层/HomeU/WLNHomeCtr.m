//
//  WLNHomeCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHomeCtr.h"


@interface WLNHomeCtr ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_secitonArrs;
    
}
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *cardDataArr;


@end

@implementation WLNHomeCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    self.title = @"首页".Intl;
    
    [self tabType:0];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    
   
    
    
    self.dataArr = [NSMutableArray array];
    self.cardDataArr = [NSMutableArray array];
    

    _secitonArrs = @[@[@""],@[@"",@"",@"",@""],@[]];

    [self.tab registerClass:WLNHomeCountCell.class forCellReuseIdentifier:@"WLNHomeCountCell"];
    [self.tab registerClass:WLNHomeNewCell.class forCellReuseIdentifier:@"WLNHomeNewCell"];
    [self.tab registerClass:WLNHomeHotCell.class forCellReuseIdentifier:@"WLNHomeHotCell"];

    
    WLNHomeHeadView *view = [[WLNHomeHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 150)];

    self.tab.tableHeaderView = view;

    

    NSString *str =  [NSBundle currentLanguage];

    UIImage *image;

    if ([str isEqualToString:@"en"]) {

        image = [UIImage imageNamed:@"chinese"];

    }else{
        image = [UIImage imageNamed:@"english"];

    }

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(changeLangage)];
    
    
    
    NSMutableDictionary *dicp = [NSMutableDictionary dictionary];
    dicp[@"uid"] = self.userModel.userid;
    [self routeTargetName:Handle actionName:@"marketList:" param:dicp];
    
    [self routeTargetName:Handle actionName:@"cardList:"];


}

- (void)changeLangage{
    
    [SVProgressHUD showErrorWithStatus:@"此功能尚未映射完成"];
    return;
    
   NSString *str =  [NSBundle currentLanguage];
    
    if ([str isEqualToString:@"en"]) {
        
        [DAConfig setUserLanguage:@"zh-Hans"];
        [SVProgressHUD showSuccessWithStatus:@"切换中文成功".Intl];
        

    }else{
        
        [DAConfig setUserLanguage:@"en"];
        [SVProgressHUD showSuccessWithStatus:@"切换英文成功".Intl];


    }

    
}
/**
 网络请求回调
 */
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"cardList:"]) {
        
        self.cardDataArr = data[@"data"];
        
    }else if ([sel isEqualToString:@"marketList:"]){
        
        NSArray *arr = data;
        
        for (int i = 0; i < 5; i++) {
            NSMutableDictionary *dic = arr[i];
            [self.dataArr addObject:dic];
        }
        
        
    }
    
    [self.tab reloadData];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0: 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSArray *leftArr = @[@"",@"最新行情".Intl,@"热门帖子".Intl];
    NSArray *rightArr = @[@"",@"New",@"Hot"];
    
    WLNHomeSectionHeadView *view = [[WLNHomeSectionHeadView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 40)];
    view.leftLab.text = leftArr[section];
    view.rightLab.text = rightArr[section];
    return view;
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        
        return 1;
        
    }else if (section == 1){
        return self.dataArr.count;
        
    }else{
        return self.cardDataArr.count;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _secitonArrs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self count_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else if (indexPath.section == 1){
        return [self new_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self hot_tableView:tableView cellForRowAtIndexPath:indexPath];
        
    }
    
}
- (UITableViewCell *)count_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNHomeCountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeCountCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;;
    cell.forwarder = self;
    
    return cell;
    
}
- (void)click:(UITapGestureRecognizer *)tap{
    
    NSInteger t = tap.view.tag;
    if (t == 0) {
    
        self.tabBarController.selectedIndex = 1;
        
    
    }else if (t == 1){
        self.tabBarController.selectedIndex = 3;

    }else if (t == 2){
        
        [self push:@"WLNMineCommunityCtr".instance];
        
        
    }else if (t == 3){
        [self push:@"WLNMineGHBWalletCtr".instance];

    }else{
        
        [self push:@"WLNMineBusinessCtr".instance];

    }
    
}
- (UITableViewCell *)new_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNHomeNewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeNewCell"];
  
    cell.dic = self.dataArr[indexPath.row];
    
    return cell;
    
}
- (UITableViewCell *)hot_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNHomeHotCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNHomeHotCell"];
   
    cell.dic = self.cardDataArr[indexPath.row];
    
    return cell;
  
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.section == 2) {
        
        
    }
    
}

@end
