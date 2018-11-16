//
//  Base64.m
//  Wallet
//
//  Created by 谷澍 on 2018/10/29.
//  Copyright © 2018 Ying. All rights reserved.
//

#import "Base64.h"

@implementation Base64
+(NSString *)encryption:(NSString *)string{
    
    
    NSData *encodeData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
    return base64String;
}
+(NSString *)decrypt:(NSString *)string{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}

@end
