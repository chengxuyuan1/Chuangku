//
//  SettingNetWork.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/30.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
typedef void (^SettingNetBlock)(id data);
NS_ASSUME_NONNULL_BEGIN

@interface SettingNetWork : NSObject
+(void)gameRecordTime:(NSString *)type Thispage:(NSString *)thispage Blcok:(SettingNetBlock)block;
+(void)expenseRecordTime:(NSString *)type Thispage:(NSString *)thispage Blcok:(SettingNetBlock)block;
@end

NS_ASSUME_NONNULL_END
