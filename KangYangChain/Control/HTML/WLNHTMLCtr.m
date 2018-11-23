//
//  WLNHTMLCtr.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNHTMLCtr.h"

#import <WebKit/WebKit.h>

@interface WLNHTMLCtr ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

@property (nonatomic, strong) WLNHTMLProgressView *progressView;

@property (nonatomic, strong) WKWebView *webView;


@end

@implementation WLNHTMLCtr

- (id)initWithData:(id)data{
    if (self = [super init]) {
        
        self.box = data;
        
    }
    
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];

    NSString *str = (NSString *)self.box;
    
    [self.webView loadRequest:[self myLoadWithURL:str]];
     
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    
    
}
- (UIEdgeInsets)getSafeArea:(BOOL)portrait{
    
    return UIEdgeInsetsZero;
    
}
- (WKWebView *)webView{
    if (_webView == nil) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWidth,DEVICEHEIGHT - 64)];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        [_webView.configuration.userContentController addScriptMessageHandler:self name:@"exitNowPage"];
        
    }
    return _webView;
}
- (NSURLRequest *)myLoadWithURL:(NSString *)str{
    
    NSURL *url  = [NSURL URLWithString:str];
    NSURLRequest *requst =  [[NSURLRequest alloc] initWithURL:url];
    return requst;
}
- (WLNHTMLProgressView *)progressView{
    if (_progressView == nil) {
        _progressView = [[WLNHTMLProgressView alloc]initWithFrame:self.view.frame webView:self.webView];
        
    }
    return _progressView;
}
-(void)dealloc{
    self.webView.UIDelegate = nil;
    self.webView.navigationDelegate = nil;
    
}
@end
