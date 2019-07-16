//
//  OtherSettingView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/25.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "OtherSettingView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
@implementation OtherSettingView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
        [self initbgView];
        [self initTitleLab];
        [self initVideoBgView];
        [self initPushBgView];
        [self initVideoLab];
        [self initPUshLab];
        [self initVideoSwitch];
        [self initPushSwitch];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
    _titleLab.text=[HelperHandle getLanguage:@"其他设置"];
    _videoLab.text=[HelperHandle getLanguage:@"视频开关"];
    _pushLab.text=[HelperHandle getLanguage:@"推送开关"];
}
-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"其他设置"];
    _titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _titleLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView.mas_top).offset(-20);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
}
-(void)initbgView{
    _bgView=[[UIView alloc] init];
    _bgView.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    _bgView.layer.borderWidth=2;
    _bgView.layer.borderColor=[UIColor colorWithRed:164/255.0 green:133/255.0 blue:107/255.0 alpha:1].CGColor;
    [self addSubview:_bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.left.equalTo(self.mas_left).offset(30);
        make.right.equalTo(self.mas_right).offset(-30);
        make.height.mas_equalTo(150);
    }];
}
-(void)initVideoBgView{
    _videoBgView=[[UIView alloc] init];
    _videoBgView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    [self addSubview:_videoBgView];
    [_videoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.mas_equalTo(60);
    }];
}
-(void)initPushBgView{
    _pushBgView=[[UIView alloc] init];
    _pushBgView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    [self addSubview:_pushBgView];
    [_pushBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.videoBgView.mas_bottom).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
    }];
}
-(void)initVideoLab{
    _videoLab=[[UILabel alloc] init];
    _videoLab.text=[HelperHandle getLanguage:@"视频开关"];
    _videoLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _videoLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_videoLab];
    [_videoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.videoBgView.mas_bottom).offset(0);
        make.top.equalTo(self.videoBgView.mas_top).offset(0);
        make.left.equalTo(self.videoBgView.mas_left).offset(10);
        make.width.mas_equalTo(100);
    }];
}
-(void)initPUshLab{
    _pushLab=[[UILabel alloc] init];
    _pushLab.text=[HelperHandle getLanguage:@"推送开关"];
    _pushLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _pushLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_pushLab];
    [_pushLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.pushBgView.mas_bottom).offset(0);
        make.top.equalTo(self.pushBgView.mas_top).offset(0);
        make.left.equalTo(self.pushBgView.mas_left).offset(10);
        make.width.mas_equalTo(100);
    }];
}
-(void)initVideoSwitch{
    _videoSwitch=[[UIButton alloc] init];
    [_videoSwitch addTarget:self action:@selector(videoSwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"videoOn"];
    if (num==nil) {
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"videoOn"];
        [userDefaut synchronize];
        num=[userDefaut objectForKey:@"videoOn"];
    }
    if ([num boolValue]) {
        [_videoSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
    }else{
        [_videoSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
    }
    [self addSubview:_videoSwitch];
    [_videoSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.videoLab.mas_centerY).offset(0);
        make.right.equalTo(self.videoBgView.mas_right).offset(-10);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
}
-(void)videoSwitchAction:(UIButton *)btn{
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"videoOn"];
    if ([num boolValue]) {
        [userDefaut setObject:[NSNumber numberWithBool:NO] forKey:@"videoOn"];
        [userDefaut synchronize];
        [btn setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeVideo" object:nil];
        NSLog(@"关闭视频");
    }else{
        NSLog(@"打开视频");
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"videoOn"];
        [userDefaut synchronize];
        [btn setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeVideo" object:nil];
    }
}
-(void)initPushSwitch{
    _pushSwitch=[[UIButton alloc] init];
    [_pushSwitch addTarget:self action:@selector(pushSwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"pushOn"];
    if (num==nil) {
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"pushOn"];
        [userDefaut synchronize];
        num=[userDefaut objectForKey:@"pushOn"];
    }
    if ([num boolValue]) {
        [_pushSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
    }else{
        [_pushSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
    }
    [self addSubview:_pushSwitch];
    [_pushSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.pushLab.mas_centerY).offset(0);
        make.right.equalTo(self.pushBgView.mas_right).offset(-10);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
}
-(void)pushSwitchAction:(UIButton *)btn{
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"pushOn"];
    if ([num boolValue]) {
        [userDefaut setObject:[NSNumber numberWithBool:NO] forKey:@"pushOn"];
        [userDefaut synchronize];
        [btn setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changePush" object:nil];
        NSLog(@"关闭推送");
    }else{
        NSLog(@"打开推送");
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"pushOn"];
        [userDefaut synchronize];
        [btn setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changePush" object:nil];
    }
}
@end
