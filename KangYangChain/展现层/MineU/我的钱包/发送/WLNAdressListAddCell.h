//
//  WLNAdressListAddCell.h
//  KangYangChain
//
//  Created by edz on 2018/11/17.
//  Copyright © 2018 furao. All rights reserved.
//

#import "FlexBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLNAdressListAddCell : FlexBaseTableCell


@property (nonatomic, strong) UILabel *bTypeLab;

@property (nonatomic, strong) UITextField *remarkTxt;
@property (nonatomic, strong) UITextField *addressTxt;

@property (nonatomic, strong) UITextField *phoneTxt;
@property (nonatomic, strong) UITextField *codeTxt;

@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
