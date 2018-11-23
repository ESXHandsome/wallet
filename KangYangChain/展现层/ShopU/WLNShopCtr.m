//
//  WLNShopCtr.m
//  KangYangChain
//
//  Created by furao on 2018/9/27.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNShopCtr.h"

@interface WLNShopCtr ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collect;
@end

@implementation WLNShopCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商城".Intl;
    
    
    
//    WLNHTMLCtr *vc = [[WLNHTMLCtr alloc]initWithData:@"http://kylvue.cpyu8.com/shop/mobile"];
//    
//    [self push:vc];
    
    
    
    
    
//    self.collect.delegate = self;
//    self.collect.dataSource = self;
//    [self.view addSubview:self.collect];
//
//    [self.collect registerClass:WLNShopItemCell.class forCellWithReuseIdentifier:@"WLNShopItemCell"];
//    [self.collect registerClass:WLNShopIntegralCell.class forCellWithReuseIdentifier:@"WLNShopIntegralCell"];
//    [self.collect registerClass:WLNShopADView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WLNShopADView"];
//
//    [self.collect registerClass:WLNShopSectionHeadView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WLNShopSectionHeadView"];

    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            
            WLNShopADView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WLNShopADView" forIndexPath:indexPath];
            return headerView;
            
        }else{
            WLNShopSectionHeadView *sectionHeadView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WLNShopSectionHeadView" forIndexPath:indexPath];
            sectionHeadView.lab.text= @[@"GHB兑换",@"积分兑换",@"购买"][indexPath.section - 1];
            
            return sectionHeadView;
            
            
            
        }
        
        
        

    }
    return [[UICollectionReusableView alloc]init];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(DEVICEWidth - 20, section == 0 ? 150 : 40);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{

    return UIEdgeInsetsMake(10, 10 , 10,10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(DEVICEWidth, 100);
    }
    return CGSizeMake((DEVICEWidth - 30) / 2, 190);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return section == 0 ? 1 : 10;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0)
        
    return [self top_collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    return [self bottom_collectionView:collectionView cellForItemAtIndexPath:indexPath];
    

    
}
- (__kindof UICollectionViewCell *)top_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNShopIntegralCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLNShopIntegralCell" forIndexPath:indexPath];
    [cell.headImg sd_setImageWithURL:self.userModel.avatar.url];
    
    weakSelf(self);
    
    [cell setDidClick:^(NSInteger tag) {
       

        if (tag == 1) {

            [weakself.navigationController pushViewController:@"WLNShopBuyHBGCtr".instance animated:YES];

        }else{

            [weakself.navigationController pushViewController:@"WLNShopChangeCtr".instance animated:YES];

        }
        
    }];
    return cell;
}




- (__kindof UICollectionViewCell *)bottom_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNShopItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLNShopItemCell" forIndexPath:indexPath];
    
    
    weakSelf(self);
    
    [cell setDidClickExBlock:^{
        
        [SVProgressHUD showErrorWithStatus:@"功能开发中"];

//        [weakself exChangeAction];
        
        
    }];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [SVProgressHUD showErrorWithStatus:@"功能开发中"];
}
- (void)exChangeAction{
    
    WLNShopAlertView *view = [WLNShopAlertView shared];
    [view show];
    
  
}
- (UICollectionView *)collect{
    if (_collect == nil) {
        _collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth ,DEVICEHEIGHT - 64) collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collect.backgroundColor = UIColor.whiteColor;
        
    }
    return _collect;
}
@end
