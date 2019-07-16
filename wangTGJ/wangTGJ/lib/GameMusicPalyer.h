//
//  GameMusicPalyer.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/4.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
typedef void (^MusicBlock)(void);
@interface GameMusicPalyer : NSObject<AVAudioPlayerDelegate>
@property(nonatomic,strong) AVAudioPlayer *ZFPlayer;
@property(nonatomic,strong) NSString *mp3url;
@property(nonatomic,assign) BOOL repeatMusic;
@property(nonatomic,copy) MusicBlock overBlock;
-(void)playBlcok:(MusicBlock)block;
-(void)pause;
-(void)inValid;
@end
