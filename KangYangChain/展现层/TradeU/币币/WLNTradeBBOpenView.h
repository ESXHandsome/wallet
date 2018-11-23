//
//  WLNTradeBBOpenView.h
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNTradeBBOpenView : FlexCustomBaseView<UITableViewDataSource,UITableViewDelegate,WLNReqstProtocol>
{
    NSInteger _currentLeftIndex;
    
}
@property (nonatomic, strong) UITableView *leftTab;
@property (nonatomic, strong) UITableView *rightTab;

@property (nonatomic, strong) NSMutableArray *leftDataArr;
@property (nonatomic, strong) NSMutableArray *rightDataArr;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, assign) CGRect lastRect;

@property (nonatomic, strong) void (^didChooseBlock)(NSMutableDictionary *dic);

@property (nonatomic, strong) void (^didRequstFinish) (NSMutableDictionary *dic);

- (void)show;



@end

NS_ASSUME_NONNULL_END
