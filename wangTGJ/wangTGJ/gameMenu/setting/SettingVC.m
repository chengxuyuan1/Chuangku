//
//  SettingVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/11.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "SettingVC.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
#import "LangugeSelectView.h"
#import "CustomChipView.h"
#import "SoundSettingView.h"
#import "OtherSettingView.h"
@interface SettingVC ()
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIButton *selfDeterminedChipsBtn;
@property (nonatomic,strong) UIButton *languageSelectBtn;
@property (nonatomic,strong) UIButton *soundSettingBtn;
@property (nonatomic,strong) UIButton *otherSettingBtn;
@property (nonatomic,strong) LangugeSelectView *languageSelectView;
@property (nonatomic,strong) CustomChipView *customChipView;
@property (nonatomic,strong) SoundSettingView *soundSettingView;
@property (nonatomic,strong) OtherSettingView *otherSettingView;
@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
    [self initBackBtn];
    [self initSelfDeterminedChipsBtn];
    [self initLanguageSelectBtn];
    [self initSoundSettingBtn];
    [self initOtherSettingBtn];
    [self initCustomChipView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
}
-(void)updateLanguage{
    [_backBtn setTitle:[HelperHandle getLanguage:@"设置"] forState:UIControlStateNormal];
    [_selfDeterminedChipsBtn setTitle:[HelperHandle getLanguage:@"自定义筹码"] forState:UIControlStateNormal];
     [_languageSelectBtn setTitle:[HelperHandle getLanguage:@"语言选择"] forState:UIControlStateNormal];
     [_soundSettingBtn setTitle:[HelperHandle getLanguage:@"声音设置"] forState:UIControlStateNormal];
    [_otherSettingBtn setTitle:[HelperHandle getLanguage:@"其他设置"] forState:UIControlStateNormal];
}
-(void)initBackBtn{
    _backBtn=[[UIButton alloc] init];
    [_backBtn setImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    [_backBtn setTitle:[HelperHandle getLanguage:@"设置"] forState:UIControlStateNormal];
    [_backBtn setTitleColor:[UIColor colorWithRed:168/255.0 green:132/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    _backBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    _backBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 30, 10, 100);
    _backBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -30, 0, 0);
    [self.view addSubview:_backBtn];
    [_backBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(150);
    }];
}
-(void)backBtnAction{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)initSelfDeterminedChipsBtn{
    _selfDeterminedChipsBtn=[[UIButton alloc] init];
    _selfDeterminedChipsBtn.tag=3001;
    [_selfDeterminedChipsBtn setTitle:[HelperHandle getLanguage:@"自定义筹码"] forState:UIControlStateNormal];
    [_selfDeterminedChipsBtn setTitleColor:[UIColor colorWithRed:168/255.0 green:132/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [_selfDeterminedChipsBtn addTarget:self action:@selector(changeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    //_selfDeterminedChipsBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    _selfDeterminedChipsBtn.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
    [self.view addSubview:_selfDeterminedChipsBtn];
    [_selfDeterminedChipsBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backBtn.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(150);
    }];
}
-(void)initLanguageSelectBtn{
    _languageSelectBtn=[[UIButton alloc] init];
    _languageSelectBtn.tag=3002;
    [_languageSelectBtn setTitle:[HelperHandle getLanguage:@"语言选择"] forState:UIControlStateNormal];
    [_languageSelectBtn setTitleColor:[UIColor colorWithRed:168/255.0 green:132/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [_languageSelectBtn addTarget:self action:@selector(changeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _languageSelectBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    [self.view addSubview:_languageSelectBtn];
    [_languageSelectBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selfDeterminedChipsBtn.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(150);
    }];
}
-(void)initSoundSettingBtn{
    _soundSettingBtn=[[UIButton alloc] init];
    _soundSettingBtn.tag=3003;
    [_soundSettingBtn setTitle:[HelperHandle getLanguage:@"声音设置"] forState:UIControlStateNormal];
    [_soundSettingBtn setTitleColor:[UIColor colorWithRed:168/255.0 green:132/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [_soundSettingBtn addTarget:self action:@selector(changeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _soundSettingBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    [self.view addSubview:_soundSettingBtn];
    [_soundSettingBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.languageSelectBtn.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(150);
    }];
}
-(void)initOtherSettingBtn{
    _otherSettingBtn=[[UIButton alloc] init];
    _otherSettingBtn.tag=3004;
    [_otherSettingBtn setTitle:[HelperHandle getLanguage:@"其他设置"] forState:UIControlStateNormal];
    [_otherSettingBtn setTitleColor:[UIColor colorWithRed:168/255.0 green:132/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [_otherSettingBtn addTarget:self action:@selector(changeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _otherSettingBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    [self.view addSubview:_otherSettingBtn];
    [_otherSettingBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.soundSettingBtn.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(150);
    }];
}
-(void)changeBtnAction:(UIButton *)btn{
    switch (btn.tag) {
        case 3001:{
            [self setBtnBackgroudColor];
            _selfDeterminedChipsBtn.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
            [self initCustomChipView];
        }
            break;
        case 3002:{
            [self setBtnBackgroudColor];
            _languageSelectBtn.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
            if (_languageSelectView==nil) {
                _languageSelectView=[[LangugeSelectView alloc] init];
            }
            [self.view addSubview:_languageSelectView];
            [_languageSelectView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view.mas_top).offset(0);
                make.right.equalTo(self.selfDeterminedChipsBtn.mas_left).offset(0);
                make.left.equalTo(self.view.mas_left).offset(0);
                make.bottom.equalTo(self.view.mas_bottom).offset(0);
            }];
        }
            break;
        case 3003:{
            [self setBtnBackgroudColor];
            _soundSettingBtn.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
            if (_soundSettingView ==nil) {
                _soundSettingView=[[SoundSettingView alloc] init];
            }
            [self.view addSubview:_soundSettingView];
            [_soundSettingView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view.mas_top).offset(0);
                make.right.equalTo(self.selfDeterminedChipsBtn.mas_left).offset(0);
                make.left.equalTo(self.view.mas_left).offset(0);
                make.bottom.equalTo(self.view.mas_bottom).offset(0);
            }];
        }
            break;
        case 3004:{
            [self setBtnBackgroudColor];
            _otherSettingBtn.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
            if (_otherSettingView ==nil) {
               _otherSettingView=[[OtherSettingView alloc] init];
            }
            [self.view addSubview:_otherSettingView];
            [_otherSettingView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view.mas_top).offset(0);
                make.right.equalTo(self.selfDeterminedChipsBtn.mas_left).offset(0);
                make.left.equalTo(self.view.mas_left).offset(0);
                make.bottom.equalTo(self.view.mas_bottom).offset(0);
            }];
        }
            break;
        default:
            break;
    }
}
-(void)initCustomChipView{
    if (_customChipView==nil) {
        _customChipView=[[CustomChipView alloc] init];
    }
    [self.view addSubview:_customChipView];
    [_customChipView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.right.equalTo(self.selfDeterminedChipsBtn.mas_left).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}
-(void)setBtnBackgroudColor{
    _selfDeterminedChipsBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    _languageSelectBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    _soundSettingBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
    _otherSettingBtn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
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
