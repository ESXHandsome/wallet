//
//  Network.h
//  vhum
//
//  Created by Ying on 2018/8/10.
//  Copyright © 2018 Ying. All rights reserved.
//

typedef void(^SuccessBlock)(id responseDict);
typedef void(^FailureBlock)(NSInteger errorCode);
typedef void(^ProgressBlock)(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend);

typedef NS_ENUM(NSInteger, NetworkCode) {
    NetworkSuccessCode = 0,                 // 请求成功
    NetworkMissingParametersCode = 2,       // 参数缺失
    NetworkTokenNotFoundCode = 6,           // 用户token不存在
    NetworkTokenDeniedCode = 7,             // 访问拦截，当token为空的时候
    NetworkNotLoginCode = 11,               // 执行操作前，没有登录
    NetworkFrequentRequestsCode = 13,       // 请求频繁
    NetworkNeedReloginThirdpartyCode = 18,  // 需要重新第三方登录
    NetworkAccountRemoteLoginCode = 19,     // 账号在其他设备登录
    NetworkIllegalAccountCode = 20,         // 非法登录
};

static NSString * const XLAlertNetworkNotReachable   = @"网络不可用";
static NSString * const XLAlertNetworkWIFI           = @"您正在wifi网络环境";
static NSString * const XLAlertNetworkWWAN           = @"您正在蜂窝网络环境";
static NSString * const XLAlertRequestTimeout        = @"请求超时";
static NSString * const XLAlertNetworkChanged        = @"已经切换到2G/3G/4G网络，\n请注意您的流量哦";
static NSString * const XLNetworkChangedNotification = @"XLNetworkChangedNotification";
static NSString * const WalletApiValue               = @"4ad937c0-9239-4a0c-a53a-d8c46dc8e11f";
static NSString * const WalletApiKey                 = @"X-CMC_PRO_API_KEY";

#import "NetworkManager.h"

