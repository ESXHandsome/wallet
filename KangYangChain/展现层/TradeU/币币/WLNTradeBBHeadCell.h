//
//  WLNTradeBBHeadCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeBBHeadCell : FlexBaseTableCell<UITableViewDelegate,UITableViewDataSource,WLNFloatViewDelegate,WLNReqstProtocol>
{
    NSString *_xian;
    NSInteger _isbuy;
    NSArray *_buyArr;
    NSArray *_sellArr;
    NSInteger _xianTag;
    
    
}
@property (nonatomic, strong) NSString *chooseBi;
@property (nonatomic, assign) NSInteger xianTag;

@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UITextField *priceTxt;
@property (nonatomic, strong) UITextField *numTxt;



@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSMutableArray *redDataArr;
@property (nonatomic, strong) NSMutableArray *greenDataArr;


@property (nonatomic, strong) WLNTradeBBOpenView *openView;

@property (nonatomic, strong) UIView *buyView;
@property (nonatomic, strong) UIView *sellView;

@property (nonatomic, strong) UILabel *buyLab;
@property (nonatomic, strong) UILabel *sellLab;
@property (nonatomic, strong) UILabel *xianLab;
@property (nonatomic, strong) UILabel *shijiaLab;



@property (nonatomic, strong) UILabel *buySellBigLab;
@property (nonatomic, strong) UILabel *buySellBiBigLab;


@property (nonatomic, strong) UIView *doneView;

@property (nonatomic, strong) NSMutableDictionary *reqDic;

@property (nonatomic, strong) void (^didBackDicBlock)(NSMutableDictionary *dic,NSInteger isbuy); //0 买入 1 卖出

@property (nonatomic, strong) UILabel *canUserLab;
@property (nonatomic, strong) UILabel *canBuyLab;

@property (nonatomic, strong) UILabel *priceLab; //右上角上方
@property (nonatomic, strong) UILabel *dollarLab; //右上角下方

@property (nonatomic, strong) UILabel *riseLab; //最右侧

@property (nonatomic, strong) UIImageView *kaxianImg;


@property (nonatomic, strong) UIView *shijiaView;
@property (nonatomic, strong) UIView *priceView;


@property (nonatomic, strong) UILabel *priceWordLab;
@property (nonatomic, strong) UILabel *numWordLab;





@end

NS_ASSUME_NONNULL_END
