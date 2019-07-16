//
//  token.h
//  __projectName__
//
//  Created by xuchuanxin on 18/08/21.
//  Copyright © 2018年 xuchuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfoToken : NSObject

@property (nonatomic, strong) NSString * client;
@property (nonatomic, strong) NSString * creater;
@property (nonatomic, assign) long createtime;
@property (nonatomic, assign) long exptime;
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * ip;
@property (nonatomic, assign) long lastlogintime;
@property (nonatomic, strong) NSString * orgi;
@property (nonatomic, assign) long passupdatetime;
@property (nonatomic, strong) NSString * region;
@property (nonatomic, strong) NSString * token;
@property (nonatomic, assign) long updatetime;
@property (nonatomic, strong) NSString * userid;

@end
