//
//  RxWebViewController.h
//  RxWebViewController
//
//  Created by roxasora on 15/10/23.
//  Copyright © 2015年 roxasora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RxWebViewController : UIViewController

/**
 *  origin url
 */
@property (nonatomic)NSURL* url;

/**
 *  embed webView
 */
@property (nonatomic)IBOutlet UIWebView* webView;

/**
 *  tint color of progress view
 */
@property (nonatomic)UIColor* progressViewColor;

/**
 *  get instance with url
 *
 *  @param url url
 *
 *  @return instance
 */
-(instancetype)initWithUrl:(NSURL*)url;


-(void)reloadWebView;

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
@end


