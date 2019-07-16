//
//  SmartPlayerSDK.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/26.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "SmartPlayerSDK.h"

@implementation SmartPlayerSDK
/**
 * 初始化，创建player实例
 * <pre>此接口请第一个调用</pre>
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerInitPlayer{
    return 0;
}

/**
 * 设置视频解码模式
 *
 * @param mode
 * if 0: 软解码;
 * if 1: 硬解码.
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetVideoDecoderMode:(NSInteger)mode{
    return 0;
}

/**
 * 创建播放view
 *
 * @param x y width height 指定播放位置（CGRect)
 */
+ (void*)SmartPlayerCreatePlayView:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height{return nil;}

/**
 * 释放播放view
 *
 * @param playView 对应SmartPlayerCreatePlayView创建的view
 */
+(void) SmartPlayeReleasePlayView:(void*)playView{
    
}

/**
 * 设置播放view
 *
 * @param playView SmartPlayerCreatePlayView创建的view
 *
 * @return {0} if successful
 */
- (NSInteger) SmartPlayerSetPlayView:(void*) playView{return 0;}

/**
 * 设置拉流时，视频YUV数据回调
 *
 * @param isEnableYuvBlock 默认false，如需回调YUV数据自己绘制，设置为true
 *
 * @return {0} if successful
 */
- (NSInteger) SmartPlayerSetYuvBlock:(Boolean)isEnableYuvBlock{return 0;}

/**
 * 设置拉流时，视频数据回调
 *
 * @param isEnablePSVideoDataBlock 默认false，如需拉流时，视频数据回调(比如视频转发之用)，设置为true
 *
 * @return {0} if successful
 */
-(NSInteger)SmartPlayerSetPullStreamVideoDataBlock:(Boolean)isEnablePSVideoDataBlock{
    return 0;
}

/**
 * 设置拉流时，音频数据回调
 *
 * @param isEnablePSAudioDataBlock 默认false，如需拉流时，视频数据回调(比如视频转发之用)，设置为true
 *
 * @return {0} if successful
 */
- (NSInteger) SmartPlayerSetPullStreamAudioDataBlock:(Boolean)isEnablePSAudioDataBlock{return 0;}

/**
 * 设置player buffer
 *
 * @param buffer Unit is millisecond, range is 200-5000 ms
 *
 * @return {0} if successful
 */
- (NSInteger) SmartPlayerSetBuffer:(NSInteger) buffer{return 0;}

/**
 * 此接口仅用于播放RTSP流时有效
 *
 * RTSP播放，默认采用UDP
 *
 * @param isUsingTCP 设置为true, 走TCP模式，false为UDP模式
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetRTSPTcpMode:(Boolean)isUsingTCP{return 0;}

/**
 * Set fast startup(快速启动)
 *
 * @param isFastStartup 1: 快速启动; 0: not.
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetFastStartup:(NSInteger)isFastStartup{return 0;}

/**
 * Set low lantency mode(设置超低延迟模式)
 *
 * @param mode 1: 超低延迟模式; 0: not.
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetLowLatencyMode:(NSInteger)mode{return 0;}

/**
 * 设置顺时针旋转, 注意除了0度之外， 其他角度都会额外消耗性能
 *
 * @param degress 当前支持 0度，90度, 180度, 270度 旋转
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetRotation:(NSInteger)degress{return 0;}

/*
 * 设置下载速度上报, 默认不上报下载速度
 *
 * @param is_report: 上报开关, 1: 表上报. 0: 表示不上报. 其他值无效.
 *
 * @param report_interval 上报时间间隔（上报频率），单位是秒，最小值是1秒1次. 如果小于1且设置了上报，将调用失败
 *
 * 上报事件是：EVENT_DANIULIVE_ERC_PLAYER_DOWNLOAD_SPEED
 *
 * 此接口必须在Start之前调用
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetReportDownloadSpeed:(NSInteger)is_report report_interval:(NSInteger)report_interval{return 0;}

/**
 * 设置播放URL
 *
 * @param url 需要播放的URL
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetPlayURL:(NSString *)url{return 0;}

/**
 * Set if needs to save image during playback stream(设置是否启用快照功能)
 *
 * @param is_save_image 1 通过SmartPlayerSaveCurImage()保存当前image, 0: 不保存
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSaveImageFlag:(NSInteger) is_save_image{return 0;}

/**
 * Save current image during playback stream(快照)
 *
 * @param imageName 设置包含全路径的名字
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSaveCurImage:(NSString*) imageName{return 0;}

/**
 * 开始播放
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerStart{return 0;}

/**
 * 快速切换播放url
 *
 * @param url 需要快速切换的新的url, 比如高低分辨率切换/双摄像头URL切换等
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSwitchPlaybackUrl:(NSString *)url{return 0;}

/**
 * 设置播放过程中静音/取消静音
 *
 * @param mute 1: 静音 0: not
 *
 * @return {0} if successful
 */
- (NSInteger) SmartPlayerSetMute:(NSInteger) mute{return 0;}


/**
 * 停止播放
 *
 * @return {0} if successful
 */
- (NSInteger) SmartPlayerStop{return 0;}

/**
 * 录像相关：
 *
 * @param path 录像文件存放目录
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetRecorderDirectory:(NSString*)path{return 0;}

/**
 * 录像相关：
 *
 * @param size 每个录像文件的大小 (5~500M), 默认200M
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerSetRecorderFileMaxSize:(NSInteger)size{return 0;}

/**
 * 录像相关：
 *
 * Start recorder(开始录像)
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerStartRecorder{return 0;}

/**
 * 录像相关：
 *
 * Stop recorder(停止录像)
 *
 * @return {0} if successful
 */
- (NSInteger)SmartPlayerStopRecorder{return 0;}

/*
 * 启动拉流
 *
 * Start pull stream(开始拉流)
 */
- (NSInteger)SmartPlayerStartPullStream{return 0;}

/*
 * 停止拉流
 *
 * Stop pull stream(停止拉流)
 */
- (NSInteger)SmartPlayerStopPullStream{return 0;}

/**
 * 销毁player实例
 *
 * @return {0} if successful
 */
- (NSInteger) SmartPlayerUnInitPlayer{return 0;}

/**
 *  获取当前sdk的版本号
 */
-(NSString*) SmartPlayerGetSDKVersionID{return 0;}



@end
