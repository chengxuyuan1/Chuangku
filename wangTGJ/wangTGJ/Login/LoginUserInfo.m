
//
//  LoginUserInfo.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/21.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "LoginUserInfo.h"

@implementation LoginUserInfo
+(instancetype)share{
    static LoginUserInfo *loginUserInfo;
    if (loginUserInfo==nil) {
        loginUserInfo=[[LoginUserInfo alloc] init];
       
    }
    return loginUserInfo;
}
-(void)initDataWithData:(NSDictionary *)dic{
//    _model=[[LoginModel alloc] init];
//    _model.userid=dic[@"data"][@"user"][];
//    _model.token=@"8f0f1b72ab7b4a689f4d0385bf359624";
    
    _games=dic[@"data"][@"games"];
    _userModel=[[LoginfoUser alloc] init];
    _userModel.username=dic[@"data"][@"user"][@"username"];
    _userModel.goldcoins=[dic[@"data"][@"user"][@"availableAmount"] integerValue];//availableAmount
    
    
//    _tokenModel=[[LoginInfoToken alloc] init];
//    _tokenModel.id=@"8f0f1b72ab7b4a689f4d0385bf359624";
//    _tokenModel.userid=@"1c780bc079544a66b05dd24d70c3248";
//    _tokenModel.ip=@"120.239.70.24";
}
@end
