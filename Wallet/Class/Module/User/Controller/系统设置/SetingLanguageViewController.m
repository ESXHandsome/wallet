//
//  SetingLanguageViewController.m
//  Wallet
//
//  Created by 谷澍 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "SetingLanguageViewController.h"
#import "SystemsettingsBaseCell.h"
#import "ZBLocalized.h"
#import "RootViewController.h"
#define defaultTag 1990
@interface SetingLanguageViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSArray *totleArray;
@property (strong, nonatomic) UIView * tfBackView;
@property (nonatomic, assign) NSInteger btnTag;//默认选中的Tag

@end

@implementation SetingLanguageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithString:@"#FBFBFB"];
    
    self.totleArray = @[@"简体中文",@"English"];
    NSString * Language =  [[NSUserDefaults standardUserDefaults] objectForKey:@"Language"];
    for (int i=0; i<self.totleArray.count; i++) {
        if([Language isEqualToString:self.totleArray[i]]){
            self.btnTag =defaultTag +i;
        }
    }
   
    
    
//    self.btnTag = defaultTag+1; //self.btnTag = defaultTag+1  表示默认选择第二个，依次类推
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(adaptHeight1334(10.5*2)+NAVIGATION_BAR_HEIGHT);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(adaptHeight1334(93*2));
    }];
    [self addRightBtn];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /**隐藏导航栏*/
    self.navigationController.navigationBar.hidden = NO;
    [UIApplication sharedApplication].statusBarStyle = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.totleArray.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    SystemsettingsBaseCell *customCell = [[SystemsettingsBaseCell alloc] init];
    customCell.titleLabel.text = self.totleArray[indexPath.row];
    customCell.selectBtn.tag = defaultTag+indexPath.row;
    if (customCell.selectBtn.tag == self.btnTag) {
        customCell.isSelect = YES;
        [customCell.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
    }else{
        customCell.isSelect = NO;
        [customCell.selectBtn setImage:[UIImage imageNamed:@"unSelect_btn"] forState:UIControlStateNormal];
    }
    __weak SystemsettingsBaseCell *weakCell = customCell;
    [customCell setQhxSelectBlock:^(BOOL choice,NSInteger btnTag){
        if (choice) {
            [weakCell.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
            self.btnTag = btnTag;
            NSLog(@"$$$$$$%ld",(long)btnTag);
            [self.tableView reloadData];
        }
        else{
            //选中一个之后，再次点击，是未选中状态，图片仍然设置为选中的图片，记录下tag，刷新tableView，这个else 也可以注释不用，tag只记录选中的就可以
            [weakCell.selectBtn setImage:[UIImage imageNamed:@"selected_btn"] forState:UIControlStateNormal];
            self.btnTag = btnTag;
            [self.tableView reloadData];
            NSLog(@"#####%ld",(long)btnTag);
        }
    }];
    
    
    
    [customCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  customCell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"选择了%ld行",(long)indexPath.row);
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return adaptWidth750(46*2);
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.frame;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}


- (void)addRightBtn {
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)onClickedOKbtn {
  
    if ( self.btnTag == 1990) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"简体中文" forKey:@"Language"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
         [[ZBLocalized sharedInstance]setLanguage:@"zh-Hans"];
      
    }else {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"English" forKey:@"Language"];
        [[NSUserDefaults standardUserDefaults] synchronize];
         [[ZBLocalized sharedInstance]setLanguage:@"en"];
    }
    
    [self initRootVC];
}

- (void)initRootVC{
    RootViewController *tab=[[RootViewController alloc]init];
   
    [self dismissViewControllerAnimated:YES completion:^{
        [UIApplication sharedApplication].keyWindow.rootViewController = tab;
    }];
    NSLog(@"切换abc");
}
    
 

- (UIView *)tfBackView {
    if (!_tfBackView) {
        _tfBackView = [UIView new];
        _tfBackView.backgroundColor = [UIColor whiteColor];
    }
    return _tfBackView;
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
