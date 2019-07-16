//
//  AppDelegate.h
//  万通国际
//
//  Created by 许传信 on 2018/8/13.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *loginWindow;
@property (assign , nonatomic) BOOL isForceLandscape;
@property (assign , nonatomic) BOOL isForcePortrait;
- (void)initLoginWindow;
- (void)initWindow;
@end

