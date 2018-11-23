//
//  WLNHTMLProgressView.h
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WKWebView.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLNHTMLProgressView : UIProgressView
@property (nonatomic, strong) WKWebView *webView;
- (void)remove;

- (instancetype)initWithFrame:(CGRect)frame webView:(WKWebView *)webView;

@end

NS_ASSUME_NONNULL_END
