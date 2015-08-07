//
//  WebNativeDemoViewController.m
//  CocoaKit
//
//  Created by sky on 15/6/11.
//  Copyright (c) 2015年 iOS. All rights reserved.
//

#import "WebNativeDemoViewController.h"

#import "MYWebView.h"

@interface WebNativeDemoViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

{
    MYWebView      *_webView;
    UITextField     *_tf;
}

@end

@implementation WebNativeDemoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self tabBarHidden];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Web_NativeViewController";
    _webView = [[MYWebView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth(), ScreenHeight() - 20 - 44 - 44 - 100) URLString:[[NSBundle mainBundle] pathForResource:@"WebNativeDemo" ofType:@"html"]];
    [self.view addSubview:_webView];
    _webView.backgroundColor = RGB(225, 225, 225);
    _webView.delegate = self;
    _webView.scrollView.delegate = self;
    
    _tf = [[UITextField alloc]initWithFrame:CGRectMake(20, 518, 226, 30)];
    [self.view addSubview:_tf];
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [sendButton setTitle:@"提交" forState:normal];
    sendButton.frame = CGRectMake(254, 518, 30, 30);
    [self.view addSubview:sendButton];
    [sendButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sendMessage
{
    NSString *message = _tf.text;
    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"getMessageFromApp('%@')", message]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"getMessageFromApp('%@')", @"数据是从app传递过来的"]];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];//获取请求的绝对路径.
    NSArray *components = [requestString componentsSeparatedByString:@":"];//提交请求时候分割参数的分隔符
    if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"]) {
        //过滤请求是否是我们需要的.不需要的请求不进入条件
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
        {
            NSString *message = [(NSString *)[components objectAtIndex:2]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JS向APP提交数据" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
        return NO;
    }
    return YES;
}


@end
