//
//  WLNMineGLiveCtr.m
//  KangYangChain
//
//  Created by furao on 2018/10/10.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNMineGLiveCtr.h"

@interface WLNMineGLiveCtr ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collect;

@end

@implementation WLNMineGLiveCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"聊天室".Intl;
    self.collect.delegate = self;
    self.collect.dataSource = self;
    
    [self.collect registerClass:WLNMineGLiveCell.class forCellWithReuseIdentifier:@"WLNMineGLiveCell"];
    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

 
    return 10;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    WLNMineGLiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLNMineGLiveCell" forIndexPath:indexPath];
    
    return cell;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //四周边距
    return UIEdgeInsetsMake(10, 10  , 10,10);
}
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((DEVICEWidth - 40) / 2, 180);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:@"8001" conversationType:EMConversationTypeChat];
//    
//    
//    [self.navigationController pushViewController:chatController animated:YES];
//    
    
    
    
}
@end
