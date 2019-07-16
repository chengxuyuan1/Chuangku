//
//  PlayerView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/23.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _is_inited_player_ = NO;
        //拉流url可以自定义
        //_playback_url_ = @"rtmp://live.hkstv.hk.lxdns.com/live/hks";
        _stream_width_ = 480;
        _stream_height_ = 288;
        //当前屏幕宽高
        _screen_width_  = CGRectGetWidth([UIScreen mainScreen].bounds);
        _screen_height_ = CGRectGetHeight([UIScreen mainScreen].bounds);
        
        _player_view_width_ = _screen_width_;
        _player_view_height_ = _screen_height_;
        
//        [self InitPlayer];
//        [self StartPlayer];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeVideo:) name:@"changeVideo" object:nil];
    }
    
    return self;
}
-(void)changeVideo:(NSNotification *)niti{
    if ([self videoIsOn]) {
        [self InitPlayer];
        [self StartPlayer];
        }else{
            [self UnInitPlayer];
        }
}
-(BOOL)videoIsOn{
    NSUserDefaults *userDefaut=[NSUserDefaults standardUserDefaults];
    NSNumber *num=[userDefaut objectForKey:@"videoOn"];
    if (num==nil) {
        [userDefaut setObject:[NSNumber numberWithBool:YES] forKey:@"videoOn"];
        [userDefaut synchronize];
        num=[userDefaut objectForKey:@"videoOn"];
    }
    return [num boolValue];
}
-(bool)StartPlayer
{
    
    if (![self videoIsOn]) {
        return NO;
    }
    NSLog(@"StartPlayer++");
    
    if ( _smart_player_sdk == nil )
    {
        NSLog(@"StartPlayer, player SDK with nil");
        return false;
    }
    
    //设置视频view旋转角度
    [_smart_player_sdk SmartPlayerSetRotation:_rotate_degrees_];
    
    NSInteger videoDecoderMode = 1; //默认软解码
    [_smart_player_sdk SmartPlayerSetVideoDecoderMode:videoDecoderMode];
    
    if (_is_audio_only_) {
        [_smart_player_sdk SmartPlayerSetPlayView:nil];
    }
    else
    {
        //如果只需外部回调YUV数据，自己绘制，无需创建view和设置view到SDK
        _glView = (__bridge UIView *)([SmartPlayerSDK SmartPlayerCreatePlayView:0 y:0 width:_player_view_width_ height:_player_view_height_]);
        
        if (_glView == nil ) {
            NSLog(@"createPlayView failed..");
            return false;
        }
        
        [self addSubview:_glView];
        
        [_smart_player_sdk SmartPlayerSetPlayView:(__bridge void *)(_glView)];
    }
    
    NSInteger ret = [_smart_player_sdk SmartPlayerStart];
    
    if(ret != DANIULIVE_RETURN_OK)
    {
        NSLog(@"Call SmartPlayerStart failed..ret:%ld", (long)ret);
        return false;
    }
    
    NSLog(@"StartPlayer--");
    return true;
}
-(bool)StopPlayer
{
    NSLog(@"StopPlayer++");
    
    if (_smart_player_sdk != nil)
    {
        [_smart_player_sdk SmartPlayerStop];
    }
    
    if (!_is_audio_only_) {
        if (_glView != nil) {
            [_glView removeFromSuperview];
            [SmartPlayerSDK SmartPlayeReleasePlayView:(__bridge void *)(_glView)];
            _glView = nil;
        }
    }
    
    NSLog(@"StopPlayer--");
    return true;
}
-(bool)UnInitPlayer
{
    NSLog(@"UnInitPlayer++");
    
    if (_smart_player_sdk != nil)
    {
        [_smart_player_sdk SmartPlayerUnInitPlayer];
        _smart_player_sdk = nil;
    }
    
    _is_inited_player_ = NO;
    [_glView removeFromSuperview];
    NSLog(@"UnInitPlayer--");
    return true;
}
-(bool)InitPlayer
{
    NSLog(@"InitPlayer++");
    
    
    if(_is_inited_player_)
    {
        NSLog(@"InitPlayer: has inited before..");
        return true;
    }
    _smart_player_sdk = [[SmartPlayerSDK alloc] init];
    
    if (_smart_player_sdk ==nil ) {
        NSLog(@"SmartPlayerSDK init failed..");
        return false;
    }
    
    if (_playback_url_.length == 0) {
        NSLog(@"_streamUrl with nil..");
        return false;
    }
    
    if (_smart_player_sdk.delegate == nil)
    {
        _smart_player_sdk.delegate = self;
        NSLog(@"SmartPlayerSDK _player.delegate:%@", _smart_player_sdk);
    }
    
    NSInteger initRet = [_smart_player_sdk SmartPlayerInitPlayer];
    if ( initRet != DANIULIVE_RETURN_OK )
    {
        NSLog(@"SmartPlayerSDK call SmartPlayerInitPlayer failed, ret=%ld", (long)initRet);
        return false;
    }
    
    [_smart_player_sdk SmartPlayerSetPlayURL:_playback_url_];
    
    //超低延迟模式
    _is_low_latency_mode_ = NO;
    [_smart_player_sdk SmartPlayerSetLowLatencyMode:(NSInteger)_is_low_latency_mode_];
    
    _buffer_time_ = 0;
    if(_buffer_time_ >= 0)
    {
        [_smart_player_sdk SmartPlayerSetBuffer:_buffer_time_];
    }
    
    _is_fast_startup_ = YES;
    [_smart_player_sdk SmartPlayerSetFastStartup:(NSInteger)_is_fast_startup_];
    
    NSLog(@"[SmartPlayerV2]is_fast_startup_:%d, buffer_time_:%ld", _is_fast_startup_, (long)_buffer_time_);
    
    _is_rtsp_tcp_mode_ = NO;
    [_smart_player_sdk SmartPlayerSetRTSPTcpMode:_is_rtsp_tcp_mode_];
    
    NSInteger image_flag = 1;
    [_smart_player_sdk SmartPlayerSaveImageFlag:image_flag];
    
    //如需查看实时流量信息，可打开以下接口
    //NSInteger is_report = 1;
    //NSInteger report_interval = 1;
    //[_player SmartPlayerSetReportDownloadSpeed:is_report report_interval:report_interval];
    
    _is_inited_player_ = YES;
    
    NSLog(@"InitPlayer--");
    return true;
}

