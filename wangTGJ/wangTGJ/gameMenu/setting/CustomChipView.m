//
//  CustomChipView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "CustomChipView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
@implementation CustomChipView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1];
        [self initTitleLab];
        [self initbgView];
        [self initTopBgView];
        [self initRouletteBtn];
        [self initDiceBtn];
        [self initBottomline];
        [self initBottomBgView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
    _titleLab.text=[HelperHandle getLanguage:@"请选择游戏:"];
    [_rouletteBtn setTitle:[HelperHandle getLanguage:@"轮盘"] forState:UIControlStateNormal];
    [_diceBtn setTitle:[HelperHandle getLanguage:@"骰宝"] forState:UIControlStateNormal];
}
-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"请选择游戏:"];
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
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.left.equalTo(self.mas_left).offset(30);
        make.right.equalTo(self.mas_right).offset(-30);
        make.bottom.equalTo(self.mas_bottom).offset(-30);
    }];
}
-(void)initTopBgView{
    _topBgView=[[UIView alloc] init];
    _topBgView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    [_bgView addSubview:_topBgView];
    [_topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.mas_equalTo(30);
    }];
}
-(void)initRouletteBtn{
    _rouletteBtn=[[UIButton alloc] init];
    [_rouletteBtn setTitle:[HelperHandle getLanguage:@"轮盘"] forState:UIControlStateNormal];
    [_rouletteBtn setTitleColor:[UIColor colorWithRed:167/255.0 green:132/255.0 blue:104/255.0 alpha:1] forState:UIControlStateNormal];
    [_rouletteBtn addTarget:self action:@selector(rouletteBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topBgView addSubview: _rouletteBtn];
    [ _rouletteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topBgView.mas_top).offset(0);
        make.left.equalTo(self.topBgView.mas_left).offset(10);
        make.bottom.equalTo(self.topBgView.mas_bottom).offset(0);
        make.width.mas_equalTo(100);
    }];
}
-(void)rouletteBtnAction:(UIButton *)btn{
    [_bottomline mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rouletteBtn.mas_bottom).offset(-5);
        make.left.equalTo(self.rouletteBtn.mas_left).offset(0);
        make.right.equalTo(self.rouletteBtn.mas_right).offset(0);
        make.height.mas_equalTo(5);
    }];
    
    [self initBottomBgView];
}
-(void)initDiceBtn{
    _diceBtn=[[UIButton alloc] init];
    [_diceBtn setTitle:[HelperHandle getLanguage:@"骰宝"] forState:UIControlStateNormal];
    [_diceBtn setTitleColor:[UIColor colorWithRed:167/255.0 green:132/255.0 blue:104/255.0 alpha:1] forState:UIControlStateNormal];
    [_diceBtn addTarget:self action:@selector(diceBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topBgView addSubview: _diceBtn];
    [ _diceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topBgView.mas_top).offset(0);
        make.left.equalTo(self.rouletteBtn.mas_right).offset(0);
        make.bottom.equalTo(self.topBgView.mas_bottom).offset(0);
        make.width.mas_equalTo(100);
    }];
}
-(void)diceBtnAction:(UIButton *)btn{
  
    [_bottomline mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.mas_bottom).offset(-5);
        make.left.equalTo(btn.mas_left).offset(0);
        make.right.equalTo(btn.mas_right).offset(0);
        make.height.mas_equalTo(5);
    }];
    
    [self initDiceBgView];
}
-(void)initBottomline{
    _bottomline=[[UIView alloc] init];
    _bottomline.backgroundColor=[UIColor colorWithRed:168/255.0 green:132/255.0 blue:102/255.0 alpha:1];
    [_topBgView addSubview:_bottomline];
    [_bottomline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rouletteBtn.mas_bottom).offset(-5);
        make.left.equalTo(self.rouletteBtn.mas_left).offset(0);
        make.right.equalTo(self.rouletteBtn.mas_right).offset(0);
        make.height.mas_equalTo(5);
    }];
}
-(void)initBottomBgView{
    if (_rouletteBgView==nil) {
        _rouletteBgView=[[RouletteBgView alloc] init];
        _rouletteBgView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    }
   
    [_bgView addSubview:_rouletteBgView];
    [_rouletteBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topBgView.mas_bottom).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
    }];
}
-(void)initDiceBgView{
    if (_diceBgView==nil) {
        _diceBgView=[[DiceBgView alloc] init];
        _diceBgView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    }
    [_bgView addSubview:_diceBgView];
    [_diceBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topBgView.mas_bottom).offset(10);
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
    }];
}
@end
