//
//  LangugeSelectView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "LangugeSelectView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
@implementation LangugeSelectView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
        [self initTitleLab];
        [self initbgView];
        [self initMidleBgView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
     _titleLab.text=[HelperHandle getLanguage:@"语言选择"];
}
-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"语言选择"];
    _titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _titleLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
}
-(void)initbgView{
    _bgView=[[UIView alloc] init];
    _bgView.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    _bgView.layer.borderWidth=2;
    _bgView.layer.borderColor=[UIColor colorWithRed:164/255.0 green:133/255.0 blue:107/255.0 alpha:1].CGColor;
    [self addSubview:_bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(30);
        make.left.equalTo(self.mas_left).offset(30);
        make.right.equalTo(self.mas_right).offset(-30);
         make.bottom.equalTo(self.mas_bottom).offset(-30);
    }];
}
-(void)initMidleBgView{
    _midleBgView=[[UIView alloc] init];
    _midleBgView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    [self addSubview:_midleBgView];
    [_midleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
    }];
}
-(void)initLanguageLabAndBtn{
    _btns=[NSMutableArray array];
    NSArray *arr=@[@"简体中文",@"簡體中文",@"English"];
    NSInteger index=(_midleBgView.frame.size.height-20*3)/4.0;
    for (int i=0; i<arr.count; i++) {
        UILabel *lab=[[UILabel alloc] init];
        lab.text=arr[i];
        lab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
        [_midleBgView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.midleBgView.mas_top).offset(index+i*index+i*20);
            make.left.equalTo(self.midleBgView.mas_left).offset(20);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(20);
        }];
        
        UIButton *btn=[[UIButton alloc] init];
        btn.backgroundColor=[UIColor colorWithRed:39/255.0 green:39/255.0 blue:39/255.0 alpha:1];
        [btn setImage:[UIImage imageNamed:@"language_tick"] forState:UIControlStateSelected];
        if ([arr[i] isEqualToString:[HelperHandle getLanguage:@"简体中文"]]) {
            btn.selected=YES;
        }
        btn.tag=5000+i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.midleBgView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(lab.mas_centerY).offset(0);
            make.right.equalTo(self.midleBgView.mas_right).offset(-20);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
        }];
        [_btns addObject:btn];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (_btns==nil) {
        [self initLanguageLabAndBtn];
    }
}
-(void)btnAction:(UIButton *)btn{
    for (UIButton *kbtn in _btns) {
        kbtn.selected=NO;
    }
    btn.selected=YES;
    switch (btn.tag) {
        case 5000:{
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
        case 5001:{
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
        case 5002:{
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
}
@end
