//
//  GameNetWorker.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/21.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameNetWorker : NSObject

//心跳通过计时器来实现
@property (nonatomic, retain) NSTimer *connectTimer; // 计时器
@property (nonatomic,copy) NSString *socketHost;
@property (nonatomic,assign) UInt64 socketPort;
// socket连接

-(void)socketConnectHost;
// 切断socket

-(void)cutOffSocket;
@end
