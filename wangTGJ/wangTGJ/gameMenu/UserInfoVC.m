//
//  UserInfoVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/10.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "UserInfoVC.h"
#import <Masonry/Masonry.h>
#import "LoginUserInfo.h"
#import "HelperHandle.h"
@interface UserInfoVC ()
@property (nonatomic,strong) UIView *navBgView;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIImageView *headImgView;
@property (nonatomic,strong) UIImageView *cameraImgView;
@property (nonatomic,strong) UIImageView *userNameBgImgView;
@property (nonatomic,strong) UIImageView *userIconImgView;
@property  (nonatomic,strong) UILabel *userNameLab;
@property (nonatomic,strong) UIImageView *moneyImgView;
@property (nonatomic,strong) UILabel *moneyLab;
@property (nonatomic,strong) UIButton *emailBtn;
@property (nonatomic,strong) UIView *bottomLine;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,strong) UIView *rightView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSMutableArray *titleLabArr;
@property (nonatomic,strong) NSArray *numArr;
@property (nonatomic,strong) NSMutableArray *numLabArr;
@end

@implementation UserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:19/255.0 green:19/255.0 blue:19/255.0 alpha:1];
    _titleArr=@[[HelperHandle getLanguage:@"等级:"],[HelperHandle getLanguage:@"总有效投注:"],[HelperHandle getLanguage:@"玩家币种:"],[HelperHandle getLanguage:@"今日有效下注:"],[HelperHandle getLanguage:@"在线积分:"],[HelperHandle getLanguage:@"在线时长:"],[HelperHandle getLanguage:@"下注限红:"]];
    _titleLabArr=[NSMutableArray array];
    _numArr=@[@"",@"",@"",@"",@"",@"",@""];
    _numLabArr=[NSMutableArray array];
    [self initNavBgView];
    [self initBackBtn];
    [self initHeadImgView];
    [self initCameraImgView];
    [self initUserNameBgImgView];
    [self initUserIconImgView];
    [self initUserNameLab];
    [self initMoneyImgView];
    [self initMoneyLab];
    [self initEmailBtn];
    [self initBottomLine];
    [self initBgView];
    [self initLeftView];
    [self initRightView];
    [self initTitleLab];
    [self initNumLab];
}
-(void)initNavBgView{
    _navBgView=[[UIView alloc] init];
    _navBgView.backgroundColor=[UIColor colorWithRed:35/255.0 green:35/255.0 blue:25/255.0 alpha:1];
    [self.view addSubview:_navBgView];
    [_navBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
    }];
}
-(void)initBackBtn{
    _backBtn=[[UIButton alloc] init];
    [_backBtn setImage:[UIImage imageNamed:@"icon_bet_cancel"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navBgView addSubview:_backBtn];
    [_backBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navBgView.mas_top).offset(10);
        make.right.equalTo(self.navBgView.mas_right).offset(-20);
        make.bottom.equalTo(self.navBgView.mas_bottom).offset(-10);
        make.width.mas_equalTo(40);
    }];
}
- (void)initHeadImgView{
    _headImgView=[[UIImageView alloc] init];
    _headImgView.image=[UIImage imageNamed:@"headerImg"];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
//    //点击次数（默认1）
//
//    tapGesture.numberOfTapsRequired = 1;
//
//    //手指的个数（默认1）
//
//    tapGesture.numberOfTouchesRequired = 1;
//    //3.把手势与视图相关联
//
//    //[_headImgView addGestureRecognizer:tapGesture];
//    _headImgView.userInteractionEnabled=YES;
    [self.navBgView addSubview:_headImgView];
    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navBgView.mas_left).offset(10);
        make.top.equalTo(self.navBgView.mas_top).offset(5);
        make.bottom.equalTo(self.navBgView.mas_bottom).offset(-5);
        make.width.mas_equalTo(0);
    }];
}
- (void)initCameraImgView{
    _cameraImgView=[[UIImageView alloc] init];
    _cameraImgView.image=[UIImage imageNamed:@"profilepic_cam"];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
//    //点击次数（默认1）
//
//    tapGesture.numberOfTapsRequired = 1;
//
//    //手指的个数（默认1）
//
//    tapGesture.numberOfTouchesRequired = 1;
//    //3.把手势与视图相关联
//
//    //[_headImgView addGestureRecognizer:tapGesture];
//    _headImgView.userInteractionEnabled=YES;
    [self.headImgView addSubview:_cameraImgView];
    [_cameraImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headImgView.mas_right).offset(0);
        make.bottom.equalTo(self.headImgView.mas_bottom).offset(0);
        make.width.mas_equalTo(18);
        //make.height.mas_equalTo(13.5);
        make.height.mas_equalTo(0);
    }];
}
-(void)backBtnAction{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)initUserNameBgImgView{
    _userNameBgImgView=[[UIImageView alloc] init];
    _userNameBgImgView.image=[UIImage imageNamed:@"common_btn"];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
//    //点击次数（默认1）
//
//    tapGesture.numberOfTapsRequired = 1;
//
//    //手指的个数（默认1）
//
//    tapGesture.numberOfTouchesRequired = 1;
//    //3.把手势与视图相关联
//
//    [_userNameBgImgView addGestureRecognizer:tapGesture];
//    _userNameBgImgView.userInteractionEnabled=YES;
    [self.navBgView addSubview:_userNameBgImgView];
    [_userNameBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(10);
        make.top.equalTo(self.navBgView.mas_top).offset(5);
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
- (void)initMoneyImgView{
    _moneyImgView=[[UIImageView alloc] init];
    _moneyImgView.image=[UIImage imageNamed:@"balance_icon"];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
//    //点击次数（默认1）
//
//    tapGesture.numberOfTapsRequired = 1;
//
//    //手指的个数（默认1）
//
//    tapGesture.numberOfTouchesRequired = 1;
//    //3.把手势与视图相关联
//
//    [_moneyImgView addGestureRecognizer:tapGesture];
//    _moneyImgView.userInteractionEnabled=YES;
    [self.navBgView addSubview:_moneyImgView];
    [_moneyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(10);
        make.top.equalTo(self.userNameBgImgView.mas_bottom).offset(5);
        make.width.mas_equalTo(20);
        make.bottom.equalTo(self.navBgView.mas_bottom).offset(-5);
    }];
}
- (void)initMoneyLab{
    _moneyLab=[[UILabel alloc] init];
    _moneyLab.text=[NSString stringWithFormat:@"%ld",[LoginUserInfo share].userModel.goldcoins];
    _moneyLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    _moneyLab.font=[UIFont systemFontOfSize:12];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
//    //点击次数（默认1）
//    
//    tapGesture.numberOfTapsRequired = 1;
//    
//    //手指的个数（默认1）
//    
//    tapGesture.numberOfTouchesRequired = 1;
//    //3.把手势与视图相关联
//    
//    [_moneyLab addGestureRecognizer:tapGesture];
//    _moneyLab.userInteractionEnabled=YES;
    [self.navBgView addSubview:_moneyLab];
    [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyImgView.mas_right).offset(10);
        make.top.equalTo(self.userNameBgImgView.mas_bottom).offset(5);
        make.width.mas_equalTo(80);
        make.bottom.equalTo(self.navBgView.mas_bottom).offset(-5);
    }];
}
- (void)initEmailBtn{
    _emailBtn=[[UIButton alloc] init];
    [_emailBtn setImage:[UIImage imageNamed:@"msg_btn"] forState:UIControlStateNormal];
    //[_emailBtn addTarget:self action:@selector(pushToUserInfoVC) forControlEvents:UIControlEventTouchUpInside];
    [self.navBgView addSubview:_emailBtn];
    [_emailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameBgImgView.mas_right).offset(20);
        make.top.equalTo(self.navBgView.mas_top).offset(10);
        make.bottom.equalTo(self.navBgView.mas_bottom).offset(-10);
        make.width.mas_equalTo(50);
    }];
}
-(void)initBottomLine{
    _bottomLine=[[UIView alloc] init];
    _bottomLine.backgroundColor=[UIColor colorWithRed:166/255.0 green:130/255.0 blue:100/255.0 alpha:1];
    [self.view addSubview:_bottomLine];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.top.equalTo(self.navBgView.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(2);
    }];
}
-(void)initBgView{
    _bgView=[[UIView alloc] init];
    _bgView.layer.borderWidth = 1;
    _bgView.layer.borderColor =[UIColor colorWithRed:197/255.0 green:147/255.0 blue:84/255.0 alpha:1].CGColor;
    [self.view addSubview:_bgView];
    
}
-(void)initLeftView{
    _leftView=[[UIView alloc] init];
    _leftView.backgroundColor=[UIColor colorWithRed:46/255.0 green:46/255.0 blue:46/255.0 alpha:1];
    [_bgView addSubview:_leftView];
    
}
-(void)initRightView{
    _rightView=[[UIView alloc] init];
    _rightView.backgroundColor=[UIColor colorWithRed:81/255.0 green:81/255.0 blue:81/255.0 alpha:1];
    [_bgView addSubview:_rightView];
    
}
-(void)initTitleLab{
    for (NSString *title in _titleArr) {
        UILabel *titleLab=[[UILabel alloc] init];
        titleLab.text=title;
        titleLab.textColor=[UIColor colorWithRed:204/255.0 green:176/255.0 blue:74/255.0 alpha:1];
        [_leftView addSubview:titleLab];
        [_titleLabArr addObject:titleLab];
    }
}
-(void)initNumLab{
    for (NSString *num in _numArr) {
        UILabel *numLab=[[UILabel alloc] init];
        numLab.text=num;
        numLab.textColor=[UIColor whiteColor];
        [_rightView addSubview:numLab];
        [_numLabArr addObject:numLab];
    }
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [_bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(100);
        make.right.equalTo(self.view.mas_right).offset(-100);
        make.top.equalTo(self.bottomLine.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
    }];
    [_leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
        make.width.mas_equalTo((self.bgView.frame.size.width-20)/2);
    }];
    [_rightView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftView.mas_right).offset(0);
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
         make.right.equalTo(self.bgView.mas_right).offset(-10);
    }];
    CGFloat height=(_leftView.frame.size.height-20)/_titleLabArr.count;
    for (int i=0; i<_titleLabArr.count; i++) {
        UILabel *titleLab=_titleLabArr[i];
        [titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftView.mas_left).offset(10);
            make.top.equalTo(self.bgView.mas_top).offset(height*i+20);
            make.height.mas_equalTo(height);
            make.right.equalTo(self.leftView.mas_right).offset(0);
        }];
    }
    
    for (int i=0; i<_numLabArr.count; i++) {
        UILabel *numLab=_numLabArr[i];
        [numLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.rightView.mas_left).offset(10);
            make.top.equalTo(self.rightView.mas_top).offset(height*i+13);
            make.height.mas_equalTo(height);
            make.right.equalTo(self.rightView.mas_right).offset(0);
        }];
    }
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setRight];
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
