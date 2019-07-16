//
//  RoyalVCViewController.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/19.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "RoyalVCViewController.h"
#import <Masonry/Masonry.h>
//#import <AFNetworking/UIWebView+AFNetworking.h>
#import "AppDelegate.h"
#import "HelperHandle.h"
#import "NetworkingAdress.h"
#import "LoginUserInfo.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface RoyalVCViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (strong, nonatomic) JSContext *context;

@end

@implementation RoyalVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView=[[UIWebView alloc] init];
    _webView.delegate=self;
    _webView.allowsInlineMediaPlayback = YES;
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    //万通国际web的地址修改为 http://43.249.206.212/mobile/index.html
    //http://103.231.167.85/apihj/game.php?gametype=hj&userid=" + userId + "0&loginurl=http://103.231.167.85:8888/mobile/index.html
    NSString *url=[NSString stringWithFormat:@"%@/apihj/game.php?gametype=hj&userid=%@&loginurl=%@:8888/mobile/index.html",kIPAdree,[LoginUserInfo share].userid,h5Ip];
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
    
//    [_webView loadRequest:request progress:nil success:^NSString * _Nonnull(NSHTTPURLResponse * _Nonnull response, NSString * _Nonnull HTML) {
//        return HTML;
//    } failure:^(NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
    

     
  
    
    
    UIButton *backBtn=[[UIButton alloc] init];
    [backBtn setTitle:@"退出" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
    backBtn.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    [backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn.layer setMasksToBounds:YES];   //设置yes
    [backBtn.layer setCornerRadius:50/2.0f];
    //[self.view addSubview:backBtn];
//    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(10);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
//        make.width.mas_equalTo(50);
//        make.height.mas_equalTo(50);
//    }];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType

{

    
    //判断是否是单击
    NSURL *url = [request URL];
    if ([url.absoluteString isEqualToString:@"http://43.249.206.212:8888/mobile/index.html"]) {
        //[self backBtnAction];
        [self performSelector:@selector(backBtnAction) withObject:nil afterDelay:1];
    }
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
        
    {
        
        
        
//        if([[UIApplication sharedApplication]canOpenURL:url])
//
//        {
//
//            [[UIApplication sharedApplication]openURL:url];
//
//        }
//
//        return NO;
        
    }
    
    return YES;

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //核心方法如下
    JSContext *content = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    content[@"native"] = self;
    //此处的getMessage和JS方法中的getMessage名称一致.
    content[@"getMessage"] = ^() {
        NSArray *arguments = [JSContext currentArguments];
        for (JSValue *jsValue in arguments) {
            NSLog(@"===getMessage==--------==%@",jsValue);
        }
    };
}





-(void)backBtnAction{
    //清除cookies
//    NSHTTPCookie *cookie;
//    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage   sharedHTTPCookieStorage];
//    for (cookie in [storage cookies])  {
//        [storage deleteCookie:cookie];
//    }
    
    //清除UIWebView的缓存
//    NSURLCache * cache = [NSURLCache sharedURLCache];
//    [cache removeAllCachedResponses];
//    [cache setDiskCapacity:0];
//    [cache setMemoryCapacity:0];
    
    [self forceOrientationLandscape];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma  mark 横屏设置
//强制横屏
- (void)forceOrientationLandscape{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForceLandscape=YES;
    appdelegate.isForcePortrait=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

//强制竖屏
- (void)forceOrientationPortrait{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

@end
