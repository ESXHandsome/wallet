//
//  WLNTradeBBOpenView.m
//  KangYangChain
//
//  Created by edz on 2018/10/25.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeBBOpenView.h"

@implementation WLNTradeBBOpenView

- (instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        
        
        self.leftDataArr = [NSMutableArray array];
        self.rightDataArr = [NSMutableArray array];
        self.leftTab.delegate = self;
        self.leftTab.dataSource = self;
        self.leftTab.separatorStyle =UITableViewCellSeparatorStyleNone;
        
        self.rightTab.delegate = self;
        self.rightTab.dataSource = self;
        
        [self.leftTab registerClass:WLNTradeBBOpenLeftCell.class forCellReuseIdentifier:@"WLNTradeBBOpenLeftCell"];
        [self.rightTab registerClass:WLNTradeBBOpenRightCell.class forCellReuseIdentifier:@"WLNTradeBBOpenRightCell"];
        
        
        
        
        
        self.leftDataArr = [WLNSingle shared].bListArr;
        
        NSMutableDictionary *dic = @{}.mutableCopy;
        
        dic[@"coin"] = self.leftDataArr.firstObject[@"english_name_abb"];
        
        [self routeTargetName:Handle actionName:@"getCion:" param:dic];
        
        
    }
    return self;
    
}

- (void)result:(id)data sel:(NSString *)sel{
    
    if ([sel isEqualToString:@"getCion:"]){
        
        self.rightDataArr = data;
        [self.rightTab reloadData];

        if (_didRequstFinish) {
            _didRequstFinish(self.rightDataArr.firstObject);
        }
        
    }
    
    
}
- (void)faild:(id)data sel:(NSString *)sel{
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.leftTab) {
        return self.leftDataArr.count;
    }
    return self.rightDataArr.count;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.leftTab) {
        return [self l_tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return [self r_tableView:tableView cellForRowAtIndexPath:indexPath];
    
}
- (UITableViewCell *)l_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeBBOpenLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBOpenLeftCell"];
    cell.dic = self.leftDataArr[indexPath.row];
    
    cell.backView.backgroundColor = indexPath.row == _currentLeftIndex ? UIColor.whiteColor: maingray;
    
    return cell;
    
}

- (UITableViewCell *)r_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeBBOpenRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeBBOpenRightCell"];
    cell.dic  = self.rightDataArr[indexPath.row];
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTab) {
    
        
        _currentLeftIndex = indexPath.row;
        
        [self.leftTab reloadData];
        
        [self getmarketWith:indexPath];
        
    }else{
        
        if (_didChooseBlock) {
            
            
            _didChooseBlock(self.rightDataArr[indexPath.row]);
            [self dismiss];
            
            
        }
        
    }
    
}
- (void)getmarketWith:(NSIndexPath *)index{
    
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    dic[@"coin"] = self.leftDataArr[index.row][@"english_name_abb"];
    
    [self routeTargetName:Handle actionName:@"getCion:" param:dic];
    
}
- (void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.backView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    self.frame = CGRectMake(0, self.lastRect.origin.y, DEVICEWidth, 300);
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:kNilOptions animations:^{
        
        self.frame = CGRectMake(0, self.lastRect.origin.y + self.lastRect.size.height, DEVICEWidth, 300);

        self.backView.alpha = 1;

        
    } completion:nil];
  
}
- (void)dismiss{
    
    [self.backView removeFromSuperview];
    [self removeFromSuperview];
    
    
}
- (UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.1];
        _backView.alpha = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
}
@end
