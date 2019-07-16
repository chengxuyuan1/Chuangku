//
//  GameNetWorker.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/21.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GameNetWorker.h"
#import "NetworkingAdress.h"
@implementation GameNetWorker
-(instancetype)init{
    self=[super init];
    if (self) {
        self.socketHost=[NSString stringWithFormat:@"%@",@"103.231.167.85"];
        self.socketPort=[kPort integerValue];
    }
    return self;
}





@end
