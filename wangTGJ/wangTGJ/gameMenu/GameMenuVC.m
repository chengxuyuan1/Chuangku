//
//  GameMenuVC.m
//  万通国际
//
//  Created by 许传信 on 2018/8/14.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GameMenuVC.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "HotGamebgView.h"
#import "VideoGameBgView.h"
#import "StreetMachineGameBgView.h"
#import "ChessCardGameBgView.h"
#import "GameHallVC.h"
#import "LoginUserInfo.h"
#import "SettingMenuView.h"
#import "UserInfoVC.h"
#import "AppDelegate.h"
#import "RoyalVCViewController.h"
@interface GameMenuVC ()<HotGameBgViewDelegate,VideoGameBgViewDelegate>
@property (nonatomic,strong) UIView *navView;
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
@property (nonatomic,strong) UIView *whiteLine;
@property (nonatomic,strong) UIView *blackLine;
@property (nonatomic,strong) UIButton *hotGameBtn;
@property (nonatomic,strong) UIButton *videoGameBtn;
@property (nonatomic,strong) UIButton *streetMachineGameBtn;
@property (nonatomic,strong) UIButton *chessCardGameBtn;
@property (nonatomic,strong) UIView *onlineNumBgView;
@property (nonatomic,strong) UILabel *onlineTitleLab;
@property (nonatomic,strong) UILabel *onlineNumLab;
@property (nonatomic,strong) HotGamebgView *hotGameBgView;
@property (nonatomic,strong) VideoGameBgView *videoGameBgView;
@property (nonatomic,strong) StreetMachineGameBgView *streetMachineGameBgView;
@property (nonatomic,strong) ChessCardGameBgView *chessCardGameBgView;
@property (nonatomic,strong) SettingMenuView *settingMenuView;
@property (nonatomic,assign) BOOL isSeting;
@property (nonatomic,assign) CGFloat leftF;
@end

@implementation GameMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    _leftF=isIphoneX;
   
    
   
    [self initNavView];
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
    [self initWhiteLine];
    [self initBlackLine];
    [self initHotGameBtn];
    [self initVideoGameBtn];
    [self initStreetMachineGameBtn];
    [self initChessCardGameBtn];
    [self initOnlineNumBgView];
    //[self initOnlineTitleLab];
    //[self initOnlineNumLab];
    // 表示本类支持旋转
    [UIViewController attemptRotationToDeviceOrientation];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
}
-(void)updateLanguage{
    _titleLab.text=[HelperHandle getLanguage:@"WanTongGuJi"];
    [_videoGameBtn setTitle:[HelperHandle getLanguage:@"视讯游戏"] forState:UIControlStateNormal];
    [_streetMachineGameBtn setTitle:[HelperHandle getLanguage:@"街机游戏"] forState:UIControlStateNormal];
     [_chessCardGameBtn setTitle:[HelperHandle getLanguage:@"我的钱包"] forState:UIControlStateNormal];
    [_hotGameBtn setTitle:[HelperHandle getLanguage:@"热门/最新"] forState:UIControlStateNormal];
}
- (void)initNavView{
    _navView=[[UIView alloc] init];
    _navView.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    [self.view addSubview:_navView];
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
    }];
}
- (void)initBackBtn{
    _backBtn=[[UIButton alloc] init];
    [_backBtn setImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:_backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_top).offset(10);
        make.left.equalTo(self.navView.mas_left).offset(10);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-10);
        make.width.mas_equalTo(25);
    }];
}
- (void)backBtnAction:(UIButton *)btn{
    exit(0);
}

-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"WanTongGuJi"];
    _titleLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    _titleLab.numberOfLines=2;
    _titleLab.lineBreakMode=NSLineBreakByCharWrapping;
    [_navView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backBtn.mas_right).offset(10);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.backBtn.mas_centerY).offset(0);
    }];
}

