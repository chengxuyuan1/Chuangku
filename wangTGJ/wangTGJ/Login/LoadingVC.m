//
//  LoadingVC.m
//  万通国际
//
//  Created by 许传信 on 2018/8/14.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "LoadingVC.h"
#import <Masonry/Masonry.h>
#import "HWProgressView.h"
#import "GameMenuVC.h"
#import "AppDelegate.h"
@interface LoadingVC ()
@property (nonatomic,strong) UIImageView *iconImgView;
@property (nonatomic, weak) HWProgressView *progressView;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation LoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    

    
    [self initIconImgView];
    [self initProgress];
    [self addTimer];
}
- (void)initIconImgView{
    _iconImgView=[[UIImageView alloc] init];
    _iconImgView.image=[UIImage imageNamed:@"logo2"];
    [self.view addSubview:_iconImgView];
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(50);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
}
- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)initProgress{
    //进度条
    HWProgressView *progressView = [[HWProgressView alloc] init];
    [self.view addSubview:progressView];
    self.progressView = progressView;
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImgView.mas_bottom).offset(10);
        make.centerX.equalTo(_iconImgView.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(20);
    }];
}
- (void)timerAction
{
    _progressView.progress += 0.1;
 
    if (_progressView.progress >= 1) {
        [self removeTimer];
        NSLog(@"完成");
        [self forceOrientationLandscape];
        GameMenuVC *gameMenuVC=[[GameMenuVC alloc] init];
        [self presentViewController:gameMenuVC animated:YES completion:^{
            
        }];
    }
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
- (void)removeTimer
{
    [_timer invalidate];
    _timer = nil;
}




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setRight];
}
-(void)setRight{
    //设置状态栏方向，超级重要。（只有设置了这个方向，才能改变弹出键盘的方向）
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    
    //设置状态栏横屏
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    //    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];//这句话是防止手动先把设备置为横屏,导致下面的语句失效.
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:@(UIInterfaceOrientationLandscapeRight)];
        
    }
}
- (BOOL)shouldAutorotate
{
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return  UIInterfaceOrientationLandscapeRight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
