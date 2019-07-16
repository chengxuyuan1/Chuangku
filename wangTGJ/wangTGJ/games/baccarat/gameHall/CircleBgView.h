//
//  CircleBgView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZCircleProgress.h"

@interface CircleBgView : UIView
@property (nonatomic,strong) ZZCircleProgress *circle;
@property (nonatomic,strong) NSTimer *labelTimer;
@property (nonatomic,assign) CGFloat progressFlag;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) CGFloat progress;

@end
