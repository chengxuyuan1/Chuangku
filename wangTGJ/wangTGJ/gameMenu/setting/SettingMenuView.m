//
//  SettingMenuView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/6.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "SettingMenuView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "SettingVC.h"
#import "GameRuleVC.h"
#import "SuggestionsBoXViewController.h"
@implementation SettingMenuView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _blackBgView=[[UIView alloc] init];
        _blackBgView.backgroundColor=[UIColor blackColor];
        _blackBgView.alpha=0.5;
        [self addSubview:_blackBgView];
        [_blackBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
        }];
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        //点击次数（默认1）
        
        tapGesture.numberOfTapsRequired = 1;
        
        //手指的个数（默认1）
        
        tapGesture.numberOfTouchesRequired = 1;
        //3.把手势与视图相关联
        
        [_blackBgView addGestureRecognizer:tapGesture];
        
        
        
        _leftBgView=[[UIView alloc] init];
        _leftBgView.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
        [self addSubview:_leftBgView];
        [_leftBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.width.mas_equalTo(150);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
        }];
        
        _topBgView=[[UIView alloc] init];
        _topBgView.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
        [_leftBgView addSubview:_topBgView];
        [_topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.leftBgView.mas_top).offset(0);
            make.left.equalTo(self.leftBgView.mas_left).offset(0);
            make.right.equalTo(self.leftBgView.mas_right).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        
        _imgView=[[UIImageView alloc] init];
        [_imgView setImage:[UIImage imageNamed:@""]];
        [_leftBgView addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.leftBgView.mas_top).offset(0);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
            make.centerX.equalTo(self.leftBgView.mas_centerX).offset(0);
        }];
        
        _yellowLine=[[UIView alloc] init];
        _yellowLine.backgroundColor=[UIColor colorWithRed:140/255.0 green:111/255.0 blue:80/255.0 alpha:1];
        [_leftBgView addSubview:_yellowLine];
        [_yellowLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topBgView.mas_bottom).offset(0);
            make.left.equalTo(self.leftBgView.mas_left).offset(0);
            make.right.equalTo(self.leftBgView.mas_right).offset(0);
            make.height.mas_equalTo(3);
        }];
        
        _recordBtn=[[UIButton alloc] init];
        [_recordBtn setImage:[UIImage imageNamed:@"menu_records"] forState:UIControlStateNormal];
        _recordBtn.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
        [_recordBtn setTitle:[HelperHandle getLanguage:@"记录"] forState:UIControlStateNormal];
        [_recordBtn setTitleColor:[UIColor colorWithRed:140/255.0 green:111/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
        _recordBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -40, 0, 0);
        _recordBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 20, 10, 100);
        [_recordBtn addTarget:self action:@selector(recordBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_leftBgView addSubview:_recordBtn];
        [_recordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.yellowLine.mas_bottom).offset(0);
            make.left.equalTo(self.leftBgView.mas_left).offset(0);
            make.right.equalTo(self.leftBgView.mas_right).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        
        
        
        _settingBtn=[[UIButton alloc] init];
        [_settingBtn setImage:[UIImage imageNamed:@"icon_setting"] forState:UIControlStateNormal];
        _settingBtn.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
        [_settingBtn setTitle:[HelperHandle getLanguage:@"设置"] forState:UIControlStateNormal];
        [_settingBtn setTitleColor:[UIColor colorWithRed:140/255.0 green:111/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
        _settingBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -40, 0, 0);
        _settingBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 20, 10, 100);
         [_settingBtn addTarget:self action:@selector(settingBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_leftBgView addSubview:_settingBtn];
        [_settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.recordBtn.mas_bottom).offset(1);
            make.left.equalTo(self.leftBgView.mas_left).offset(0);
            make.right.equalTo(self.leftBgView.mas_right).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        _opiniongBtn=[[UIButton alloc] init];
        [_opiniongBtn setImage:[UIImage imageNamed:@"menu_feedback"] forState:UIControlStateNormal];
        _opiniongBtn.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
        [_opiniongBtn setTitle:[HelperHandle getLanguage:@"QQ客服"] forState:UIControlStateNormal];
        _opiniongBtn.titleLabel.numberOfLines=2;
        [_opiniongBtn setTitleColor:[UIColor colorWithRed:140/255.0 green:111/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
        _opiniongBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -30, 0, 0);
        _opiniongBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 20, 10, 100);
        [_opiniongBtn addTarget:self action:@selector(opiniongBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_leftBgView addSubview:_opiniongBtn];
        [_opiniongBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.settingBtn.mas_bottom).offset(1);
            make.left.equalTo(self.leftBgView.mas_left).offset(0);
            make.right.equalTo(self.leftBgView.mas_right).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        _gameRulesBtn=[[UIButton alloc] init];
        [_gameRulesBtn setImage:[UIImage imageNamed:@"menu_help"] forState:UIControlStateNormal];
        _gameRulesBtn.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
        [_gameRulesBtn setTitle:[HelperHandle getLanguage:@"游戏规则"] forState:UIControlStateNormal];
        [_gameRulesBtn setTitleColor:[UIColor colorWithRed:140/255.0 green:111/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
        _gameRulesBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -20, 0, 0);
        _gameRulesBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 20, 10, 100);
        [_gameRulesBtn addTarget:self action:@selector(gameRulesBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_leftBgView addSubview:_gameRulesBtn];
        [_gameRulesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.opiniongBtn.mas_bottom).offset(1);
            make.left.equalTo(self.leftBgView.mas_left).offset(0);
            make.right.equalTo(self.leftBgView.mas_right).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
     [_gameRulesBtn setTitle:[HelperHandle getLanguage:@"游戏规则"] forState:UIControlStateNormal];
     [_opiniongBtn setTitle:[HelperHandle getLanguage:@"QQ客服"] forState:UIControlStateNormal];
    [_settingBtn setTitle:[HelperHandle getLanguage:@"设置"] forState:UIControlStateNormal];
    [_recordBtn setTitle:[HelperHandle getLanguage:@"记录"] forState:UIControlStateNormal];
}
// 点击事件

-(void)tapClick:(UITapGestureRecognizer *)tap{
    [self removeFromSuperview];
}
-(void)recordBtnAction:(UIButton *)btn{
    if (_recordMenuView==nil) {
        _recordMenuView=[[[NSBundle mainBundle] loadNibNamed:@"RecordMenuView" owner:nil options:nil] lastObject];
    }
    _recordMenuView.vc=_vc;
    [self addSubview:_recordMenuView];
    [_recordMenuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
    }];
}
-(void)settingBtnAction:(UIButton *)btn{
    SettingVC *settingVC=[[SettingVC alloc] init];
    [_vc presentViewController:settingVC animated:YES completion:^{
        
    }];
}
-(void)opiniongBtnAction:(UIButton *)btn{
    SuggestionsBoXViewController *suggestionsBoxVC=[[SuggestionsBoXViewController alloc] init];
    [_vc presentViewController:suggestionsBoxVC animated:YES completion:^{
        
    }];
}
-(void)gameRulesBtnAction:(UIButton *)btn{
    [HelperHandle forceOrientationPortrait];
    GameRuleVC *gameVC=[[GameRuleVC alloc] init];
    [_vc presentViewController:gameVC animated:YES completion:^{
        
    }];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
