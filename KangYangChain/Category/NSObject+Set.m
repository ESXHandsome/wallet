//
//  NSObject+Set.m
//  KangYangChain
//
//  Created by edz on 2018/11/2.
//  Copyright © 2018 furao. All rights reserved.
//

#import "NSObject+Set.h"

@implementation NSObject (Set)

- (User *)userModel{
    
    NSMutableDictionary *dic = [self routeTargetName:Handle actionName:@"readUserDic"];
    
    User *model = [[User alloc]initWithDictionary:dic];
    
    return model;
    
}

- (id<WLNReqstProtocol>)reqDelegate{
    
    return objc_getAssociatedObject(self, @selector(reqDelegate));
    
}
- (void)setReqDelegate:(id<WLNReqstProtocol>)reqDelegate{
    
    objc_setAssociatedObject(self, @selector(reqDelegate), reqDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName{
    
    return [self routeTargetName:targetName actionName:actionName param:nil];
    
}

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName blockParam:(void(^)(NSDictionary*))completion{
    
    return [self routeTargetName:targetName actionName:actionName param:completion];
    
}


- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName param:(id)param{
    
    Class targetClass = NSClassFromString(targetName);

    SEL actionSel = NSSelectorFromString(actionName);
    
    
    NSObject *targetObj = [targetClass new];
    
    targetObj.reqDelegate = self;

    if ([targetObj respondsToSelector:actionSel]) {
        
        NSMethodSignature *signture = [targetObj methodSignatureForSelector:actionSel];
        NSString *returnType = [NSString stringWithUTF8String:signture.methodReturnType];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        if([returnType isEqualToString:@"@"]){
            return [targetObj performSelector:actionSel withObject:param];
        }else if([returnType isEqualToString:@"v"]||[returnType isEqualToString:@"V"]){
            
            [targetObj performSelector:actionSel withObject:param];
            return nil;
            
        }else{
            
            [targetObj performSelector:actionSel withObject:param];
            return nil;
        }
        
#pragma clang diagnostic pop
    }else{
        
        NSLog(@"error:%@没有%@方法", targetName, actionName);
        return nil;
    }
}
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
- (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    if (format == nil) {
        format = @"mm:ss";
        
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSLog(@"1296035591  = %@",confromTimesp);
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    
    return confromTimespStr;
    
}
@end
