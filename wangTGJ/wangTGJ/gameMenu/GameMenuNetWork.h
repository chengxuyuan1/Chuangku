//
//  GameMenuNetWork.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
typedef void (^GameMenuBlcok)(id _Nullable data);
NS_ASSUME_NONNULL_BEGIN

@interface GameMenuNetWork : NSObject

+(void)payWithScore:(NSString *)score
         payChannel:(NSString *)payChannel
            tradeNo:(NSString *)tradeNo
          payNumber:(NSString *)payNumber
            payName:(NSString *)payName
           complete:(GameMenuBlcok)complete;
+(void)putForwardWithScore:(NSString *)score
            withdrawNumber:(NSString *)withdrawNumber
              withdrawName:(NSString *)withdrawName
                  trueName:(NSString *)trueName
               auditRemark:(NSString *)auditRemark
                  complete:(GameMenuBlcok)complete;
@end

NS_ASSUME_NONNULL_END
