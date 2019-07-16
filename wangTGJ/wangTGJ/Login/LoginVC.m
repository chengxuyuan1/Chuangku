//
//  LoginVC.m
//  万通国际
//
//  Created by 许传信 on 2018/8/13.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "LoginVC.h"
#import <Masonry/Masonry.h>
#import "LanguageVC.h"
#import "HelperHandle.h"
#import "LoadingVC.h"
#import "LoginNetWork.h"
#import "GameMusicPalyer.h"
#import "LoginUserInfo.h"
#import "EasyShowView.h"
#import "RegisterVC.h"
@interface LoginVC ()<UITextFieldDelegate>
@property (nonatomic,strong) UILabel *versionLab;
@property (nonatomic,strong) UIButton *languageBtn;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UITextField *acountTextField;
@property (nonatomic,strong) UITextField *secretTextField;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *registerBtn;
@property (nonatomic,strong) UIButton *freeBtn;
@property (nonatomic,strong) GameMusicPalyer *gameMusicPalyer;
@property (nonatomic,assign) CGFloat leftF;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self setPortrait];
    _leftF=isIphoneX;
    if (_leftF>0) {
        _leftF-=34;
    }
    self.view.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    [self initGameMusic];
    [self initVersonLab];
    [self initLanguageBtn];
    [self initTitleLab];
    [self initAcountTextField];
    [self initsecretTextField];
    [self initFreeBtn];
    [self initRegiterBtn];
    [self initLoginBtn];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
}
-(void)initGameMusic{
    _gameMusicPalyer=[[GameMusicPalyer alloc] init];
     NSString *url=[[NSBundle mainBundle] pathForResource:@"bgm" ofType:@"mp3"];
    _gameMusicPalyer.mp3url=url;
    _gameMusicPalyer.repeatMusic=YES;
    [_gameMusicPalyer playBlcok:^{
        
    }];
}
- (void)updateLanguage{
    [_languageBtn setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"LanguageImg"]] forState:UIControlStateNormal];
     _titleLab.text=[HelperHandle getLanguage:@"WanTongGuJi"];
    [_freeBtn setTitle:[HelperHandle getLanguage:@"FreeTrialL"] forState:UIControlStateNormal];
    [_loginBtn setTitle:[HelperHandle getLanguage:@"登入"] forState:UIControlStateNormal];
    _acountTextField.placeholder = [HelperHandle getLanguage:@"用户名称"];
    _secretTextField.placeholder = [HelperHandle getLanguage:@"用户密码"];
    [_registerBtn setTitle:[HelperHandle getLanguage:@"注册"] forState:UIControlStateNormal];
}
- (void)initLanguageBtn{
    _languageBtn=[[UIButton alloc] init];
   
    NSString *en=[HelperHandle getLanguage:@"LanguageImg"];
    [_languageBtn setImage:[UIImage imageNamed:en] forState:UIControlStateNormal];
    [_languageBtn addTarget:self action:@selector(languageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_languageBtn];
    [_languageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.versionLab.mas_centerY).offset(0);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
}
- (void)languageBtnAction:(UIButton *)btn{
    LanguageVC *languageVC=[[LanguageVC alloc] init];
    [self presentViewController:languageVC animated:YES completion:^{
        
    }];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}
- (void)initVersonLab{
    _versionLab=[[UILabel alloc] init];
   
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    _versionLab.text=[NSString stringWithFormat:@"%@(v2)",app_Version];
    _versionLab.font=[UIFont systemFontOfSize:15];
    _versionLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    [self.view addSubview:_versionLab];
    
    [_versionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10+self.leftF);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
}
- (void)initTitleLab{
    _titleLab = [[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"WanTongGuJi"];
    _titleLab.textColor = [UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    _titleLab.font=[UIFont systemFontOfSize:20];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.versionLab.mas_bottom).offset(20);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(30);
    }];
}
- (void)initAcountTextField{
    _acountTextField=[[UITextField alloc] init];
    _acountTextField.placeholder = [HelperHandle getLanguage:@"用户名称"];
    [_acountTextField setValue:[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    _acountTextField.layer.borderWidth=1;
    _acountTextField.layer.cornerRadius=5;
    _acountTextField.layer.borderColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1].CGColor;
    [_acountTextField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    _acountTextField.leftView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _acountTextField.leftViewMode=UITextFieldViewModeAlways;
    _acountTextField.delegate=self;
    _acountTextField.tag=1001;
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    if ([userDefault objectForKey:@"userName"]) {
        _acountTextField.text=[userDefault objectForKey:@"userName"];
    }
    [self.view addSubview:_acountTextField];
    [_acountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.titleLab.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
}
- (void)initsecretTextField{
    _secretTextField=[[UITextField alloc] init];
    _secretTextField.placeholder = [HelperHandle getLanguage:@"用户密码"];
    [_secretTextField setValue:[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    _secretTextField.layer.borderWidth=1;
    _secretTextField.layer.cornerRadius=5;
    _secretTextField.layer.borderColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1].CGColor;
    [_secretTextField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    _secretTextField.leftView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _secretTextField.leftViewMode=UITextFieldViewModeAlways;
    _secretTextField.secureTextEntry=YES;
    _secretTextField.delegate=self;
    _secretTextField.tag=1002;
     NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    if ([userDefault objectForKey:@"passWord"]) {
        _secretTextField.text=[userDefault objectForKey:@"passWord"];
    }
    [self.view addSubview:_secretTextField];
    [_secretTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.acountTextField.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"7");// 点击键盘的‘换行’会调用
    if (textField.tag==1001) {
        [_secretTextField becomeFirstResponder];
    }else{
        [_secretTextField resignFirstResponder];
    }
    return YES;
}
- (void)initFreeBtn{
    _freeBtn = [[UIButton alloc] init];
    [_freeBtn setTitle:[HelperHandle getLanguage:@"FreeTrialL"] forState:UIControlStateNormal];
    [_freeBtn setTitleColor:[UIColor colorWithRed:24/255.0 green:16/255.0 blue:20/255.0 alpha:1] forState:UIControlStateNormal];
    _freeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:237/255.0 alpha:1];
    [_freeBtn addTarget:self action:@selector(freeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_freeBtn];
    [_freeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
}
- (void)initRegiterBtn{
    _registerBtn = [[UIButton alloc] init];
    [_registerBtn setTitle:[HelperHandle getLanguage:@"注册"] forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[UIColor colorWithRed:24/255.0 green:16/255.0 blue:20/255.0 alpha:1] forState:UIControlStateNormal];
    _registerBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:237/255.0 alpha:1];
    [_registerBtn addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.freeBtn.mas_top).offset(-10);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
}
-(void)registerBtnAction{
    RegisterVC *registerVC=[[RegisterVC alloc] init];
    [registerVC registerResult:^(NSString *username) {
        if (username) {
            self.acountTextField.text=username;
            self.secretTextField.text=@"";
        }
    }];
    [self presentViewController:registerVC animated:YES completion:^{
        
    }];
}
- (void)initLoginBtn{
    _loginBtn = [[UIButton alloc] init];
    [_loginBtn setTitle:[HelperHandle getLanguage:@"登入"] forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor colorWithRed:24/255.0 green:16/255.0 blue:20/255.0 alpha:1] forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:237/255.0 alpha:1];
    [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.registerBtn.mas_top).offset(-10);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
}
- (void)loginAction:(UIButton *)btn{
    __block  LoginNetWork *loginNetWorking=[[LoginNetWork alloc] init];
    __block  UIViewController *vc=self;
    [loginNetWorking loginNewWorkingWithUserName:_acountTextField.text PassWord:_secretTextField.text type:0 Blcok:^(id data) {
        NSDictionary *dic=data[@"data"];
        if ([HelperHandle isNull:dic]) {
            if (![HelperHandle isNull:data[@"message"]]) {
                [EasyTextView showErrorText:[HelperHandle getLanguage:@"密码错误"] config:^EasyTextConfig *{
                    return [EasyTextConfig shared].setStatusType(TextStatusTypeNavigation) ;
                }];
            }
            
            return ;
        }
        LoginUserInfo *userInfo=[LoginUserInfo share];
        userInfo.userid=dic[@"userid"];
        userInfo.token=[NSString stringWithFormat:@"%ld",[dic[@"token"] integerValue]];
        if (userInfo.token.length>0) {
            [loginNetWorking loginAuthWithAuth:userInfo.token userId:userInfo.userid Blcok:^(id data) {
                if (data) {
                    if ([data[@"message"] isEqualToString:@"success"]) {
                        NSLog(@"登录成功");
                    }else{
                        [EasyTextView showErrorText:[HelperHandle getLanguage:@"登录失败"] config:^EasyTextConfig *{
                            return [EasyTextConfig shared].setStatusType(TextStatusTypeNavigation) ;
                        }];
                        return;
                    }
                    [userInfo initDataWithData:data];
                    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
                    [userDefault setObject:self.acountTextField.text forKey:@"userName"];
                    [userDefault setObject:self.secretTextField.text forKey:@"passWord"];
                    [userDefault synchronize];
                    LoadingVC *loadingVC=[[LoadingVC alloc] init];
                    [vc presentViewController:loadingVC animated:YES completion:^{
                        
                    }];
                }
            }];
           
        }
     
    }];
}
- (void)freeBtnAction:(UIButton *)btn{
    LoadingVC *loadingVC=[[LoadingVC alloc] init];
    [self presentViewController:loadingVC animated:YES completion:^{
        
    }];
}


- (BOOL)shouldAutorotate
{
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return  UIInterfaceOrientationPortrait;
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
