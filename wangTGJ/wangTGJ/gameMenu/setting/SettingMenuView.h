//
//  SettingMenuView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/6.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordMenuView.h"
@interface SettingMenuView : UIView
@property (nonatomic,strong) UIView *blackBgView;
@property (nonatomic,strong) UIView *leftBgView;
@property (nonatomic,strong) UIView *topBgView;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UIView *yellowLine;
@property (nonatomic,strong) UIButton *recordBtn;
@property (nonatomic,strong) UIButton *settingBtn;
@property (nonatomic,strong) UIButton *opiniongBtn;
@property (nonatomic,strong) UIButton *gameRulesBtn;
@property (nonatomic,strong) RecordMenuView *recordMenuView;
@property (nonatomic,weak) UIViewController *vc;
@end
