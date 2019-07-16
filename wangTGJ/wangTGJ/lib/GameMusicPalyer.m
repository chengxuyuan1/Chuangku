//
//  GameMusicPalyer.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/4.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GameMusicPalyer.h"

@implementation GameMusicPalyer
-(instancetype)init{
    self=[super init];
    if (self) {
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSound:) name:@"changeSound" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeMusic:) name:@"changeMusic" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeVolume:) name:@"changeVolume" object:nil];
    }
    return self;
}
-(void)changeSound:(NSNotification *)niti{
    if (!_repeatMusic) {
        NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
        NSNumber *num=[userDefaut objectForKey:@"soundOn"];
        if (num==nil) {
            [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"soundOn"];
            [userDefaut synchronize];
            num=[userDefaut objectForKey:@"soundOn"];
        }
        if ([num boolValue]) {
            NSNumber *volume=[userDefaut objectForKey:@"volume"];
            if (volume==nil) {
                [userDefaut setObject:[NSNumber numberWithFloat:0.5] forKey:@"volume"];
                [userDefaut synchronize];
                volume=[userDefaut objectForKey:@"volume"];
            }
            self.ZFPlayer.volume=[volume floatValue];
        }else{
            self.ZFPlayer.volume=0;
        }
    }
}
-(void)changeMusic:(NSNotification *)niti{
    if (_repeatMusic) {
        NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
        NSNumber *num=[userDefaut objectForKey:@"musicOn"];
        if (num==nil) {
            [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"musicOn"];
            [userDefaut synchronize];
            num=[userDefaut objectForKey:@"musicOn"];
        }
        if ([num boolValue]) {
            NSNumber *volume=[userDefaut objectForKey:@"volume"];
            if (volume==nil) {
                [userDefaut setObject:[NSNumber numberWithFloat:0.5] forKey:@"volume"];
                [userDefaut synchronize];
                volume=[userDefaut objectForKey:@"volume"];
            }
            self.ZFPlayer.volume=[volume floatValue];
        }else{
            self.ZFPlayer.volume=0;
        }
    }
}
-(void)changeVolume:(NSNotification *)niti{
    [self changeSound:nil];
    [self changeMusic:nil];
}
-(AVAudioPlayer *)ZFPlayer
{
    if (!_ZFPlayer) {
        //设置ZFPlayer
        NSURL *url = [NSURL fileURLWithPath:_mp3url];
        NSError *error = nil;
        _ZFPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if (!error) {
            _ZFPlayer.volume = 0;
            [self changeVolume:nil];
            _ZFPlayer.delegate = self;
            [_ZFPlayer prepareToPlay];
        }
        else
        {
            NSLog(@"error = %@",[error localizedDescription]);
        }
    }
    return _ZFPlayer;
}
-(void)playBlcok:(MusicBlock)block{
    _overBlock=block;
    //开始播放
    [self.ZFPlayer play];
}
-(void)pause{
    //播放暂停
    [self.ZFPlayer pause];
}
-(void)inValid{
    self.ZFPlayer  = nil;
}
#pragma mark - AVAudioPlayer代理方法

/**
 播放结束自动调用
 
 @param player 音乐播放器
 @param flag 播放结束标志
 */
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"播放结束");
    [self inValid];
    if (_repeatMusic) {
        [self playBlcok:^{
            
        }];
    }
    _overBlock();
}
@end
