//
//  HelperHandle.m
//  万通国际
//
//  Created by 许传信 on 2018/8/13.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "HelperHandle.h"
#import "AppDelegate.h"
@implementation HelperHandle
+ (NSString *)getLanguage:(NSString *)key{
    NSString *lan=[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"];
    NSString *path=[[NSBundle mainBundle] pathForResource:lan ofType:@"lproj"];
    NSBundle *bundle=[NSBundle bundleWithPath:path];
    NSString *language;
    language = NSLocalizedStringFromTableInBundle(key, @"Languange", bundle, @"");
    return language;
}

+(BOOL)isNull:(id)data{
    if ([data isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}
#pragma  mark 横屏设置
//强制横屏
+(void)forceOrientationLandscape{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForceLandscape=YES;
    appdelegate.isForcePortrait=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:appdelegate.window];
}

//强制竖屏
+ (void)forceOrientationPortrait{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:appdelegate.window];
}
+(NSString *)isStrOrIsNum:(id)obj{
    if (obj==nil) {
        return @"";
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber *num=obj;
        NSString *str=num.stringValue;
        return str;
    }
    return obj;
}
+(NSString *)timeStamp:(NSString *)timeStampString{
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStampString doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
@end
