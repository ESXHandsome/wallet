//
//  WLNRSendMoneyCell.h
//  KangYangChain
//
//  Created by edz on 2018/10/23.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNRSendMoneyCell : FlexBaseTableCell

@property (nonatomic, strong) UILabel *typeLab;
@property (nonatomic, strong) UITextField *addressTxt;
@property (nonatomic, strong) UITextField *numTxt;
@property (nonatomic, strong) UITextField *codeTxt;
@property (nonatomic, strong) UITextField *pwdTxt;
@property (nonatomic, strong) UILabel *serviceLab;
@property (nonatomic, strong) UILabel *canUseLab;



@end

NS_ASSUME_NONNULL_END
