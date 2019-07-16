//
//  RegisterVC.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/14.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^registerBlock)(NSString * username);
@interface RegisterVC : UIViewController
@property (nonatomic,copy) registerBlock resultBlock;
-(void)registerResult:(registerBlock)success;
@end
