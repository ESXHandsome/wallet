//
//  WLNReqstProtocol.h
//  KangYangChain
//
//  Created by furao on 2018/10/7.
//  Copyright © 2018年 furao. All rights reserved.
//

#ifndef WLNReqstProtocol_h
#define WLNReqstProtocol_h

@protocol WLNReqstProtocol <NSObject>

- (void)result:(id)data sel:(NSString *)sel;

- (void)faild:(id)data sel:(NSString *)sel;

- (void)emptyShow;

- (void)removeEmptyShow;


@end

#endif /* WLNReqstProtocol_h */
