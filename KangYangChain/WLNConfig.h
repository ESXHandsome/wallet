
//
//  WLNConfig.h
//  KangYangChain
//
//  Created by furao on 2018/10/13.
//  Copyright © 2018年 furao. All rights reserved.
//

#ifndef WLNConfig_h
#define WLNConfig_h

#define Handle @"WLNHandle"

#define HolderImage [UIImage imageNamed:@"default_200-200"]

#define DEVICEWidth [UIScreen mainScreen].bounds.size.width  //设备尺寸
#define DEVICEHEIGHT [UIScreen mainScreen].bounds.size.height  //设备尺寸

#define maingray rgba(245,245,245,1)
#define mainblue rgba(30,37,61,1)
#define cusgreen rgba(41,185,114,1)
#define cusred rgba(246,102,99,1)

#define rgba(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a] //宏定义颜色
#define weakSelf(type)  __weak typeof(type) weak##type = type
/*
 回到主线程
 */
#define DISPATCH_MAIN(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock)
/*
 创建子线程
 */
#define DISPATCH_CHILD(childQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),childQueueBlock)

#define BI_TITLE_ARR  [WLNSingle shared].bnameListArr

#define BANLANCE_ACTION(a) [NSString stringWithFormat:@"get%@Balance:",a]

#define URLS @"fdsjfklsadjfkldsajfkdlsafjdkslafjksdlafjsdl"

#define PRAMAS @"fjkdlsafudisofuiosdufiodsuiafodsufiojkljkljkl"

#define OrderStatusArr  @[@"匹配中",@"交易中",@"完成",@"冻结",@"可卖出",@"去支付",@"收益中"]

#define PayTypeArr @[@"银行卡",@"支付宝",@"微信"]

#define PayTypeImgArr @[@"Bank_card",@"zfb",@"WeChat"]

#define windowFrame(a) [a convertRect:a.bounds toView:[UIApplication sharedApplication].delegate.window]

#define DISPATH_AFTER(a,afterBlock) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(a * NSEC_PER_SEC)), dispatch_get_main_queue(),afterBlock);

#define ALERT_MSG(msg) static UIAlertView *alert; alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[alert show];\


#define TK @"cell_title"
#define PK @"cell_picture"
#define BK @"cell_block"

#endif /* WLNConfig_h */
