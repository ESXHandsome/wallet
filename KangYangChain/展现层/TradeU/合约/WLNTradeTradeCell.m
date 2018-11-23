//
//  WLNTradeTradeCell.m
//  KangYangChain
//
//  Created by edz on 2018/10/22.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNTradeTradeCell.h"

@implementation WLNTradeTradeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.biTxt addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];
        [self.priceTxt addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];

    }
    return self;
}
- (void)textField1TextChange:(UITextField *)textF{
    
   
    [self changeTotalLab];
    

}

- (void)setLevelDic:(NSMutableDictionary *)levelDic{
    
    _levelDic = levelDic;
    
    self.leverLab.text = levelDic[@"name"];
    
    [self changeTotalLab];
    

}
- (void)changeTotalLab{
    
    NSString *str = _ctypeDic[@"name"];

    if ([str isEqualToString:@"限价单"]) {
        
        self.totalLab.text = [NSString stringWithFormat:@"总金额 %f USDT",self.biTxt.text.floatValue * self.priceTxt.text.floatValue / [_levelDic[@"value"]integerValue]];
    }else{
        
        self.totalLab.text = [NSString stringWithFormat:@"总金额 %f USDT",self.biTxt.text.floatValue * [_dic[@"price"]floatValue] / [_levelDic[@"value"]integerValue]];
    }
    
    
    
}













- (void)setCtypeDic:(NSMutableDictionary *)ctypeDic{
    
    _ctypeDic = ctypeDic;
    
    
    NSString *str = ctypeDic[@"name"];
    
    self.priceView.hidden = [str isEqualToString:@"限价单"] ? NO :YES;
    
    self.ctypeLab.text = str;
    
}
- (void)setDic:(NSMutableDictionary *)dic{
    
    if (dic.allKeys.count == 0) {
        return;
        
    }
    _dic = dic;
    
    self.biLab.text = dic[@"name"];
    

    
}
- (void)setListArr:(NSMutableArray *)listArr{
    if (listArr.count == 0) {
        return;
    }
    _listArr = listArr;
    _listView.delegate = self;
    _listView.dataSource = self;
    _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_listView registerClass:WLNTradeTradeTabCell.class forCellReuseIdentifier:@"WLNTradeTradeTabCell"];
    
    [self.listView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNTradeTradeTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNTradeTradeTabCell"];
    cell.dic2 = self.listArr[indexPath.row];
    cell.colors = [_dic[@"scale"]floatValue] > 0 ? cusgreen : cusred;
    
    return cell;
    
}

@end
