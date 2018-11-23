//
//  WLNTradeAgreeCategoryView.h
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeAgreeCategoryView : UIView<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tab;
@property (nonatomic, strong) NSArray *titleArrs;
@property (nonatomic, strong) UIView *backView;

- (instancetype)initWithArr:(NSArray *)arr;

- (void)show;

@property (nonatomic, strong) void (^didClickBLock)(NSInteger row,NSString *title);


@end

NS_ASSUME_NONNULL_END
