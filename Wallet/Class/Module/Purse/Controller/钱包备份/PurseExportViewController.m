//
//  PurseExportViewController.m
//  Wallet
//
//  Created by 狮子头 on 2018/11/6.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "PurseExportViewController.h"
#import "PurseExportViewCell.h"
#import "PursePrivateKeyViewController.h"
#import "UserConfigManager.h"
#import "PurseExportModel.h"
#import "PassValueName.h"
@interface PurseExportViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) PurseExportModel *viewModel;
@property (strong, nonatomic) NSDictionary *dicName;

@end

@implementation PurseExportViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self drawUI];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PurseExportViewCell *cell = (PurseExportViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"PurseExportViewCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0) {
        [cell cornerRadius:top];
    } else {
        [cell cornerRadius:bottom];
    }
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //indexPath 该参数中 存着 分区号 和 行号
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.row == 0){
        PursePrivateKeyViewController *controller = [[PursePrivateKeyViewController alloc] init];
        NSMutableDictionary *dict =[[NSMutableDictionary alloc]init];
        [dict setValue:self.model.btc_address forKey:@"ADDRESS"];
        [dict setValue:self.model.btc_privateKey forKey:@"PRIVATE_KEY"];
        [PassValueName shareInstanc].walletDic=dict;
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        PursePrivateKeyViewController *controller = [[PursePrivateKeyViewController alloc] init];
        NSMutableDictionary *dict =[[NSMutableDictionary alloc]init];
        [dict setValue:self.model.eth_address forKey:@"ADDRESS"];
        [dict setValue:self.model.eth_privateKey forKey:@"PRIVATE_KEY"];
        [PassValueName shareInstanc].walletDic=dict;
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptHeight1334(58*2);
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView=[[UITableView alloc ]init];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = UIView.new;
        [_tableView registerClass:PurseExportViewCell.class forCellReuseIdentifier:@"PurseExportViewCell"];
    }
    return _tableView;
}

-(void)drawUI {
    
    [self.view addSubview:self.tableView];
     self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
}

- (PurseExportModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[PurseExportModel alloc] init];
    }
    return _viewModel;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