- (void)initMenuBtn{
    _menuBtn=[[UIButton alloc] init];
    [_menuBtn setImage:[UIImage imageNamed:@"menu_pressed"] forState:UIControlStateNormal];
    [_menuBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_menuBtn];
    [_menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navView.mas_right).offset(-10);
        make.top.equalTo(self.navView.mas_top).offset(15);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-15);
        make.width.mas_equalTo(30);
    }];
}
-(void)menuBtnAction:(UIButton*)btn{
    if (_settingMenuView==nil) {
        _settingMenuView=[[SettingMenuView alloc] init];
    }
    _settingMenuView.vc=self;
    [self.view addSubview:_settingMenuView];
    [_settingMenuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
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
    [self.navView addSubview:_userNameBgImgView];
    [_userNameBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.menuBtn.mas_left).offset(-10);
        make.top.equalTo(self.navView.mas_top).offset(10);
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
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_moneyLab addGestureRecognizer:tapGesture];
    _moneyLab.userInteractionEnabled=YES;
    [self.navView addSubview:_moneyLab];
    [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.menuBtn.mas_left).offset(-10);
        make.top.equalTo(self.userNameBgImgView.mas_bottom).offset(5);
        make.width.mas_equalTo(80);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-5);
    }];
}
- (void)initMoneyImgView{
    _moneyImgView=[[UIImageView alloc] init];
    _moneyImgView.image=[UIImage imageNamed:@"balance_icon"];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_moneyImgView addGestureRecognizer:tapGesture];
    _moneyImgView.userInteractionEnabled=YES;
    [self.navView addSubview:_moneyImgView];
    [_moneyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moneyLab.mas_left).offset(-5);
        make.top.equalTo(self.userNameBgImgView.mas_bottom).offset(5);
        make.width.mas_equalTo(20);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-5);
    }];
}
- (void)initHeadImgView{
    _headImgView=[[UIImageView alloc] init];
    _headImgView.image=[UIImage imageNamed:@"headerImg"];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_headImgView addGestureRecognizer:tapGesture];
    _headImgView.userInteractionEnabled=YES;
    [self.navView addSubview:_headImgView];
    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moneyImgView.mas_left).offset(-5);
        make.top.equalTo(self.navView.mas_top).offset(5);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-5);
        //make.width.mas_equalTo(50);
        make.width.mas_equalTo(0);
    }];
}
- (void)initEmailBtn{
    _emailBtn=[[UIButton alloc] init];
    [_emailBtn setImage:[UIImage imageNamed:@"msg_btn"] forState:UIControlStateNormal];
    [_emailBtn addTarget:self action:@selector(pushToUserInfoVC) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:_emailBtn];
    [_emailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headImgView.mas_left).offset(-5);
        make.top.equalTo(self.navView.mas_top).offset(10);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-10);
        make.width.mas_equalTo(50);
    }];
}
-(void)pushToUserInfoVC{
    UserInfoVC *userInfoVC=[[UserInfoVC alloc] init];
    [self presentViewController:userInfoVC animated:YES completion:^{
        
    }];
}
- (void)initWhiteLine{
    _whiteLine=[[UIView alloc] init];
    _whiteLine.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_whiteLine];
    [_whiteLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(1);
    }];
}
- (void)initBlackLine{
    _blackLine=[[UIView alloc] init];
    _blackLine.backgroundColor=[UIColor blackColor];
    [self.view addSubview:_blackLine];
    [_blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteLine.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(140+self.leftF);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.width.mas_equalTo(1);
    }];
}
- (void)initHotGameBtn{
    _hotGameBtn=[[UIButton alloc] init];
    [_hotGameBtn setTitle:[HelperHandle getLanguage:@"热门/最新"] forState:UIControlStateNormal];
    [_hotGameBtn setBackgroundImage:[UIImage imageNamed:@"lobby_meun_select"] forState:UIControlStateSelected];
    [_hotGameBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
    [_hotGameBtn setTitleColor:[UIColor colorWithRed:91/255.0 green:65/255.0 blue:43/255.0 alpha:1] forState:UIControlStateSelected];
    [_hotGameBtn addTarget:self action:@selector(hotGameBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _hotGameBtn.selected=YES;
    [self.view addSubview:_hotGameBtn];
    
    [_hotGameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteLine.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(150+self.leftF);
        make.height.mas_equalTo(50);
    }];
    
    [self.view insertSubview:self.hotGameBgView atIndex:0];
    [self.hotGameBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.whiteLine).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
}
-(void)hotGameBtnAction:(UIButton *)btn{
    btn.selected=YES;
    _videoGameBtn.selected=NO;
    _streetMachineGameBtn.selected=NO;
    _chessCardGameBtn.selected=NO;
    
    [self.videoGameBgView removeFromSuperview];
    [self.streetMachineGameBgView removeFromSuperview];
     [self.chessCardGameBgView removeFromSuperview];
    
    [self.view insertSubview:self.hotGameBgView atIndex:0];
    [self.hotGameBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.whiteLine).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
}
- (void)initVideoGameBtn{
    _videoGameBtn=[[UIButton alloc] init];
    [_videoGameBtn setTitle:[HelperHandle getLanguage:@"视讯游戏"] forState:UIControlStateNormal];
    [_videoGameBtn setBackgroundImage:[UIImage imageNamed:@"lobby_meun_select"] forState:UIControlStateSelected];
    [_videoGameBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
    [_videoGameBtn setTitleColor:[UIColor colorWithRed:91/255.0 green:65/255.0 blue:43/255.0 alpha:1] forState:UIControlStateSelected];
    [_videoGameBtn addTarget:self action:@selector(videoGameBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_videoGameBtn];
    [_videoGameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotGameBtn.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(self.hotGameBtn.mas_width);
        make.height.mas_equalTo(50);
    }];
}
-(void)videoGameBtnAction:(UIButton *)btn{
    btn.selected=YES;
    _hotGameBtn.selected=NO;
    _streetMachineGameBtn.selected=NO;
    _chessCardGameBtn.selected=NO;
    
    [self.hotGameBgView removeFromSuperview];
    [self.streetMachineGameBgView removeFromSuperview];
     [self.chessCardGameBgView removeFromSuperview];
    
    [self.view insertSubview:self.videoGameBgView atIndex:0];
    [self.videoGameBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.whiteLine).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
}
- (void)initStreetMachineGameBtn{
    _streetMachineGameBtn=[[UIButton alloc] init];
    [_streetMachineGameBtn setTitle:[HelperHandle getLanguage:@"街机游戏"] forState:UIControlStateNormal];
    [_streetMachineGameBtn setBackgroundImage:[UIImage imageNamed:@"lobby_meun_select"] forState:UIControlStateSelected];
    [_streetMachineGameBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
    [_streetMachineGameBtn setTitleColor:[UIColor colorWithRed:91/255.0 green:65/255.0 blue:43/255.0 alpha:1] forState:UIControlStateSelected];
    [_streetMachineGameBtn addTarget:self action:@selector(streetMachineGameBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_streetMachineGameBtn];
    [_streetMachineGameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.videoGameBtn.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(self.hotGameBtn.mas_width);
        make.height.mas_equalTo(50);
    }];
}
-(void)streetMachineGameBtnAction:(UIButton *)btn{
    btn.selected=YES;
    _hotGameBtn.selected=NO;
    _videoGameBtn.selected=NO;
    _chessCardGameBtn.selected=NO;
    
    [self.hotGameBgView removeFromSuperview];
    [self.videoGameBgView removeFromSuperview];
    [self.chessCardGameBgView removeFromSuperview];
    
    [self.view insertSubview:self.streetMachineGameBgView atIndex:0];
    [self.streetMachineGameBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.whiteLine).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
}
- (void)initChessCardGameBtn{
    _chessCardGameBtn=[[UIButton alloc] init];
    [_chessCardGameBtn setTitle:[HelperHandle getLanguage:@"我的钱包"] forState:UIControlStateNormal];
    [_chessCardGameBtn setBackgroundImage:[UIImage imageNamed:@"lobby_meun_select"] forState:UIControlStateSelected];
    [_chessCardGameBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
    [_chessCardGameBtn setTitleColor:[UIColor colorWithRed:91/255.0 green:65/255.0 blue:43/255.0 alpha:1] forState:UIControlStateSelected];
    [_chessCardGameBtn addTarget:self action:@selector(chessCardGameBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_chessCardGameBtn];
    [_chessCardGameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.streetMachineGameBtn.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(self.hotGameBtn.mas_width);
        make.height.mas_equalTo(50);
    }];
}
-(void)chessCardGameBtnAction:(UIButton *)btn{
    btn.selected=YES;
    _hotGameBtn.selected=NO;
    _videoGameBtn.selected=NO;
    _streetMachineGameBtn.selected=NO;
    
    [self.hotGameBgView removeFromSuperview];
    [self.videoGameBgView removeFromSuperview];
    [self.streetMachineGameBgView removeFromSuperview];
    
    [self.view insertSubview:self.chessCardGameBgView atIndex:0];
    [self.chessCardGameBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.whiteLine).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
}

- (void)initOnlineNumBgView{
    _onlineNumBgView=[[UIView alloc] init];
    _onlineNumBgView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:_onlineNumBgView];
    [_onlineNumBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.top.equalTo(self.chessCardGameBtn.mas_bottom).offset(0);
        make.right.equalTo(self.blackLine.mas_left).offset(0);
    }];
}

- (void)initOnlineTitleLab{
    _onlineTitleLab=[[UILabel alloc] init];
    _onlineTitleLab.text=[HelperHandle getLanguage:@"在线人数:"];
    _onlineTitleLab.textColor=[UIColor whiteColor];
    _onlineTitleLab.font=[UIFont systemFontOfSize:12];
    [self.onlineNumBgView addSubview:_onlineTitleLab];
    [_onlineTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.onlineNumBgView.mas_left).offset(10);
        make.centerY.equalTo(self.onlineNumBgView.mas_centerY).offset(0);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
}
-(void)initOnlineNumLab{
    _onlineNumLab=[[UILabel alloc] init];
    _onlineNumLab.text=@"234565";
    _onlineNumLab.textColor=[UIColor whiteColor];
    _onlineNumLab.font=[UIFont systemFontOfSize:12];
    [self.onlineNumBgView addSubview:_onlineNumLab];
    [_onlineNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.onlineTitleLab.mas_right).offset(5);
        make.centerY.equalTo(self.onlineNumBgView.mas_centerY).offset(0);
        make.right.equalTo(self.onlineNumBgView.mas_right).offset(-10);
        make.height.mas_equalTo(30);
    }];
}

-(HotGamebgView *)hotGameBgView{
    if (_hotGameBgView==nil) {
        _hotGameBgView=[[HotGamebgView alloc] init];
        _hotGameBgView.delegate=self;
    }
    return _hotGameBgView;
}
- (VideoGameBgView *)videoGameBgView{
    if (_videoGameBgView==nil) {
        _videoGameBgView=[[VideoGameBgView alloc] init];
        _videoGameBgView.delegate=self;
    }
    return _videoGameBgView;
}
- (StreetMachineGameBgView *)streetMachineGameBgView{
    if (_streetMachineGameBgView==nil) {
        _streetMachineGameBgView=[[StreetMachineGameBgView alloc] init];
    }
    return _streetMachineGameBgView;
}
- (ChessCardGameBgView *)chessCardGameBgView{
    if (_chessCardGameBgView==nil) {
        _chessCardGameBgView=[[ChessCardGameBgView alloc] init];
    }
    return _chessCardGameBgView;
}



-(void)hotGameViewDelegateIndex:(NSString *)title{
    if ([title isEqualToString:[HelperHandle getLanguage:@"百家乐"]]) {
        GameHallVC *gameHallVC=[[GameHallVC alloc] init];
        gameHallVC.titleStr=@"百家乐";
        [self presentViewController:gameHallVC animated:YES completion:^{
            
        }];
    }
    if ([title isEqualToString:[HelperHandle getLanguage:@"皇家国际"]]) {
        [self  forceOrientationPortrait ];
        RoyalVCViewController *royalVC=[[RoyalVCViewController alloc] init];
        [self presentViewController:royalVC animated:YES completion:^{
            
        }];
    }
    
}
-(void)videoGameBgViewDelegateIndex:(NSString *)title{
    if ([title isEqualToString:[HelperHandle getLanguage:@"百家乐"]]) {
        GameHallVC *gameHallVC=[[GameHallVC alloc] init];
        gameHallVC.titleStr=title;
        [self presentViewController:gameHallVC animated:YES completion:^{
            
        }];
    }
    if ([title isEqualToString:[HelperHandle getLanguage:@"皇家国际"]]) {
        [HelperHandle forceOrientationPortrait];
        RoyalVCViewController *royalVC=[[RoyalVCViewController alloc] init];
        [self presentViewController:royalVC animated:YES completion:^{
            
        }];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setRight];
    _moneyLab.text=[NSString stringWithFormat:@"%ld",[LoginUserInfo share].userModel.goldcoins];
    [self forceOrientationLandscape];
}
#pragma  mark 横屏设置
//强制横屏
- (void)forceOrientationLandscape{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForceLandscape=YES;
    appdelegate.isForcePortrait=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}

//强制竖屏
- (void)forceOrientationPortrait{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}
-(void)setRight{
    //设置状态栏方向，超级重要。（只有设置了这个方向，才能改变弹出键盘的方向）
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    
    //设置状态栏横屏
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    //    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];//这句话是防止手动先把设备置为横屏,导致下面的语句失效.
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:@(UIInterfaceOrientationLandscapeRight)];
        
    }
}
- (BOOL)shouldAutorotate
{
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return  UIInterfaceOrientationLandscapeRight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
