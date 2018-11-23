//
//  WLNWalletDetailCtr.m
//  WLNBiWallet
//
//  Created by furao on 2018/10/5.
//  Copyright © 2018年 furao. All rights reserved.
//
#define kUncompressedPrivateKeyPrefix @"5"
#define kCompressedHexSuffix @"01"

#import "WLNWalletDetailCtr.h"
#import <BTPeerManager.h>

@interface WLNWalletDetailCtr ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tab;

@property (nonatomic, strong) NSString *address;

@end

@implementation WLNWalletDetailCtr

- (UITableView *)tab{
    
    if(_tab == nil){
        
        _tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tab.delegate = self;
        _tab.dataSource = self;
        
    }
    return _tab;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BTC";
    
    [self.view addSubview:self.tab];
    
    WLNWalletDetailHeadView *view = [[WLNWalletDetailHeadView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    self.tab.tableHeaderView = view;
    
    [self.tab registerClass:WLNWalletDetailCell.class forCellReuseIdentifier:@"WLNWalletDetailCell"];
    
    /**
     
     查询交易记录
     */
//    [BTCWrapper getTxlistWithAddress:@"" withPage:1 block:^(NSArray *array, BOOL suc) {
//        
//        
//    }];
    
    
//
//    NSArray *titleArr = @[@"生成私钥",@"导入私钥",@"生成助记词",@"查询余额",@"发送",@"接收"];
//
//    NSArray *classArrs = @[NSStringFromSelector(@selector(siyao)),
//                           NSStringFromSelector(@selector(daorusiyao)),
//                           NSStringFromSelector(@selector(zhujici)),
//                           NSStringFromSelector(@selector(chaxunyue)),
//                           NSStringFromSelector(@selector(fasong)),
//                           NSStringFromSelector(@selector(jieshou))];
//
//
//
//    for (int i = 0; i < classArrs.count; i++) {
//
//        UIButton *button  = [UIButton buttonWithType:UIButtonTypeSystem];
//        [button setTitle:titleArr[i] forState:UIControlStateNormal];
//        button.frame = CGRectMake(0, i * 50 + 100, 100, 50);
//        button.backgroundColor = [UIColor redColor];
//        [self.view addSubview:button];
//        button.tag = i;
//
//        SEL s = NSSelectorFromString(classArrs[i]);
//
//        [button addTarget:self action:s forControlEvents:UIControlEventTouchUpInside];
//
//
//    }

    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"最近的三条记录";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLNWalletDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLNWalletDetailCell"];
    return cell;
    
    
}

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//- (void)siyao{
//    
//    XRandom *xrandom = [[XRandom alloc] initWithDelegate:self];
//
//    NSData *data = [xrandom randomWithSize:32];
//    
//    NSMutableArray *addresses = [NSMutableArray new];
//
//    if (data) {
//        BTKey *key = [BTKey keyWithSecret:data compressed:YES];
//        key.isFromXRandom = YES;
//        
//       
//        NSString *privateKeyString = [BTPrivateKeyUtil getPrivateKeyString:key passphrase:@"123456"];
//      
//        
//        BTAddress *btAddress = [[BTAddress alloc] initWithKey:key encryptPrivKey:privateKeyString isSyncComplete:YES isXRandom:YES];
//        [addresses addObject:btAddress];
//
//        
//    }
//
//    BTAddress *btAddress = addresses.firstObject;
//    
//    self.address = btAddress.address;
//    
//    NSLog(@"%@",self.address);
////
////    NSArray *arr = addresses.reverseObjectEnumerator.allObjects;
////    for (BTAddress *btAddress in arr) {
////        if (![[[BTAddressManager instance] privKeyAddresses] containsObject:btAddress] && ![[[BTAddressManager instance] watchOnlyAddresses] containsObject:btAddress]) {
////            [[BTAddressManager instance] addAddress:btAddress];
////            self.address = btAddress.address;
////            NSLog(@"%@",self.address);
////
////
////        }
////    }
//
//    
//}
//- (void)daorusiyao{
//
//    BTKey *key = [BTKey keyWithPrivateKey:self.address];
//    BTKey *uncompressedKey;
//    BTKey *compressedKey;
//    NSString *privateKey = key.privateKey;
//    if ([privateKey hasPrefix:kUncompressedPrivateKeyPrefix]) {
//        uncompressedKey = [BTKey keyWithPrivateKey:privateKey];
//        NSString *compressedHex = [NSString stringWithFormat:@"%@%@", [privateKey base58checkToHex], kCompressedHexSuffix];
//        compressedKey = [BTKey keyWithPrivateKey:[compressedHex hexToBase58check]];
//    } else {
//        compressedKey = [BTKey keyWithPrivateKey:privateKey];
//        NSString *compressedHex = [privateKey base58checkToHex];
//        NSString *uncompressedHex = [compressedHex substringToIndex:compressedHex.length - kCompressedHexSuffix.length];
//        uncompressedKey = [BTKey keyWithPrivateKey:[uncompressedHex hexToBase58check]];
//    }
//
//    [self addKey:key];
//
//
//}
//- (void)addKey:(BTKey *)key {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        BTAddress *address;
////        if (self.importPrivateKeyType == BitherQrcode) {
////            NSString *encryptKey = [BTQRCodeUtil replaceNewQRCode:self.content];
////            address = [[BTAddress alloc] initWithKey:key encryptPrivKey:encryptKey isSyncComplete:NO isXRandom:key.isFromXRandom];
////        } else {
//            NSString *encryptKey = [BTPrivateKeyUtil getPrivateKeyString:key passphrase:@"123456"];
//            if (encryptKey != nil) {
//                address = [[BTAddress alloc] initWithKey:key encryptPrivKey:encryptKey isSyncComplete:NO isXRandom:key.isFromXRandom];;
//            }
////        }
//        if (address) {
//            [[BTPeerManager instance] stop];
//
//            [[BTAddressManager instance] addAddress:address];
//
//            [[BTPeerManager instance] start];
//
//        }
////            else {
////            dispatch_async(dispatch_get_main_queue(), ^{
////                [self exit];
////                [self showMsg:NSLocalizedString(@"Import failed.", nil)];
////            });
////        }
//    });
//
//
//}
//- (void)chaxunyue{
//
//    [[BTPeerManager instance] stop];
//
//    NSMutableArray *arr =   [[BTAddressManager instance] privKeyAddresses];
//
//    BTAddress *address = arr.firstObject;
//
//
//    [[BTPeerManager instance] start];
//
//    NSLog(@"%@",address.balance);
//
//
//
//}
//- (void)fasong{
//
//}
//- (void)jieshou{
//
//}
//- (void)zhujici{
//
//
//
//}



@end
