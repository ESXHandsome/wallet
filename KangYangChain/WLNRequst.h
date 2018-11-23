//
//  WLNRequst.h
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//




//#define Address_Domain "http://kyl.wlnxx.top"

#define Address_Domain "http://kylvue.cpyu8.com"

#define BaseUrl Address_Domain"/adminServer/public/index.php/"


/***
 HTML
 
 */

#define Identity @"http://kylvue.cpyu8.com/#/mine/identity"
#define Security @"http://kylvue.cpyu8.com/#/mine/security"
#define Payment @"http://kylvue.cpyu8.com/#/mine/payment"
#define ServiceCharge @"http://kylvue.cpyu8.com/#/mine/service-charge"
/**
 商城
 */
#define ShopURL @"http://kylvue.cpyu8.com/shop/mobile"


#define Getcode  @BaseUrl"/index/login/send_verification_code"

#define Register @BaseUrl"/index/login/register"

#define ForGet @BaseUrl"/index/login/forget"

#define Logurl @BaseUrl"/index/login/login"

#define fdsfdsf @BaseUrl"/index/login/test_login"

#define BuyInfo @BaseUrl"/index/match/buyinfo.html"

#define BuyGHB @BaseUrl"/index/match/buy"



#define MatchList @BaseUrl"/index/match/list"

#define MatchInfo @BaseUrl"/index/match/info"

#define LockAction @BaseUrl"/index/ghb/lock_order" //执行锁仓

#define LockcConfig @BaseUrl"/index/ghb/config"  //锁仓配置

#define LockList @BaseUrl"/index/ghb/lock_index"  //锁仓列表

#define PayGHB @BaseUrl"/index/match/pay"  //排单支付

#define YaoqingList @BaseUrl"/index/userqrcode/list"

#define OutLog @BaseUrl"/index/login/logout"

#define UpdateTicker @"http://bs.getcai.com/api/v1/exchange/ticker"


/**
 社区
 */
#define CommunityList @BaseUrl"/index/community_article/cate"

#define PublishCard @BaseUrl"/index/community/userPublishArticle"

#define CardList @BaseUrl"/index/community/userArticleList"

#define CardDetail @BaseUrl"/index/community/userArticleDetail"

#define CommentList @BaseUrl"/index/community/userArticleCommentList"

#define ProblemList @BaseUrl"/index/community/questionList"

#define HeadUpdate @BaseUrl"/index/user/setAvatar"

#define NameSet @BaseUrl"/index/user/setNickname"

#define GHBInfo @BaseUrl"/index/ghb/info"

#define GHBLog @BaseUrl"/index/ghb/log"

#define GHBCharge @BaseUrl"/index/pay/recharge"

#define UserInfo @BaseUrl"/index/user/info"

#define Comment @BaseUrl"/index/community/commentUserArticle"

#define MyCardList @BaseUrl"/index/community/userPublishArticleList"

#define MyCardDelete @BaseUrl"/index/community/delUserArticle"

#define NewsCategory @BaseUrl"/index/community_article/cate"

#define NewsList @BaseUrl"/index/community_article/articleList"

#define NewDetailHtml @BaseUrl"/index/community_article/articleDetailContent"

#define ShequHome @BaseUrl"/index/community/index"


/**
 合约
 */
#define GetBiList @BaseUrl"/index/contract/changedate.html" //

#define HoldList @BaseUrl"/index/contract/pending.html" //挂单列表

#define AgreeOrder @BaseUrl"/index/contract/bill.html" //合约账单

#define CloseAgreeLog @BaseUrl"/index/contract/close_log.html" //平仓记录

#define CreateAgree @BaseUrl"/index/contract/receive.html" //建仓

#define HoldAgreeLog @BaseUrl"/index/contract/position" //持仓记录

#define AgreeTradeList @BaseUrl"/index/contract/index.html"   //合约交易列表

#define CionChooseList @BaseUrl"/index/contract/changedate.html" //币种选择列表

#define AgreeAccount @BaseUrl"/index/contract/account.html" //合约账户

#define CloseAgree @BaseUrl"/index/contract/close.html" //平仓

#define YingSunSet @BaseUrl"/index/contract/changenum.html" //调整止盈止损


#define AgreeCancelOrder @BaseUrl"/index/contract/cancelpending.html" //

#define BBAcount @BaseUrl"/home/Coinassets/assets" //币币账户
/**
 币币
 */

#define BBTypeList @BaseUrl"/home/Coinassets/coin" //所有币种

#define WeituoAllHisList @BaseUrl"/home/Coincoin/page1" //全部历史委托记录


