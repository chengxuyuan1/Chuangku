//
//  GameRuleVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GameRuleVC.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
@interface GameRuleVC ()
@property (nonatomic,strong) UIView *navView;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *menuSelectBtn;
@property (nonatomic,assign) BOOL show;
@property (nonatomic,strong) UIView *menuBgView;
@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) NSArray *htmls;
@end

@implementation GameRuleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavView];
    [self initBackBtn];
    [self initTitleLab];
    [self initMenuSelectBtn];
    [self initWebView];
    
}
-(void)initWebView{
    _htmls=@[@"bac_zh",@"DragonTiger_zh"];
    _webView=[[UIWebView alloc] init];
    //加载路径的第二个方式
    NSURL *url = [[NSBundle mainBundle] URLForResource:[HelperHandle getLanguage:_htmls[0]] withExtension:@"html"];
    //uiwebview加载文件的第二个方式。第一个方式在下面的注释中。
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.menuSelectBtn.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}
-(void)initNavView{
    _navView=[[UIView alloc] init];
    _navView.backgroundColor=[UIColor colorWithRed:46/255.0 green:46/255.0 blue:46/255.0 alpha:1];
    [self.view addSubview:_navView];
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
    }];
}
-(void)initBackBtn{
    _backBtn=[[UIButton alloc] init];
    [_backBtn setImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    _backBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 10, 10, 10);
    [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_top).offset(0);
        make.left.equalTo(self.navView.mas_left).offset(0);
        make.bottom.equalTo(self.navView.mas_bottom).offset(0);
        make.width.mas_equalTo(60);
    }];
}
-(void)backBtnAction{
    [HelperHandle forceOrientationLandscape];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"游戏规则"];
    _titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _titleLab.textAlignment=NSTextAlignmentCenter;
    [_navView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_top).offset(0);
        make.centerX.equalTo(self.navView.mas_centerX).offset(0);
        make.bottom.equalTo(self.navView.mas_bottom).offset(0);
        make.width.mas_equalTo(100);
    }];
}
-(void)initMenuSelectBtn{
    _menuSelectBtn=[[UIButton alloc] init];
    [_menuSelectBtn setImage:[UIImage imageNamed:@"arrow_yellowdown"] forState:UIControlStateNormal];
    [_menuSelectBtn setTitle:[HelperHandle getLanguage:@"游戏规则"] forState:UIControlStateNormal];
    [_menuSelectBtn setTitleColor:[UIColor colorWithRed:166/255.0 green:132/255.0 blue:101/255.0 alpha:1] forState:UIControlStateNormal];
    _menuSelectBtn.backgroundColor=[UIColor colorWithRed:253/255.0 green:241/255.0 blue:194/255.0 alpha:1];
    _menuSelectBtn.imageEdgeInsets=UIEdgeInsetsMake(15, self.view.frame.size.width/2-20, 15, 20);
    _menuSelectBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -self.view.frame.size.width/2, 0, 0);
    [_menuSelectBtn addTarget:self action:@selector(menuSelectBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_menuSelectBtn];
    [_menuSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
    }];
}
-(void)menuSelectBtnAction{
    if (_show) {
        _show=NO;
        [_menuSelectBtn setImage:[UIImage imageNamed:@"arrow_yellowdown"] forState:UIControlStateNormal];
        [_menuBgView removeFromSuperview];
    }else{
        _show=YES;
        [_menuSelectBtn setImage:[UIImage imageNamed:@"arrow_yellow"] forState:UIControlStateNormal];
        [self.view addSubview:self.menuBgView];
        [_menuBgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.menuSelectBtn.mas_bottom).offset(0);
            make.left.equalTo(self.view.mas_left).offset(0);
            make.right.equalTo(self.view.mas_right).offset(0);
            make.height.mas_equalTo(101);
        }];
       
    }
}
-(UIView*)menuBgView{
    if (_menuBgView==nil) {
        _menuBgView=[[UIView alloc] init];
        _menuBgView.backgroundColor=[UIColor colorWithRed:120/255.0 green:80/255.0 blue:43/255.0 alpha:1];
         [self initBtns];
    }
    return _menuBgView;
}
-(void)initBtns{
    if (_btns==nil) {
        _btns=[NSMutableArray array];
        NSArray *arr=@[@"百家乐",@"龙虎"];
        for (int i=0; i<arr.count; i++) {
            UIButton *btn=[[UIButton alloc] init];
            [btn setTitle:[HelperHandle getLanguage:arr[i]] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:208/255.0 green:147/255.0 blue:67/255.0 alpha:1] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            btn.backgroundColor=[UIColor colorWithRed:253/255.0 green:241/255.0 blue:194/255.0 alpha:1];
            btn.titleEdgeInsets=UIEdgeInsetsMake(0, -self.view.frame.size.width/2, 0, 0);
            [btn addTarget:self action:@selector(BtnAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=4000+i;
            if (i==0) {
                btn.selected=YES;
                btn.backgroundColor=[UIColor colorWithRed:120/255.0 green:80/255.0 blue:43/255.0 alpha:1];
            }
            [_menuBgView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.menuBgView.mas_top).offset(i*50+1);
                make.left.equalTo(self.menuBgView.mas_left).offset(0);
                make.right.equalTo(self.menuBgView.mas_right).offset(0);
                make.height.mas_equalTo(50);
            }];
            [_btns addObject:btn];
        }
    }
}
-(void)BtnAction:(UIButton *)btn{
    for (UIButton *btn in _btns) {
        btn.selected=NO;
        btn.backgroundColor=[UIColor colorWithRed:253/255.0 green:241/255.0 blue:194/255.0 alpha:1];
    }
    btn.selected=YES;
    btn.backgroundColor=[UIColor colorWithRed:120/255.0 green:80/255.0 blue:43/255.0 alpha:1];
    NSInteger index=btn.tag%4000;
    //加载路径的第二个方式
    NSURL *url = [[NSBundle mainBundle] URLForResource:[HelperHandle getLanguage:_htmls[index]] withExtension:@"html"];
    //uiwebview加载文件的第二个方式。第一个方式在下面的注释中。
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
@end
