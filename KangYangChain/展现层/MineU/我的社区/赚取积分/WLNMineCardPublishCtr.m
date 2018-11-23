//
//  WLNMineCardPublishCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/11.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineCardPublishCtr.h"

@interface WLNMineCardPublishCtr ()
<
HXAlbumListViewControllerDelegate,
UITableViewDelegate,
UITableViewDataSource
>
{
    WLNMineCardPublishPicCell *_picCell;
    WLNMineCardPublishWordCell *_wordCell;
    
}
@property (strong, nonatomic) HXPhotoManager *manager;
@property (nonatomic, strong) NSMutableArray *selectArrs;

@end

@implementation WLNMineCardPublishCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发社区贴".Intl;
    
    _selectArrs = [NSMutableArray array];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.delaysContentTouches = YES;
    [self tabType:1];
    
    [self.tab registerClass:WLNMineCardPublishPicCell.class forCellReuseIdentifier:@"WLNMineCardPublishPicCell"];
    [self.tab registerClass:WLNMineCardPublishWordCell.class forCellReuseIdentifier:@"WLNMineCardPublishWordCell"];
}

- (void)result:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD showSuccessWithStatus:@"发布成功"];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 0 ? 0.1 : 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.layer.masksToBounds = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 7;
    button.showsTouchWhenHighlighted = YES;
    
    button.frame = CGRectMake(DEVICEWidth - 100, 10, 90, 40);
    
    button.backgroundColor = mainblue;
    [button setTitle:@"发布" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(publishAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 100;
    }else{
        CGFloat height = [_picCell jugeHeight:_selectArrs.count] < 100 ? 100 : [_picCell jugeHeight:_selectArrs.count];
        return height;
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self title_tableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self pic_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    
}
- (UITableViewCell *)title_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNMineCardPublishWordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineCardPublishWordCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    _wordCell = cell;
    
    return cell;
    
    
}
- (UITableViewCell *)pic_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLNMineCardPublishPicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNMineCardPublishPicCell"];
    _picCell = cell;
    
    cell.imgArrs = _selectArrs;
    
    cell.forwarder = self;
    
    
   
    
    return cell;
    
}

- (void)addAciton{
    
    NSLog(@"吊起系统相册");
    
    weakSelf(self);
    
    [self hx_presentSelectPhotoControllerWithManager:self.manager didDone:^(NSArray<HXPhotoModel *> *allList, NSArray<HXPhotoModel *> *photoList, NSArray<HXPhotoModel *> *videoList, BOOL isOriginal, UIViewController *viewController, HXPhotoManager *manager) {
    
    } imageList:^(NSArray<UIImage *> *imageList, BOOL isOriginal) {
        
        
        weakself.selectArrs = imageList.mutableCopy;
        [weakself.tab reloadData];
        
        
    } cancel:^(UIViewController *viewController, HXPhotoManager *manager) {
        
    }];
    
    
    
}
- (void)publishAction{
    
    
    if (_selectArrs.count == 0) {
        [SVProgressHUD showErrorWithStatus:@"请选择图片"];
        return;
    }
    if (_wordCell.txtV.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入内容"];
        return;
    }
    
    
    [SVProgressHUD show];
    

    UIImage *image =  _selectArrs.firstObject;
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    dic[@"image1"] = [image zipImage];
    dic[@"content"] = _wordCell.txtV.text;
    
    [self routeTargetName:Handle actionName:@"publishCard:" param:dic];
    
    
}
- (HXPhotoManager *)manager
{
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _manager.configuration.videoMaxNum = 5;
        _manager.configuration.deleteTemporaryPhoto = NO;
        _manager.configuration.lookLivePhoto = YES;
        _manager.configuration.saveSystemAblum = YES;
        //        _manager.configuration.supportRotation = NO;
        //        _manager.configuration.cameraCellShowPreview = NO;
        //        _manager.configuration.themeColor = [UIColor redColor];
        _manager.configuration.videoCanEdit = NO;
        _manager.configuration.photoCanEdit = NO;
    }
    return _manager;
}
@end
