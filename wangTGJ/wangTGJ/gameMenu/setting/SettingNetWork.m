//
//  SettingNetWork.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/30.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "SettingNetWork.h"
#import "NetworkingAdress.h"
@implementation SettingNetWork
+(void)gameRecordTime:(NSString *)type Thispage:(NSString *)thispage Blcok:(SettingNetBlock)block{
 
    
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    //AFSecurityPolicy *policy = [AFSecurityPolicy defaultPolicy];
    AFSecurityPolicy *securityPolicy = [SettingNetWork customSecurityPolicy];
    manager.securityPolicy  = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"image/jpeg",@"text/plain", nil];
    
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:type forKey:@"type"];//0,1,2
    [dic setObject:thispage forKey:@"thispage"];
    NSString * host=[NSString stringWithFormat:@"%@:8888/user/gameRecord/list",kIPAdree];
    NSURLSessionDataTask *task=[manager GET:host parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"获取游戏记录成功:%@",data[@"message"]);
        block(data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取游戏记录失败:%@",error);
    }];
    [task resume];
}
+(void)expenseRecordTime:(NSString *)type Thispage:(NSString *)thispage Blcok:(SettingNetBlock)block{
    
    
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    //AFSecurityPolicy *policy = [AFSecurityPolicy defaultPolicy];
    AFSecurityPolicy *securityPolicy = [SettingNetWork customSecurityPolicy];
    manager.securityPolicy  = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"image/jpeg",@"text/plain", nil];
    
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:type forKey:@"type"];//0,1,2
    [dic setObject:thispage forKey:@"thispage"];
    NSString * host=[NSString stringWithFormat:@"%@:8888/user/expenseRecord/list",kIPAdree];
    NSURLSessionDataTask *task=[manager GET:host parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"获取流水记录成功:%@",data[@"message"]);
        block(data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取流水记录失败:%@",error);
    }];
    [task resume];
}
+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"keystore" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy;
    //securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    securityPolicy=[AFSecurityPolicy defaultPolicy];
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    //    [NSSet setWithObject:certData]
    //@[certData]
    //securityPolicy.pinnedCertificates = @[certData];
    
    return securityPolicy;
}

@end
