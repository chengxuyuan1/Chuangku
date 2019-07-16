//
//  NavView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingMenuView.h"
@protocol NavViewDelegate<NSObject>
-(void)NavViewDelegateComand:(NSString *)comand;
@end

@interface NavView : UIView
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *menuBtn;
@property (nonatomic,strong) UIImageView *userNameBgImgView;
@property (nonatomic,strong) UIImageView *userIconImgView;
@property  (nonatomic,strong) UILabel *userNameLab;
@property (nonatomic,strong) UIImageView *moneyImgView;
@property (nonatomic,strong) UILabel *moneyLab;
@property (nonatomic,strong) UIImageView *headImgView;
@property (nonatomic,strong) UIButton *emailBtn;
@property (nonatomic,assign) id<NavViewDelegate>delegate;
@property (nonatomic,copy) NSString *comand;
@property (nonatomic,strong) SettingMenuView *settingMenuView;
@property (nonatomic,strong) UIViewController *vc;

@end
