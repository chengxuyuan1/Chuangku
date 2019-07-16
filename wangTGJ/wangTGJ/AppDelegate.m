//
//  AppDelegate.m
//  万通国际
//
//  Created by 许传信 on 2018/8/13.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginVC.h"
//#import "iVersion.h"
//#import <IQKeyboardManager/IQKeyboardManager.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)initialize
{
    //set the bundle ID. normally you wouldn't need to do this
    //as it is picked up automatically from your Info.plist file
    //but we want to test with an app that's actually on the store
    
    //[iVersion sharedInstance].applicationBundleID = @"com.zhifu2.wangtongguoji";
    
    //configure iVersion. These paths are optional - if you don't set
    //them, iVersion will just get the release notes from iTunes directly (if your app is on the store)
    
//    [iVersion sharedInstance].updateURL=[NSURL URLWithString:@"itms-services://?action=download-manifest&url=https://raw.githubusercontent.com/chengxuyuan1/xxx/master/Example/manifest.plist"];
//    [iVersion sharedInstance].remoteVersionsPlistURL = @"https://raw.githubusercontent.com/chengxuyuan1/xxx/master/Example/versions.plist";
//    [iVersion sharedInstance].localVersionsPlistPath = @"versions.plist";
//    [[iVersion sharedInstance] checkIfNewVersion];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initLanguage];
    [self initLoginWindow];
    //将IQKeyboardManager 和 IQSegmentedNextPrevious类文件加进项目中。在AppDelegate文件中写下以下一行代码：
    
    //搞定！
    //也可以开启或者关闭keyboard avoiding功能：
    //[IQKeyboardManager sharedManager].enable=NO;
    return YES;
}
-(void)initLoginWindow{
    if (self.loginWindow==nil) {
        self.loginWindow=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.loginWindow.backgroundColor=[UIColor whiteColor];
        self.loginWindow.rootViewController=[[LoginVC alloc] init];
    }
    [self.loginWindow makeKeyAndVisible];
}
- (void)initWindow{
    if (self.window==nil) {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor=[UIColor whiteColor];
}

    
    
    [self.window makeKeyAndVisible];
}
- (void)initLanguage{
    NSString *localLanguage=[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"];
    if (localLanguage==nil) {
        NSArray *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"zh-Hans"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
             [[NSUserDefaults standardUserDefaults] synchronize];
        }
        else if ([language hasPrefix:@"en"]) {
                [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        else if ([language hasPrefix:@"zh-Hant"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
             [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    if (self.isForceLandscape) {
         return  UIInterfaceOrientationMaskLandscapeRight;
        //return UIInterfaceOrientationMaskLandscape;
      
    }else if (self.isForcePortrait){
        
        return UIInterfaceOrientationMaskPortrait;
    }
    
    return UIInterfaceOrientationMaskPortrait;
}

@end