#define GetMarketPrice @BaseUrl"/home/Coincoin/market_price" //获取c市场价

#define GetCionList @BaseUrl"/home/Kline/curr"  //获取交易币对

#define GetCion @BaseUrl"/home/Kline/currency" //获取单个币

#define BBBuy  @BaseUrl"/home/Coincoin/purchase"  //买入

#define BBSell @BaseUrl"/home/Sellout/purchase" //卖出

#define GetBBBillList  @BaseUrl"/home/Historical/whole" //币币账单

#define GetBBBillDetailList @BaseUrl"/home/Coinassets/all_assets" //币币明细列表

#define WeituoAllList @BaseUrl"/home/Coincoin/page" //我的挂单

#define WeituoCancelAll @BaseUrl"/home/Historical/all_cancel" //撤单全部委托单

#define WeituoCancelOne @BaseUrl"/home/Historical/cancel" //撤单单个委托单

#define WeituoSingle @BaseUrl"/home/Coincoin/page2" //撤单单个

#define BBSellQuotation @BaseUrl"/home/Kline/sell_quotation"  //卖出行情

#define BBBuyQuotation @BaseUrl"/home/Kline/buy_quotation"  //卖出行情

#define BBBalanceScale @BaseUrl"/home/Kline/balance" //币种余额比例



/**
 C2C
 */
#define C2CChangePayType @BaseUrl"/index/Currencyexchange/change_pay" //切换支付方式

#define C2CTimeOutCancel @BaseUrl"/index/Currencyexchange/auto_concal_order" //超时取消

#define C2CBillList @BaseUrl"/index/Currencyexchange/order_index" //c2c 订单列表

#define C2CBillDetail @BaseUrl"/index/Currencyexchange/order_detail" //订单详情

#define C2CBuyList @BaseUrl"/index/Currencyexchange/buyin_index"   //买入列表

#define C2CSellList  @BaseUrl"/index/Currencyexchange/sellout_index" //卖出列表

#define C2CWeituoList @BaseUrl"/index/Currencyexchange/limit_index" //委托单列表



#define C2CBuyConfig @BaseUrl"/index/Currencyexchange/buyin_do" //买入配置信息

#define C2CBuyFirstAction @BaseUrl"/index/Currencyexchange/buyin_test" //一步买入

#define C2CBuyLastAction @BaseUrl"/index/Currencyexchange/buyin_confirm" //二步买入

#define C2CBuyConfirmAction @BaseUrl"/index/Currencyexchange/buyin_confirm_index"  //确认买入



#define C2CSellConfig @BaseUrl"/index/Currencyexchange/sellout_do" //卖出配置信息

#define C2CSellLastAction  @BaseUrl"/index/Currencyexchange/sellout_confirm" //二步卖出



#define C2CWeituoPublishBuy @BaseUrl"/index/Currencyexchange/buyin_intrust"  //发布买入委托单

#define C2CWeituoPublishSell @BaseUrl"/index/Currencyexchange/sellout_intrust" //发布出售委托单

#define C2CWallet @BaseUrl"/index/Currencyexchange/c2c_account" //c2c账户

#define C2CBuyLimit @BaseUrl"/index/Currencyexchange/buyin_quota" //买入限额

#define C2CSellLimit @BaseUrl"/index/Currencyexchange/sellout_quota" //卖出限额

#define C2CWeituoUpdateState  @BaseUrl"/index/Currencyexchange/upd_limit" //更改委托单h状态

#define C2COrderBuyUpdataStatus @BaseUrl"/index/Currencyexchange/buyin_update_status" //更改订单支付状态
#define C2COrderSellUpdataStatus @BaseUrl"/index/Currencyexchange/sellout_update_status" //更改订单支付状态


/**
 行情
 */
#define MarketBiList @BaseUrl"/index/show/show.html" //顶部币种选择

#define MarketList @BaseUrl"/index/show/index.html" //列表
/**
 资产
 */

#define PropertyHome @BaseUrl"/index/account/index" //资产

#define PropertyAddressList @BaseUrl"/index/account/userWithdrawAddressList"  //获取地址


#define PropertyGetAddress @BaseUrl"/index/account/getCoinAddress" //获取充币地址

#define PropertyRechargeHisList @BaseUrl"/index/account/payLog"//充币记录

#define PropertyCashList @BaseUrl"/index/account/withdrawLog" //提币记录

#define PropertySendB @BaseUrl"/index/account/addUserWithdrawLog" //提币

#define GetBCode @BaseUrl"/index/user/sendCode" //

#define PropertyAddAddress @BaseUrl"/index/account/addWithdrawAddress" //添加地址


