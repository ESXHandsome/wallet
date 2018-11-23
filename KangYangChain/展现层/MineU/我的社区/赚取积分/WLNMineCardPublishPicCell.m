//
//  WLNMineCardPublishPicCell.m
//  KangYangChain
//
//  Created by edz on 2018/11/6.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNMineCardPublishPicCell.h"
#define ItemSizeWith (DEVICEWidth-80)/3

@implementation WLNMineCardPublishPicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.collet];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgArrs.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNMineCardItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WLNMineCardItemCell" forIndexPath:indexPath];
    cell.forwarder = self;
    
    
    UIImage *image = self.imgArrs[indexPath.row];
    
    cell.img.image = image;
    
    
    if (indexPath.row == self.imgArrs.count) {

        cell.addBtn.hidden = NO;

//        cell.isAdd = YES;
//
    }else{
        cell.addBtn.hidden = YES;
//
//        ZLSelectPhotoModel *model = self.imgArrs[indexPath.item];
//
//        if ([model isKindOfClass:[UIImage class]]) {
//
//            cell.headWallImg.image = (UIImage *)model;
//
//        }else{
//
//            cell.headWallImg.image = model.smallImage;
//        }
//        cell.isAdd = NO;
    }
    
    
    
    return cell;
    
    
}
- (void)setImgArrs:(NSMutableArray *)imgArrs{
    _imgArrs = imgArrs;
    self.collet.frame =  CGRectMake(10, 0, DEVICEWidth - 20, [self jugeHeight:imgArrs.count]);
    [self.collet reloadData];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (_imgArrs.count <= 9) {
//
//        if (_didSelect) {
//            _didSelect(indexPath.row);
//        }
//    }
//
    
}
- (CGFloat)jugeHeight:(NSInteger)count{
    
    if (count + 1 <= 3) {
        return ItemSizeWith+10;
    }
    CGFloat height = (count + 1) % 3 > 0 ?  (count + 1) / 3 *(ItemSizeWith + 10)  + ItemSizeWith + 20: (count + 1) / 3 *(ItemSizeWith + 10) + 20;
    return height ;
    
}
-  (UICollectionView *)collet{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(ItemSizeWith, ItemSizeWith);
    
    
    if (_collet == nil) {
        _collet = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flow];
        _collet.delegate = self;
        _collet.dataSource = self;
        _collet.backgroundColor = UIColor.clearColor;
        [_collet registerClass:WLNMineCardItemCell.class forCellWithReuseIdentifier:@"WLNMineCardItemCell"];
        
        
        
    }
    return _collet;
}


@end
