//
//  NavView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "NavView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "LoginUserInfo.h"
#import "UserInfoVC.h"

@implementation NavView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initBackBtn];
        [self initTitleLab];
        [self initMenuBtn];
        [self initUserNameBgImgView];
        [self initUserIconImgView];
        [self initUserNameLab];
        [self initMoneyLab];
        [self initMoneyImgView];
        [self initHeadImgView];
        [self initEmailBtn];
    }
    return self;
}
- (void)initBackBtn{
    _backBtn=[[UIButton alloc] init];
    [_backBtn setImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.left.equalTo(self.mas_left).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.mas_equalTo(25);
    }];
}
- (void)backBtnAction:(UIButton *)btn{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(NavViewDelegateComand:)]) {
        [self.delegate NavViewDelegateComand:_comand];
    }
}

-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"WanTongGuJi"];
    _titleLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backBtn.mas_right).offset(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.backBtn.mas_centerY).offset(0);
    }];
}

- (void)initMenuBtn{
    _menuBtn=[[UIButton alloc] init];
    [_menuBtn setImage:[UIImage imageNamed:@"menu_pressed"] forState:UIControlStateNormal];
    [_menuBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_menuBtn];
    [_menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.mas_top).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        make.width.mas_equalTo(30);
    }];
}
-(void)menuBtnAction:(UIButton*)btn{
    if (_settingMenuView==nil) {
        _settingMenuView=[[SettingMenuView alloc] init];
    }
    _settingMenuView.vc=_vc;
    [_vc.view addSubview:_settingMenuView];
    [_settingMenuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.vc.view.mas_right).offset(0);
        make.top.equalTo(self.vc.view.mas_top).offset(0);
        make.bottom.equalTo(self.vc.view.mas_bottom).offset(0);
        make.left.equalTo(self.vc.view.mas_left).offset(0);
    }];
    
}
- (void)initUserNameBgImgView{
    _userNameBgImgView=[[UIImageView alloc] init];
    _userNameBgImgView.image=[UIImage imageNamed:@"common_btn"];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_userNameBgImgView addGestureRecognizer:tapGesture];
    _userNameBgImgView.userInteractionEnabled=YES;
    [self addSubview:_userNameBgImgView];
    [_userNameBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.menuBtn.mas_left).offset(-10);
        make.top.equalTo(self.mas_top).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
}
- (void)initUserIconImgView{
    _userIconImgView=[[UIImageView alloc] init];
    _userIconImgView.image=[UIImage imageNamed:@"ac_icon"];
    [self.userNameBgImgView addSubview:_userIconImgView];
    [_userIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameBgImgView.mas_left).offset(5);
        make.top.equalTo(self.userNameBgImgView.mas_top).offset(2);
        make.bottom.equalTo(self.userNameBgImgView.mas_bottom).offset(-2);
        make.width.mas_equalTo(20);
    }];
}
- (void)initUserNameLab{
    _userNameLab=[[UILabel alloc] init];
    _userNameLab.text=[LoginUserInfo share].userModel.username;
    _userNameLab.textColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    _userNameLab.font=[UIFont systemFontOfSize:12];
    [self.userNameBgImgView addSubview:_userNameLab];
    [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userIconImgView.mas_right).offset(2);
        make.top.equalTo(self.userNameBgImgView.mas_top).offset(2);
        make.bottom.equalTo(self.userNameBgImgView.mas_bottom).offset(-2);
        make.right.equalTo(self.userNameBgImgView.mas_right).offset(-2);
    }];
}
- (void)initMoneyLab{
    _moneyLab=[[UILabel alloc] init];
    _moneyLab.text=[NSString stringWithFormat:@"%ld",[LoginUserInfo share].userModel.goldcoins];
    _moneyLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    _moneyLab.font=[UIFont systemFontOfSize:12];
    [self addSubview:_moneyLab];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_moneyLab addGestureRecognizer:tapGesture];
    _moneyLab.userInteractionEnabled=YES;
    [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.menuBtn.mas_left).offset(-10);
        make.top.equalTo(self.userNameBgImgView.mas_bottom).offset(5);
        make.width.mas_equalTo(80);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];
}
- (void)initMoneyImgView{
    _moneyImgView=[[UIImageView alloc] init];
    _moneyImgView.image=[UIImage imageNamed:@"balance_icon"];
    [self addSubview:_moneyImgView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_moneyImgView addGestureRecognizer:tapGesture];
    _moneyImgView.userInteractionEnabled=YES;
    [_moneyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moneyLab.mas_left).offset(-5);
        make.top.equalTo(self.userNameBgImgView.mas_bottom).offset(5);
        make.width.mas_equalTo(20);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];
}
- (void)initHeadImgView{
    _headImgView=[[UIImageView alloc] init];
    _headImgView.image=[UIImage imageNamed:@"headerImg"];
    [self addSubview:_headImgView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_headImgView addGestureRecognizer:tapGesture];
     _headImgView.userInteractionEnabled=YES;
    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moneyImgView.mas_left).offset(-5);
        make.top.equalTo(self.mas_top).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.mas_equalTo(0);
    }];
}
- (void)initEmailBtn{
    _emailBtn=[[UIButton alloc] init];
    [_emailBtn addTarget:self action:@selector(pushToUserInfoVC) forControlEvents:UIControlEventTouchUpInside];
    [_emailBtn setImage:[UIImage imageNamed:@"msg_btn"] forState:UIControlStateNormal];
    [self addSubview:_emailBtn];
    [_emailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headImgView.mas_left).offset(-5);
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.mas_equalTo(50);
    }];
}
-(void)pushToUserInfoVC{
    UserInfoVC *userInfoVC=[[UserInfoVC alloc] init];
    [_vc presentViewController:userInfoVC animated:YES completion:^{
        
    }];
}
@end
