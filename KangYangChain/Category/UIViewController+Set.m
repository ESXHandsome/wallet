//
//  UIViewController+Set.m
//  KangYangChain
//
//  Created by edz on 2018/10/26.
//  Copyright © 2018 furao. All rights reserved.
//

#import "UIViewController+Set.h"
#import "UINavigationBar+Awesome.h"

@implementation UIViewController (Set)

- (void)setDefaultParameter{
    
}
- (void)changeNav{

    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    if (@available(iOS 11.0, *)) {
        self.tab.contentInsetAdjustmentBehavior =     UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }

}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    [self.view endEditing:YES];
}
#pragma mark - 数据请求回调协议
- (void)result:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD dismiss];
    [self.tab.pullToRefreshView stopAnimating];

}
- (void)faild:(id)data sel:(NSString *)sel{
    
    [SVProgressHUD showErrorWithStatus:data];

}

#pragma mark - 数据刷新回调协议
- (void)pullUpLoading{

    [self.tab.pullToRefreshView stopAnimating];

}
- (void)dropDownrefresh{
    
    [self.tab.infiniteScrollingView stopAnimating];

}

#pragma mark - 空数据回调协议
- (void)emptyShow{
    
    NSLog(@"添加缺省图");
    
    WLNEmptyView *view = [[WLNEmptyView alloc]initWithFrame:[self resetEmptyFrame]];
    if (!self.tab) {
        return;
    }
    self.tab.tableFooterView = view;
    
    
}
- (void)removeEmptyShow{
    
    NSLog(@"移除缺省图");
    
    if (!self.tab) {
        return;
    }
    self.tab.tableFooterView = nil;
    
}

- (CGRect)resetEmptyFrame{
    
    
    return CGRectMake(0 , 50, 130, 130);
    
}


#pragma mark - 自定义方法


- (void)push:(UIViewController *)vc title:(NSString *)title{

    vc.hidesBottomBarWhenPushed = YES;
    
    vc.title = title;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
}
- (void)push:(UIViewController *)vc box:(id)box title:(NSString *)title{
    
    vc.hidesBottomBarWhenPushed = YES;
    
    vc.title = title;
    
    vc.box = box;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
}
- (void)push:(UIViewController *)vc box:(id)box{
    
    vc.hidesBottomBarWhenPushed = YES;
    
    vc.box = box;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
}
- (void)push:(UIViewController *)vc{
   
    vc.hidesBottomBarWhenPushed = YES;
    
    UIViewController *mine = (UIViewController *)self;
    
    [mine.navigationController pushViewController:vc animated:YES];
    
    
}

#pragma mark - 关联对象

- (id)box{
    
    return  objc_getAssociatedObject(self, @selector(box));
    
}
- (void)setBox:(id)box{
    
    objc_setAssociatedObject(self, @selector(box), box, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(void)setTab:(UITableView *)tab{
    
    objc_setAssociatedObject(self, @selector(tab), tab, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (UITableView *)resetTab{
    
    UITableView *tab =  [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab.backgroundColor = maingray;
    return tab;
}
- (UITableView *)tab{
    
    UITableView *tableview =  objc_getAssociatedObject(self, @selector(tab));
    
    if (tableview == nil) {
        
        self.tab = [self resetTab];

        tableview = objc_getAssociatedObject(self, @selector(tab));
        
        
        weakSelf(self);
        
//        [self.tab addInfiniteScrollingWithActionHandler:^{
//
//            [weakself dropDownrefresh];
//
//
//        }];
//        [self.tab addPullToRefreshWithActionHandler:^{
//
//
//            [weakself pullUpLoading];
//
//
//        }];
        
        
        
    }
    
    return tableview;
    
}
- (void)setType:(TAB_FRAME_TYPE)type{
    
    objc_setAssociatedObject(self, @selector(type), @(type), OBJC_ASSOCIATION_ASSIGN);

}
- (TAB_FRAME_TYPE)type{
    
    return [objc_getAssociatedObject(self, @selector(type)) integerValue];
    
    
}

- (CGRect)resetTabFrame{
    
    CGRect frame;
    
    if (self.type == CUT_TOPDOWN) {
        
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 49 - 64);
        
    }else if(self.type == CUT_TOP){
        
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 64);
        
    }else {
        frame = CGRectMake(0, 0, DEVICEWidth, DEVICEHEIGHT - 49 );
        
    }
    
    return frame;
    
}
- (void)tabType:(TAB_FRAME_TYPE)type{
 
    self.type = type;
    
    self.tab.frame = [self resetTabFrame];
    
    [self.view addSubview:self.tab];
    
    
}
- (void)customPop{
  
    UIViewController *vc = (UIViewController *)self;
    
    [vc.view endEditing:YES];
    
    if ([vc.navigationController.viewControllers.firstObject isEqual:self]) {
        
        [vc dismissViewControllerAnimated:YES completion:nil];
        
    }else{
        [vc.navigationController popViewControllerAnimated:YES];
    }
    
}



@end
