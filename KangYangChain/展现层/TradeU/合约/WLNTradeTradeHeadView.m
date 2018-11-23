//
//  WLNTradeTradeHeadView.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeTradeHeadView.h"

@implementation WLNTradeTradeHeadView

- (void)setDataArrs:(NSMutableArray *)dataArrs{
    
    _dataArrs = dataArrs;
    NSMutableDictionary *dic = dataArrs.firstObject;
    
    [self changePriceLabWithDic:dic];
    
    if ([dic[@"scale"] floatValue] > 0) {
        
        self.priceLab.textColor = cusgreen;
    }else{
        self.priceLab.textColor = cusred;

    }
    
    
    [self.tab reloadData];
    
    
}
- (void)headClickAction:(UITapGestureRecognizer *)tap{
    
    
    CGRect rect = windowFrame(tap.view);
    self.tab.frame = CGRectMake(0, rect.origin.y, DEVICEWidth, 250);
    [self shadow];

    [[UIApplication sharedApplication].keyWindow addSubview:self.backView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.tab];
    
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:kNilOptions animations:^{
        
        self.tab.frame  = CGRectMake(0, rect.origin.y + rect.size.height, DEVICEWidth, 250);

    } completion:nil];
    

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth, 0)];
    view.backgroundColor = maingray;
    
    UILabel *leftLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth / 3, 44)];
    leftLab.text = @"合约";
    leftLab.textAlignment = 1;
    leftLab.font = [UIFont systemFontOfSize:12];
    [view addSubview:leftLab];
    
    UILabel *centerLab = [[UILabel alloc]initWithFrame:CGRectMake(DEVICEWidth / 3, 0, DEVICEWidth / 3, 44)];
    centerLab.text = @"最新价";
    centerLab.textAlignment = 1;
    centerLab.font = [UIFont systemFontOfSize:12];
    [view addSubview:centerLab];
    
    UILabel *rightLab = [[UILabel alloc]initWithFrame:CGRectMake(DEVICEWidth / 3 * 2, 0, DEVICEWidth / 3, 44)];
    rightLab.text = @"24H涨跌幅";
    rightLab.textAlignment = 1;
    rightLab.font = [UIFont systemFontOfSize:12];
    [view addSubview:rightLab];
    
    return view;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNTradeTradeHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeHeadCell"];
    
    cell.dic = self.dataArrs[indexPath.row];
    
    return cell;
    
}
- (void)changePriceLabWithDic:(NSMutableDictionary *)dic{
    
    self.biLab.text = dic[@"name"];

    self.priceLab.text = [NSString stringWithFormat:@"%@/USDT %.2f%%",dic[@"price"],[dic[@"scale"]floatValue]];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableDictionary *dic = self.dataArrs[indexPath.row];
    
    [self changePriceLabWithDic:dic];

    [self dissAction];
    
    if (_didClickBlock) {
        _didClickBlock(dic);
        
    }
}
- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tab.delegate = self;
        _tab.dataSource = self;
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tab registerClass:WLNTradeTradeHeadCell.class forCellReuseIdentifier:@"WLNTradeTradeHeadCell"];
        
        
    }
    return _tab;
}
- (UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.1];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dissAction)];
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
}

- (void)dissAction{
    
    
    [self.backView removeFromSuperview];
    [self.tab removeFromSuperview];
    
    
    
}

@end
