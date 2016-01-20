//
//  cartViewController.m
//  highShopping
//
//  Created by 周磊 on 15/12/28.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import "cartViewController.h"
#import "AppDelegate.h"

@interface cartViewController ()
{
    BOOL is_chart_show;
}
@end

@implementation cartViewController

- (void)viewDidLoad {
    self.url=[NSURL URLWithString:taobaoChart];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    is_chart_show=NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
    if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
        rootNavi.navigationBar.topItem.title=@"购物车";
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //    NSLog(@"navigation type %d",navigationType);
    
    
    NSLog(@"url=%@",request.URL);
    
    NSString *urlString=[request.URL absoluteString];
    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        RxWebViewController *rxVC=[[RxWebViewController alloc]initWithUrl:[NSURL URLWithString:urlString]];
        
        
        AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
        if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
            [rootNavi pushViewController:rxVC animated:YES];
            
        }
        return NO;
        
 
    }else{
        [super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];

    }
    return YES;
}


@end
