//
//  LoginNetWork.m
//  万通国际
//
//  Created by 许传信 on 2018/8/16.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "LoginNetWork.h"

#import "NetworkingAdress.h"


@implementation LoginNetWork
-(instancetype)init{
    self=[super init];
    if (self) {
       
        
    }
    return self;
}

-(void)loginNewWorkingWithUserName:(NSString *)username PassWord:(NSString *)password type:(NSInteger)type Blcok:(blk_k)block{
    _LoginBlock=block;
    
      AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    //AFSecurityPolicy *policy = [AFSecurityPolicy defaultPolicy];
    AFSecurityPolicy *securityPolicy = [LoginNetWork customSecurityPolicy];
    manager.securityPolicy  = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"image/jpeg",@"text/plain", nil];


    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:username forKey:@"username"];
    [dic setObject:password forKey:@"password"];
    [dic setObject:[NSNumber numberWithInteger:type] forKey:@"type"];
    NSString * host=[NSString stringWithFormat:@"%@:8888/user/login",kIPAdree];
    NSURLSessionDataTask *task=[manager POST:host parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"%@",data);
        self.LoginBlock(data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    [task resume];
}
-(void)loginAuthWithAuth:(NSString *)auth userId:(NSString *)userid Blcok:(blk_k)block{
    if (userid==nil) {
        return;
    }
    _authBlock=block;
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    //AFSecurityPolicy *policy = [AFSecurityPolicy defaultPolicy];
    AFSecurityPolicy *securityPolicy = [LoginNetWork customSecurityPolicy];
    manager.securityPolicy  = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"image/jpeg",@"text/plain", nil];
    
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:auth forKey:@"auth"];
    [dic setObject:userid forKey:@"userid"];
   //__weak __typeof(self)weakSelf = self;
    NSString * host=[NSString stringWithFormat:@"%@:8888/user/login/validateAuthorization",kIPAdree];
    NSURLSessionDataTask *task=[manager GET:host parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"%@",data);
        //NSString *json=[weakSelf jsonWithDic:data];
        self.authBlock(data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    [task resume];
}
+(void)registerWithUserName:(NSString *)userName Pwd:(NSString *)pwd Blcok:(blk_k)block{
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    //AFSecurityPolicy *policy = [AFSecurityPolicy defaultPolicy];
    AFSecurityPolicy *securityPolicy = [LoginNetWork customSecurityPolicy];
    manager.securityPolicy  = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"image/jpeg",@"text/plain", nil];
    
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:userName forKey:@"username"];
    [dic setObject:pwd forKey:@"password"];
    //__weak __typeof(self)weakSelf = self;
    NSString * host=[NSString stringWithFormat:@"%@:8888/user/register",kIPAdree];
    NSURLSessionDataTask *task=[manager POST:host parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        
        NSLog(@"%@",data);
        block(data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    [task resume];
}
-(NSString *)jsonWithDic:(NSDictionary *)dic{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:kNilOptions
                                                         error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    
    return jsonString;
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
