//
//  WLNTradeAgreeCategoryView.m
//  KangYangChain
//
//  Created by edz on 2018/11/9.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeAgreeCategoryView.h"

@implementation WLNTradeAgreeCategoryView

- (instancetype)initWithArr:(NSArray *)arr{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.titleArrs = arr;
        [self addSubview:self.backView];
        [self addSubview:self.tab];
        
    }
    return self;
}
- (void)show{
    

    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.tab.frame = CGRectMake(DEVICEWidth - 100, 64, 100, DEVICEHEIGHT - 64);

    }];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArrs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ccc"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ccc"];
    }
    cell.textLabel.text = self.titleArrs[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_didClickBLock) {
        _didClickBLock(indexPath.row,self.titleArrs[indexPath.row]);
        
    }
    [self dismissAction];
    
    
}
- (UITableView *)tab{
    if (_tab == nil) {
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(DEVICEWidth, 64, 100, DEVICEHEIGHT - 64) style:UITableViewStyleGrouped];
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tab.backgroundColor = UIColor.whiteColor;
        _tab.delegate = self;
        _tab.dataSource = self;
    }
    return _tab;
    
    
}
- (UIView *)backView{
    if (_backView == nil) {
        
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        _backView.backgroundColor =[UIColor.blackColor colorWithAlphaComponent:0.2];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAction)];
        
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
}
- (void)dismissAction{
    
    [self.backView removeFromSuperview];
    [self.tab removeFromSuperview];
    [self removeFromSuperview];
    
    
    
    
}

@end
