//
//  WLNHTMLProgressView.m
//  KangYangChain
//
//  Created by edz on 2018/10/27.
//  Copyright © 2018 furao. All rights reserved.
//

#import "WLNHTMLProgressView.h"

@implementation WLNHTMLProgressView



- (instancetype)initWithFrame:(CGRect)frame webView:(WKWebView *)webView{
    self = [super initWithFrame:frame];
    
    
    if (self) {
        self.tintColor = [UIColor greenColor];
        self.trackTintColor = [UIColor clearColor];
        self.webView = webView;
        
        
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return  self;
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == self.webView) {
        
        [self setAlpha:1.0f];
        BOOL animated = self.webView.estimatedProgress > self.progress;
        [self setProgress:self.webView.estimatedProgress
                 animated:animated];
        
        if (self.webView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self setAlpha:0.0f];
                             }
                             completion:^(BOOL finished) {
                                 [self setProgress:0.0f animated:NO];
                             }];
        }
    }
    
}

- (void)remove{
    
    @try {
        [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
        
    } @catch (NSException *exception) {
        
        NSLog(@"多次释放");
        
    }
    [_webView setNavigationDelegate:nil];
    [_webView setUIDelegate:nil];
    
}
@end
