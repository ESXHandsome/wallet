//
//  WLNMineCardPublishPicCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/6.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNMineCardPublishPicCell : UITableViewCell
<UICollectionViewDelegate,
UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *imgArrs;

@property (nonatomic, strong) UICollectionView *collet;

- (CGFloat)jugeHeight:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
