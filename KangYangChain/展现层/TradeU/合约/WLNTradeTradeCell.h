//
//  WLNTradeTradeCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeTradeCell : FlexBaseTableCell<UITableViewDelegate,UITableViewDataSource>



@property (nonatomic, strong) UITextField *priceTxt;
@property (nonatomic, strong) UIView *priceView;

@property (nonatomic, strong) UITextField *biTxt;

@property (nonatomic, strong) UILabel *biLab;

@property (nonatomic, strong) UITextField *maxTxt;
@property (nonatomic, strong) UITextField *minTxt;


@property (nonatomic, strong) UILabel *ctypeLab;
@property (nonatomic, strong) UILabel *leverLab;

@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSMutableArray *listArr;

@property (nonatomic, strong) UILabel *totalLab;
@property (nonatomic, strong) UILabel *availableLab;

@property (nonatomic, strong) NSMutableDictionary * levelDic;;

@property (nonatomic, strong) NSMutableDictionary * ctypeDic;;


@property (nonatomic, strong) NSMutableDictionary *dic;




@end

NS_ASSUME_NONNULL_END