- (NSInteger) handleSmartPlayerEvent:(NSInteger)nID param1:(unsigned long long)param1 param2:(unsigned long long)param2 param3:(NSString*)param3 param4:(NSString*)param4 pObj:(void *)pObj;
{
    return 0;
    if (nID == EVENT_DANIULIVE_ERC_PLAYER_STARTED) {
        NSLog(@"[event]开始播放..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_CONNECTING)
    {
        NSLog(@"[event]连接中..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_CONNECTION_FAILED)
    {
        NSLog(@"[event]连接失败..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_CONNECTED)
    {
        NSLog(@"[event]已连接..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_DISCONNECTED)
    {
        NSLog(@"[event]断开连接..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_STOP)
    {
        NSLog(@"[event]停止播放..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_RESOLUTION_INFO)
    {
        _stream_width_ = (NSInteger)param1;
        _stream_height_ = (NSInteger)param2;
        NSLog(@"[event]视频解码分辨率信息..width:%ld, height:%ld", (long)_stream_width_, (long)_stream_height_);
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_NO_MEDIADATA_RECEIVED)
    {
        NSLog(@"[event]收不到RTMP数据..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_SWITCH_URL)
    {
        NSLog(@"[event]快速切换url..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_CAPTURE_IMAGE)
    {
        if ((int)param1 == 0)
        {
            NSLog(@"[event]快照成功: %@", param3);
            
            _tmp_path_ = param3;
            
            _image_path_ = [ UIImage imageNamed:param3];
            
            UIImageWriteToSavedPhotosAlbum(_image_path_, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        }
        else
        {
            NSLog(@"[event]快照失败: %@", param3);
        }
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_RECORDER_START_NEW_FILE)
    {
        NSLog(@"[event]录像写入新文件..文件名: %@", param3);
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_ONE_RECORDER_FILE_FINISHED)
    {
        NSLog(@"[event]一个录像文件完成..文件名: %@", param3);
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_START_BUFFERING)
    {
        //NSLog(@"[event]开始buffer..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_BUFFERING)
    {
        //NSLog(@"[event]buffer百分比: %lld", param1);
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_STOP_BUFFERING)
    {
        //NSLog(@"[event]停止buffer..");
    }
    else if (nID == EVENT_DANIULIVE_ERC_PLAYER_DOWNLOAD_SPEED)
    {
        NSInteger speed_kbps = (NSInteger)param1*8/1000;
        NSInteger speed_KBs = (NSInteger)param1/1024;
        
        NSLog(@"[event]download speed :%ld kbps - %ld KB/s", (long)speed_kbps, (long)speed_KBs);
    }
    else
        NSLog(@"[event]nID:%lx", (long)nID);
    
    return 0;
}
-(void)dealloc{
    [self StopPlayer];
    [self UnInitPlayer];
}
@end
