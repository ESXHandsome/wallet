//
//  WLNHandle+Mine.m
//  KangYangChain
//
//  Created by furao on 2018/10/12.
//  Copyright © 2018年 furao. All rights reserved.
//

#import "WLNHandle+Mine.h"

@implementation WLNHandle (Mine)



- (void)sellGHB:(NSMutableDictionary *)dic{
    NSLog(@"11111111111111111111111");
}
- (void)resetName:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:NameSet dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)buyGHB:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:BuyGHB dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)buyInfo:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:BuyInfo dic:dic sel:_cmd isPost:NO];

    
}
- (void)matchList:(NSMutableDictionary *)dic{
    
    [self __requestWith:MatchList dic:dic sel:_cmd isPost:NO];

}
- (void)matchInfo:(NSMutableDictionary *)dic{
    
    [self __requestWith:MatchInfo dic:dic sel:_cmd isPost:NO];
    
}
- (void)payGHB:(NSMutableDictionary *)dic{
    
    [self __requestWith:PayGHB dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)lockAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:LockAction dic:dic sel:_cmd isPost:YES];
    
}
- (void)lockConfig:(NSMutableDictionary *)dic{
    
    [self __requestWith:LockcConfig dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)lockList:(NSMutableDictionary *)dic{
    
    
    
}
- (void)yaoqingList:(NSMutableDictionary *)dic{
    
    [self __requestWith:YaoqingList dic:dic sel:_cmd isPost:NO];
    
    
}

- (void)publishCard:(NSMutableDictionary *)dic{
    
    self.sel = _cmd;
    
    NSMutableDictionary *dicp = @{}.mutableCopy;
    dicp[URLS] = PublishCard;
    dicp[PRAMAS] = dic;
    
    [self routeTargetName:@"WLNData" actionName:@"updatePicWithDic:" param:dicp];
    
}
- (void)cardList:(NSMutableDictionary *)dic{
 
    [self __requestWith:CardList dic:dic sel:_cmd isPost:YES];
 
}
- (void)cardDetail:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:CardDetail dic:dic sel:_cmd isPost:YES];
   
}
- (void)commentList:(NSMutableDictionary *)dic{
    
    [self __requestWith:CommentList dic:dic sel:_cmd isPost:YES];
    
}
- (void)problemList:(NSMutableDictionary *)dic{
    
    [self __requestWith:ProblemList dic:dic sel:_cmd isPost:YES];
}

- (void)updateHeadImg:(NSMutableDictionary *)dic{
    
    self.sel = _cmd;
    self.hiddenTip = YES;

    NSMutableDictionary *dicp = @{}.mutableCopy;
    dicp[URLS] = HeadUpdate;
    dicp[PRAMAS] = dic;
    
    [self routeTargetName:@"WLNData" actionName:@"updatePicWithDic:" param:dicp];

}
- (void)GHBLogAction:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:GHBLog dic:dic sel:_cmd isPost:YES];
    
}

- (void)GHBRecharge:(NSMutableDictionary *)dic{
    
    
    [self __requestWith:GHBCharge dic:dic sel:_cmd isPost:YES];
    
}
- (void)GHBinfo:(NSMutableDictionary *)dic{
    
    [self __requestWith:GHBInfo dic:dic sel:_cmd isPost:YES];
}
- (void)userInfo:(NSMutableDictionary *)dic{
    
    [self __requestWith:UserInfo dic:dic sel:_cmd isPost:YES];
    
}
- (void)commentAction:(NSMutableDictionary *)dic{
    
    [self __requestWith:Comment dic:dic sel:_cmd isPost:YES];
    
    
}
- (void)myCardList:(NSMutableDictionary *)dic{
    
    [self __requestWith:MyCardList dic:dic sel:_cmd isPost:YES];
    
}
- (void)myCardDelete:(NSMutableDictionary *)dic{
    
    [self __requestWith:MyCardDelete dic:dic sel:_cmd isPost:YES];
}

- (void)newsCategory:(NSMutableDictionary *)dic{
    
    [self __requestWith:NewsCategory dic:dic sel:_cmd isPost:YES];
}
- (void)newsList:(NSMutableDictionary *)dic{
    
    [self __requestWith:NewsList dic:dic sel:_cmd isPost:YES];
    
}

- (void)shequHome:(NSMutableDictionary *)dic{
    
    [self __requestWith:ShequHome dic:dic sel:_cmd isPost:YES];
    
    
}
@end
