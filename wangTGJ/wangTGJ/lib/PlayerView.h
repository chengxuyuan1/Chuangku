//
//  PlayerView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/23.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmartPlayerSDK.h"
@interface PlayerView : UIView<SmartPlayerDelegate>
@property (nonatomic,strong)  SmartPlayerSDK  *smart_player_sdk;
@property (nonatomic,copy)  NSString *playback_url_; //拉流url
@property (nonatomic,assign) NSInteger rotate_degrees_; //view旋转角度 0则不旋转
@property (nonatomic,assign) Boolean is_audio_only_;
@property (nonatomic,assign) UIView * glView;
@property (nonatomic,assign) Boolean  is_inited_player_;
@property (nonatomic,assign) Boolean  is_low_latency_mode_;//是否开启极速模式
@property (nonatomic,assign) NSInteger buffer_time_;//buffer时间
@property (nonatomic,assign) Boolean  is_fast_startup_;//是否快速启动模式
@property (nonatomic,assign) Boolean is_rtsp_tcp_mode_;//仅用于rtsp流，设置TCP传输模式
@property (nonatomic,assign) NSInteger stream_width_;  //视频宽
@property (nonatomic,assign) NSInteger  stream_height_;//视频高
@property (nonatomic,strong) UIImage  *image_path_;
@property (nonatomic,assign) NSString   *tmp_path_;
@property (nonatomic,assign) NSInteger  player_view_width_;
@property (nonatomic,assign) NSInteger   player_view_height_;
@property (nonatomic,assign) NSInteger  screen_width_;
@property (nonatomic,assign) NSInteger   screen_height_;
-(bool)StartPlayer;
-(bool)StopPlayer;
-(bool)UnInitPlayer;
-(bool)InitPlayer;
@end
