//
//  WLNShopChangeCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/8.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNShopChangeCtr.h"

@interface WLNShopChangeCtr ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collect;

@end

@implementation WLNShopChangeCtr

- (UICollectionView *)collect{
    if (_collect == nil) {
        _collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth ,DEVICEHEIGHT-64) collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collect.backgroundColor = UIColor.whiteColor;
        
    }
    return _collect;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"兑换商品".Intl;
    
    self.collect.delegate = self;
    self.collect.dataSource = self;
    [self.view addSubview:self.collect];
    
    [self.collect registerClass:WLNShopItemCell.class forCellWithReuseIdentifier:@"WLNShopItemCell"];

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //四周边距
    return UIEdgeInsetsMake(10, 10  , 10,10);
}
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake((DEVICEWidth - 30) / 2, 190);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNShopItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLNShopItemCell" forIndexPath:indexPath];
    
    
    return cell;
}

@end
