//
//  LoginNetWork.h
//  万通国际
//
//  Created by 许传信 on 2018/8/16.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
typedef void (^blk_k)(id data);
@interface LoginNetWork : NSObject
@property (nonatomic,copy) blk_k LoginBlock;
@property (nonatomic,copy) blk_k authBlock;

-(void)loginNewWorkingWithUserName:(NSString *)username PassWord:(NSString *)password type:(NSInteger)type Blcok:(blk_k)block;
-(void)loginAuthWithAuth:(NSString *)auth userId:(NSString *)userid Blcok:(blk_k)block;
+(void)registerWithUserName:(NSString *)userName Pwd:(NSString *)pwd Blcok:(blk_k)block;
@end
