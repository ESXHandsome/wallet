//
//  WLNMineCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCtr.h"

typedef void (^CellBlock)(void);

@interface WLNMineCtr ()
<
UITableViewDataSource,
UITableViewDelegate,
WMYActionSheetDelegate
>

{
 
    WMYActionSheet *_headSheet;
    WMYActionSheet *_outLogSheet;
    
}
@property (nonatomic, nullable, strong) NSArray *t_p_a_Arr; //title picture action
@property (strong, nonatomic) HXPhotoManager *manager;
@property (nonatomic, strong) WLNMineHeadCell *headCell;


@end

@implementation WLNMineCtr


- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self tabType:2];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;

    [self.tab registerClass:WLNMineSimpleCell.class forCellReuseIdentifier:@"WLNMineSimpleCell"];
    [self.tab registerClass:WLNMineHeadCell.class forCellReuseIdentifier:@"WLNMineHeadCell"];
    
    self.tab.tableFooterView = [self setFootView];

    [self routeTargetName:Handle actionName:@"userInfo:"];
    
    

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self changeNav];
    
}
- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"updateHeadImg:"]) {
        

        [self routeTargetName:Handle actionName:@"userInfo:"];

        
    }else if ([sel isEqualToString:@"userInfo:"]){
        
        NSDictionary *dic = (NSDictionary *)data;
        
        NSMutableDictionary * user = dic.mutableCopy;
        
        user[@"token"] = self.userModel.token;
                
        [self routeTargetName:Handle actionName:@"saveUserDic:" param:user];
        
        [self.tab reloadData];
        
        [SVProgressHUD dismiss];

        
    }else if ([sel isEqualToString:@"logout:"]){
        
        [self outLog];
        
    }
}

- (void)faild:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"logout:"]) {
        
        [self outLog];
    }
}

#pragma mark - UITableView dataSource & delegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"  ";
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView fr_willDisplayCell:cell forRowAtIndexPath:indexPath];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.t_p_a_Arr[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.t_p_a_Arr.count;
}
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [self head_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self simple_tableView:tableView cellForRowAtIndexPath:indexPath];

}
 
- (UITableViewCell *)head_tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineHeadCell"];
    
    self.headCell = cell;
    cell.forwarder = self;
    
    
        
    [cell.headImg sd_setImageWithURL:self.userModel.avatar.url placeholderImage:HolderImage];
   
    cell.nameLab.text = self.userModel.nickname;
    
    return cell;
    
}

- (UITableViewCell *)simple_tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineSimpleCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.img.image = [UIImage imageNamed:self.t_p_a_Arr[indexPath.section][indexPath.row][PK]];
    
    cell.lab.text = self.t_p_a_Arr[indexPath.section][indexPath.row][TK];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    CellBlock block = self.t_p_a_Arr[indexPath.section][indexPath.row][BK];
    if (block) {
        block();
    }
}

- (void)actionSheet:(WMYActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        return;
    }
    if (actionSheet == _headSheet) {
        
        if (buttonIndex == 1) {
            
            [self cameraAction];
        }else{
            [self albumAction];
        }
        
    }else if (actionSheet == _outLogSheet){
        
        [self routeTargetName:Handle actionName:@"logout:"];
        
        
    }
    
}

#pragma mark - 自定义方法

- (UIView *)setFootView{
    
    UIView *outView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth,60)];
    outView.backgroundColor =rgba(245, 245, 245, 1);
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"退出登录".Intl forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = rgba(225, 225, 225, 1);
    button.layer.cornerRadius= 7;
    button.frame = CGRectMake(10, 10, DEVICEWidth - 20,40);
    [button addTarget:self action:@selector(outAction) forControlEvents:UIControlEventTouchUpInside];
    [outView addSubview:button];
    
    return outView;
    
}

- (void)albumAction{
    
    NSLog(@"吊起系统相册");
    
    weakSelf(self);
    
    
    [self hx_presentSelectPhotoControllerWithManager:self.manager didDone:^(NSArray<HXPhotoModel *> *allList, NSArray<HXPhotoModel *> *photoList, NSArray<HXPhotoModel *> *videoList, BOOL isOriginal, UIViewController *viewController, HXPhotoManager *manager) {
        
    } imageList:^(NSArray<UIImage *> *imageList, BOOL isOriginal) {
        
        
        /*上传图片*/
        
        [SVProgressHUD showWithStatus:@"上传中"];

        NSMutableDictionary *dic =@{}.mutableCopy;
        
        dic[@"avatar"] = [imageList.firstObject zipImage];
        
        [weakself routeTargetName:Handle actionName:@"updateHeadImg:" param:dic];
        
        
    } cancel:^(UIViewController *viewController, HXPhotoManager *manager) {
        
    }];
    
    
    
}
- (void)cameraAction{
    
    NSLog(@"吊起系统相机");
    weakSelf(self);

    [self hx_presentCustomCameraViewControllerWithManager:self.manager done:^(HXPhotoModel *model, HXCustomCameraViewController *viewController) {
        
        
        /*上传图片*/
        
        [SVProgressHUD showWithStatus:@"上传中"];
        
        NSMutableDictionary *dic =@{}.mutableCopy;
        
        dic[@"avatar"] = [model.previewPhoto zipImage];
        
        [weakself routeTargetName:Handle actionName:@"updateHeadImg:" param:dic];
        
        
        
    } cancel:^(HXCustomCameraViewController *viewController) {
        
        
    }];
    
    
    
}
- (void)click:(UITapGestureRecognizer *)tap{
    
    NSInteger tag = tap.view.tag;
    
    if (tag == 7) {
        
        [self chooseHead];
        return;
        
    }else if (tag == 6){
        
        [self changeName];
        return;
    }
    
    NSArray *arr = @[@"WLNMineBusinessCtr".instance,@"WLNMineCommunityCtr".instance,@"WLNMineOrderCtr".instance,@"".instance];
    
    [self.navigationController pushViewController:arr[tag] animated:YES];
    
}

