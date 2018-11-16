//
//  RemittanceHomeViewController.h
//  Wallet
//
//  Created by 狮子头 on 2018/11/13.
//  Copyright © 2018 Ying. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RemittanceHomeViewController : UIViewController

@property (strong, nonatomic) UIImage  *image;
@property (strong, nonatomic) NSString *coinString;
@property (strong, nonatomic) NSString *priceString;
@property (strong, nonatomic) NSString *addressString;
@property (strong, nonatomic) NSString *type;

@end

NS_ASSUME_NONNULL_END
