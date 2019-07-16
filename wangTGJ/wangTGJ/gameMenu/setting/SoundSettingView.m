//
//  SoundSettingView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/25.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "SoundSettingView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
@implementation SoundSettingView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
        [self initTitleLab];
        [self initbgView];
        [self initMidleBgView];
        [self initsoundSwitchLab];
        [self initMusicSwitchLab];
        [self initVolumeSwitchLab];
        [self initSoundSwitch];
        [self initMusicSwitch];
        [self initVolumeSlider];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
    _titleLab.text=[HelperHandle getLanguage:@"声音设置"];
    _soundSwitchLab.text=[HelperHandle getLanguage:@"音效开关"];
    _musicSwitchLab.text=[HelperHandle getLanguage:@"音乐开关"];
    _volumeSwitchLab.text=[HelperHandle getLanguage:@"音量"];
}
-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"声音设置"];
    _titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _titleLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
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
        make.top.equalTo(self.titleLab.mas_bottom).offset(30);
        make.left.equalTo(self.mas_left).offset(30);
        make.right.equalTo(self.mas_right).offset(-30);
        make.bottom.equalTo(self.mas_bottom).offset(-30);
    }];
}
-(void)initMidleBgView{
    _midleBgView=[[UIView alloc] init];
    _midleBgView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    [self addSubview:_midleBgView];
    [_midleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
    }];
}
-(void)initsoundSwitchLab{
    _soundSwitchLab=[[UILabel alloc] init];
    _soundSwitchLab.text=[HelperHandle getLanguage:@"音效开关"];
    _soundSwitchLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    //_soundSwitchLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_soundSwitchLab];
    [_soundSwitchLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.midleBgView.mas_top).offset(20);
        make.left.equalTo(self.midleBgView.mas_left).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
}
-(void)initMusicSwitchLab{
    _musicSwitchLab=[[UILabel alloc] init];
    _musicSwitchLab.text=[HelperHandle getLanguage:@"音乐开关"];
    _musicSwitchLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    //_soundSwitchLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_musicSwitchLab];
    [_musicSwitchLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.midleBgView.mas_centerY).offset(0);
        make.left.equalTo(self.midleBgView.mas_left).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
}
-(void)initVolumeSwitchLab{
    _volumeSwitchLab=[[UILabel alloc] init];
    _volumeSwitchLab.text=[HelperHandle getLanguage:@"音量"];
    _volumeSwitchLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    //_soundSwitchLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_volumeSwitchLab];
    [_volumeSwitchLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.midleBgView.mas_bottom).offset(-20);
        make.left.equalTo(self.midleBgView.mas_left).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
}
-(void)initSoundSwitch{
    _soundSwitch=[[UIButton alloc] init];
    [_soundSwitch addTarget:self action:@selector(soundSwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"soundOn"];
    if (num==nil) {
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"soundOn"];
        [userDefaut synchronize];
        num=[userDefaut objectForKey:@"soundOn"];
    }
    if ([num boolValue]) {
        [_soundSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
    }else{
    [_soundSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
    }
    [self addSubview:_soundSwitch];
    [_soundSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.soundSwitchLab.mas_centerY).offset(0);
        make.right.equalTo(self.midleBgView.mas_right).offset(-10);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
}
-(void)soundSwitchAction:(UIButton *)kswitch{
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"soundOn"];
    if ([num boolValue]) {
        [userDefaut setObject:[NSNumber numberWithBool:NO] forKey:@"soundOn"];
        [userDefaut synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeSound" object:nil];
        [kswitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
        NSLog(@"关闭音效");
    }else{
        NSLog(@"打开音效");
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"soundOn"];
        [userDefaut synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeSound" object:nil];
        [kswitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
    }
}
-(void)initMusicSwitch{
    _musicSwitch=[[UIButton alloc] init];
    [_musicSwitch addTarget:self action:@selector(musicSwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"musicOn"];
    if (num==nil) {
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"musicOn"];
        [userDefaut synchronize];
        num=[userDefaut objectForKey:@"musicOn"];
    }
    if ([num boolValue]) {
        [_musicSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
    }else{
        [_musicSwitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
    }
    [self addSubview:_musicSwitch];
    [_musicSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.musicSwitchLab.mas_centerY).offset(0);
        make.right.equalTo(self.midleBgView.mas_right).offset(-10);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
}
-(void)musicSwitchAction:(UIButton *)kswitch{
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"musicOn"];
    if ([num boolValue]) {
        [userDefaut setObject:[NSNumber numberWithBool:NO] forKey:@"musicOn"];
        [userDefaut synchronize];
        [kswitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_off"] forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeMusic" object:nil];
        NSLog(@"关闭音乐");
    }else{
        NSLog(@"打开音乐");
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"musicOn"];
        [userDefaut synchronize];
        [kswitch setBackgroundImage:[UIImage imageNamed:@"setting_toggle_on"] forState:UIControlStateNormal];
         [[NSNotificationCenter defaultCenter] postNotificationName:@"changeMusic" object:nil];
    }
}
-(void)initVolumeSlider{
    _volumeSlider=[[UISlider alloc] init];
    _volumeSlider.minimumValue=0;
    _volumeSlider.maximumValue=1;
    
    _volumeSlider.continuous=YES;
    _volumeSlider.maximumTrackTintColor=[UIColor colorWithRed:58/255.0 green:58/255.0 blue:58/255.0 alpha:1];
    _volumeSlider.minimumTrackTintColor=[UIColor colorWithRed:164/255.0 green:133/255.0 blue:107/255.0 alpha:1];
    [_volumeSlider addTarget:self action:@selector(volumeSliderAction:) forControlEvents:UIControlEventValueChanged];
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"volume"];
    if (num==nil) {
        [userDefaut setObject:[NSNumber numberWithFloat:0.5] forKey:@"volume"];
        [userDefaut synchronize];
        num=[userDefaut objectForKey:@"volume"];
    }
    _volumeSlider.value=[num floatValue];
    [self addSubview:_volumeSlider];
    [_volumeSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.volumeSwitchLab.mas_centerY).offset(0);
        make.right.equalTo(self.midleBgView.mas_right).offset(-10);
        make.left.equalTo(self.volumeSwitchLab.mas_right).offset(10);
        make.height.mas_equalTo(30);
    }];
}
-(void)volumeSliderAction:(UISlider *)slider{
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    [userDefaut setObject:[NSNumber numberWithFloat:slider.value] forKey:@"volume"];
    [userDefaut synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeVolume" object:nil];
    NSLog(@"音量:%f",slider.value);
}
@end