/**
 退出登录
 */
- (void)outAction{
    _outLogSheet = [[WMYActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"取消".Intl destructiveButtonTitle:nil otherButtonTitles:@"退出登录".Intl, nil];
    
    [_outLogSheet show];
    
}
/**
 前往子页面
 */
- (void)chooseHead{
    
    _headSheet = [[WMYActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
    
    [_headSheet show];
    
}
- (void)changeName{
    
    weakSelf(self);
    WLNMineEditCtr *vc = [[WLNMineEditCtr alloc]init];
    [vc setDiEditdBack:^{
        
        [weakself.tab reloadData];
        
    }];
    
    [self push:vc];
    
}
- (void)outLog{
    
    
    WLNMainTabBarCtr *tabbar = (WLNMainTabBarCtr *)self.tabBarController;
    
    [tabbar isLog:NO];
    
    [SVProgressHUD showSuccessWithStatus:@"退出成功"];
    
    [self routeTargetName:Handle actionName:@"deleteUserDic"];
    
}
#pragma mark - setter getter

- (HXPhotoManager *)manager
{
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _manager.configuration.openCamera = YES;
        _manager.configuration.deleteTemporaryPhoto = NO;
        _manager.configuration.lookLivePhoto = YES;
        _manager.configuration.saveSystemAblum = NO;
        _manager.configuration.photoMaxNum = 1;
        //        _manager.configuration.supportRotation = NO;
        //        _manager.configuration.cameraCellShowPreview = NO;
        //        _manager.configuration.themeColor = [UIColor redColor];
        _manager.configuration.videoCanEdit = NO;
        _manager.configuration.photoCanEdit = NO;
    }
    return _manager;
}
- (NSArray *)t_p_a_Arr{
    if (!_t_p_a_Arr) {
        
        NSString *str = [NSString stringWithFormat:@"%@?uid=%@",Identity,self.userModel.userid];
        NSString *str1 = [NSString stringWithFormat:@"%@?uid=%@",Security,self.userModel.userid];
        NSString *str2 = [NSString stringWithFormat:@"%@?uid=%@",Payment,self.userModel.userid];
        NSString *str3 = [NSString stringWithFormat:@"%@?uid=%@",ServiceCharge,self.userModel.userid];

        
        _t_p_a_Arr = @[
                       @[@{}],
                       @[@{TK:@"GHB账户".Intl,PK:@"wallet",BK:^{[self push:@"WLNMineGHBWalletCtr".instance];}},
                       @{TK:@"奖励账户".Intl,PK:@"account",BK:^{[self push:@"WLNMineRewardWalletCtr".instance];}},
                       @{TK:@"C2C账户".Intl,PK:@"account",BK:^{[self push:@"WLNMineLawWalletCtr".instance];}},
                       @{TK:@"币币账户".Intl,PK:@"account",BK:^{[self push:@"WLNMineBBWalletCtr".instance];}},
                         @{TK:@"合约账户".Intl,PK:@"contract",BK:^{[self push:@"WLNMineAgreeWalletCtr".instance];}}],
                       
                       @[@{TK:@"扫码赠送".Intl,PK:@"tuiguang",BK:^{[self push:@"WLNMineScavengingCtr".instance];}},
                         @{TK:@"算力挖矿".Intl,PK:@"fenxiang",BK:^{[self push:@"WLNMineExtensionCtr".instance];}}],
                       
                       @[@{TK:@"身份认证".Intl,PK:@"identity",BK:^{[self push:@"WLNHTMLCtr".instance box:str title:@"身份认证"];}},
                         @{TK:@"账户安全".Intl,PK:@"suotou",BK:^{[self push:@"WLNHTMLCtr".instance box:str1 title:@"账户安全"];}},
                         @{TK:@"支付设置".Intl,PK:@"pay",BK:^{[self push:@"WLNHTMLCtr".instance box:str2 title:@"支付设置"];}},
                         @{TK:@"手续费等级".Intl,PK:@"charge",BK:^{[self push:@"WLNHTMLCtr".instance box:str3 title:@"手续费等级"];}}]];
        
    }
    
    return _t_p_a_Arr;
    
}

@end
