//
//  WalletInformationViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "WalletInformationViewController.h"
#import "WalletInformationTableViewCell.h"
@interface WalletInformationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;


@end

@implementation WalletInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}
- (void)configUI {
    
    self.view.backgroundColor=[UIColor whiteColor];
    /**配置视图*/
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(adaptWidth750(17*2));
        make.top.mas_offset(adaptHeight1334(10*2));
        make.width.mas_offset(adaptWidth750(358*2));
        make.height.mas_offset(adaptHeight1334(46*16));
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
    NSInteger sectionNum = indexPath.section;
    NSInteger rowNum = indexPath.row;
    NSLog(@"点中了 第%ld个分区 的 第%ld行", sectionNum, rowNum);
    
    //获取 选中行 对应 cell 对象
    UITableViewCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"点中行的 内容 %@", selectCell.textLabel.text);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    if (section == 0) {
        return 3;
    } else {
        return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
   
    WalletInformationTableViewCell *cell = (WalletInformationTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"WalletInformationTableViewCell" forIndexPath:indexPath];
  
 
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
             [cell cornerRadius:top];
              cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if(indexPath.row ==1){
            
             [cell cornerRadius:medium];
        }else{
             [cell cornerRadius:next];
              cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    }else{
        
        if (indexPath.row == 1) {
            [cell cornerRadius:bottom];
        }else {
            
            [cell cornerRadius:bottom];
        }
        
    }
    
    
    return cell;
    


 
}

//设置分区尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0 && indexPath.row==0) {
         return adaptWidth750(70*2);
    }else{
    return adaptWidth750(46*2);
    }
}

#pragma mark -
#pragma mark - Lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.frame;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.scrollEnabled = NO;
        self.tableView.sectionHeaderHeight = 10;
        
        self.tableView.sectionFooterHeight = 10;
        [_tableView registerClass:WalletInformationTableViewCell.class forCellReuseIdentifier:@"WalletInformationTableViewCell"];
    }
    return _tableView;
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
