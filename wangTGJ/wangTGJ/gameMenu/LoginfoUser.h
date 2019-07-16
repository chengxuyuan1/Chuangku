//
//  user.h
//  __projectName__
//
//  Created by xuchuanxin on 18/08/21.
//  Copyright © 2018年 xuchuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginfoUser : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * command;
@property (nonatomic, strong) NSString * creater;
@property (nonatomic, assign) long createtime;
@property (nonatomic, assign) BOOL datastatus;
@property (nonatomic, strong) NSString * gamestatus;
@property (nonatomic, assign) long goldcoins;
@property (nonatomic, assign) BOOL headimg;
@property (nonatomic, strong) NSString * id;
@property (nonatomic, assign) long lastlogintime;
@property (nonatomic, assign) BOOL login;
@property (nonatomic, strong) NSString * memo;
@property (nonatomic, assign) BOOL online;
@property (nonatomic, assign) long passupdatetime;
@property (nonatomic, strong) NSString * playertype;
@property (nonatomic, strong) NSString * province;
@property (nonatomic, strong) NSString * roomid;
@property (nonatomic, assign) BOOL roomready;
@property (nonatomic, strong) NSString * sign;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * token;
@property (nonatomic, assign) long updatetime;
@property (nonatomic, strong) NSString * username;

@end
