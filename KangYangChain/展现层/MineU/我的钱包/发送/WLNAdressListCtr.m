//
//  WLNAdressListCtr.m
//  KangYangChain
//
//  Created by edz on 2018/11/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNAdressListCtr.h"

@interface WLNAdressListCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WLNAdressListCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提现地址";
    self.dataArr = [NSMutableArray array];
    
    self.tab.delegate = self;
    self.tab.dataSource = self;
    [self tabType:1];
    
    [self.tab registerClass:WLNAdressCell.class forCellReuseIdentifier:@"WLNAdressCell"];
    
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:@"add".image style:UIBarButtonItemStyleDone target:self action:@selector(addAction)];
    
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self routeTargetName:Handle actionName:@"propertyAddressList:"];

}
- (void)addAction{
    
    
    [self push:@"WLNAdressListAddCtr".instance];
    
}
- (void)result:(id)data sel:(NSString *)sel{
 
    
    self.dataArr = data[@"data"];
    [self.tab reloadData];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WLNAdressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNAdressCell"];
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_didAddressBlock) {
        _didAddressBlock(@"1");
        
    }
    
}



@end
