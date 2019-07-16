//
//  LoginUserInfo.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/21.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"
#import "LoginfoUser.h"
#import "LoginInfoToken.h"

@interface LoginUserInfo : NSObject
@property (nonatomic,strong) LoginModel *model;
@property (nonatomic,strong) LoginfoUser *userModel;
@property (nonatomic,strong) LoginInfoToken *tokenModel;
@property (nonatomic,copy) NSString *userid;
@property (nonatomic,copy) NSString *token;
@property (nonatomic,strong) NSArray *games;
+(instancetype)share;
-(void)initDataWithData:(NSDictionary *)dic;
@end
