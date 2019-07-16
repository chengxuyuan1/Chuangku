//
//  DisplayCardView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/28.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "DisplayCardView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
@implementation DisplayCardView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        _blackView=[[UIView alloc] init];
        _blackView.backgroundColor=[UIColor blackColor];
        _blackView.alpha=0.5;
        [self addSubview:_blackView];
        
        [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
        }];
        
        
        _xianYellowBgView=[[UIView alloc] init];
        _xianYellowBgView.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_xianYellowBgView];
        [_xianYellowBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(70);
        }];
        
        _xianImgView=[[UIImageView alloc] init];
        _xianImgView.image= [UIImage imageNamed:@"result_player"] ;
        [self addSubview:_xianImgView];
        [_xianImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(5);
            make.left.equalTo(self.mas_left).offset(5);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(55);
        }];
        
        _xianLab=[[UILabel alloc] init];
        _xianLab.text=[HelperHandle getLanguage:@"闲"];
        _xianLab.textColor=[UIColor colorWithRed:17/255.0 green:124/255.0 blue:255/255.0 alpha:1];
        _xianLab.textAlignment=NSTextAlignmentCenter;
        [_xianImgView addSubview:_xianLab];
        [_xianLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.xianImgView.mas_top).offset(0);
            make.left.equalTo(self.xianImgView.mas_left).offset(0);
            make.bottom.equalTo(self.xianImgView.mas_bottom).offset(0);
            make.width.mas_equalTo(30);
        }];
        
        _num1Lab=[[UILabel alloc] init];
        _num1Lab.text=[HelperHandle getLanguage:@"0"];
        _num1Lab.textColor=[UIColor whiteColor];
        _num1Lab.textAlignment=NSTextAlignmentCenter;
        [_xianImgView addSubview:_num1Lab];
        [_num1Lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.xianImgView.mas_top).offset(0);
            make.left.equalTo(self.xianLab.mas_right).offset(0);
            make.bottom.equalTo(self.xianImgView.mas_bottom).offset(0);
            make.width.mas_equalTo(30);
        }];
        
        _middleView =[[UIView alloc] init];
        _middleView.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_middleView];
        [_middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.centerX.equalTo(self.mas_centerX).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(5);
        }];
        
        
        _zhuangYelloBgView=[[UIView alloc] init];
        _zhuangYelloBgView.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_zhuangYelloBgView];
        [_zhuangYelloBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.middleView.mas_left).offset(0);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(70);
        }];
        
        _zhuangImgView=[[UIImageView alloc] init];
        _zhuangImgView.image= [UIImage imageNamed:@"result_banker"] ;
        [self addSubview:_zhuangImgView];
        [_zhuangImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(5);
            make.left.equalTo(self.middleView.mas_left).offset(5);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(55);
        }];
        
        _zhuangLab=[[UILabel alloc] init];
        _zhuangLab.text=[HelperHandle getLanguage:@"庄"];
        _zhuangLab.textColor=[UIColor colorWithRed:242/255.0 green:47/255.0 blue:81/255.0 alpha:1];
        _zhuangLab.textAlignment=NSTextAlignmentCenter;
        [_zhuangImgView addSubview:_zhuangLab];
        [_zhuangLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zhuangImgView.mas_top).offset(0);
            make.left.equalTo(self.zhuangImgView.mas_left).offset(0);
            make.bottom.equalTo(self.zhuangImgView.mas_bottom).offset(0);
            make.width.mas_equalTo(30);
        }];
        
        
        _num2Lab=[[UILabel alloc] init];
        _num2Lab.text=[HelperHandle getLanguage:@"0"];
        _num2Lab.textColor=[UIColor whiteColor];
        _num2Lab.textAlignment=NSTextAlignmentCenter;
        [_zhuangImgView addSubview:_num2Lab];
        [_num2Lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zhuangImgView.mas_top).offset(0);
            make.left.equalTo(self.zhuangLab.mas_right).offset(0);
            make.bottom.equalTo(self.zhuangImgView.mas_bottom).offset(0);
            make.width.mas_equalTo(30);
        }];
        
        _yellowViewLeft=[[UIView alloc] init];
        _yellowViewLeft.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_yellowViewLeft];
        [_yellowViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(5);
        }];
        
        _yellowViewTopLeft=[[UIView alloc] init];
        _yellowViewTopLeft.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_yellowViewTopLeft];
        [_yellowViewTopLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.middleView.mas_left).offset(0);
            make.height.mas_equalTo(5);
        }];
        
        _yellowViewBottomLeft=[[UIView alloc] init];
        _yellowViewBottomLeft.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_yellowViewBottomLeft];
        [_yellowViewBottomLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.middleView.mas_left).offset(0);
            make.height.mas_equalTo(5);
        }];
        
        _yellowViewBottomRight=[[UIView alloc] init];
        _yellowViewBottomRight.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_yellowViewBottomRight];
        [_yellowViewBottomRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.left.equalTo(self.middleView.mas_right).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(5);
        }];
        
        _yellowViewRight=[[UIView alloc] init];
        _yellowViewRight.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_yellowViewRight];
        [_yellowViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.width.mas_equalTo(5);
        }];
        
        _yellowViewTopRight=[[UIView alloc] init];
        _yellowViewTopRight.backgroundColor=[UIColor colorWithRed:251/255.0 green:207/255.0 blue:50/255.0 alpha:1];
        [self addSubview:_yellowViewTopRight];
        [_yellowViewTopRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.left.equalTo(self.middleView.mas_right).offset(0);
            make.height.mas_equalTo(5);
        }];
        
        
        _cardLeft1=[[UIImageView alloc] init];
        //_cardLeft1.image=[UIImage imageNamed:@"card_8_3"];
        [self addSubview:_cardLeft1];
        
        
        _cardLeft2=[[UIImageView alloc] init];
        //_cardLeft2.image=[UIImage imageNamed:@"card_2_1"];
        [self addSubview:_cardLeft2];
        
        
        _cardLeft3=[[UIImageView alloc] init];
        //_cardLeft3.image=[UIImage imageNamed:@"card_13_3"];
        _cardLeft3.transform = CGAffineTransformMakeRotation(90 *M_PI / 180.0);
        [self addSubview:_cardLeft3];
        
        
        _cardRight1=[[UIImageView alloc] init];
        //_cardRight1.image=[UIImage imageNamed:@"card_12_1"];
        [self addSubview:_cardRight1];
        
        
        _cardRight2=[[UIImageView alloc] init];
        //_cardRight2.image=[UIImage imageNamed:@"card_7_3"];
        [self addSubview:_cardRight2];
        
        
        
        _cardRight3=[[UIImageView alloc] init];
        //_cardRight3.image=[UIImage imageNamed:@"card_7_4"];
        _cardRight3.transform = CGAffineTransformMakeRotation(90 *M_PI / 180.0);
        [self addSubview:_cardRight3];
       
        
        
        
        [self hidenLeftYellowView:YES];
        [self hidenRightYellowView:YES];
        
    }
    
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_cardLeft1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.yellowViewBottomLeft.mas_top).offset(-5);
        make.left.equalTo(self.yellowViewLeft.mas_right).offset(5);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(35);;
    }];
    [_cardLeft2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.yellowViewBottomLeft.mas_top).offset(-5);
        make.left.equalTo(self.cardLeft1.mas_right).offset(5);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(35);
    }];
    
    [_cardLeft3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.yellowViewBottomLeft.mas_top).offset(-5);
        make.left.equalTo(self.cardLeft2.mas_right).offset(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(35);
    }];
    [_cardRight1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.yellowViewBottomLeft.mas_top).offset(-5);
        make.left.equalTo(self.middleView.mas_right).offset(5);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(35);
    }];
    
    [_cardRight2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.yellowViewBottomLeft.mas_top).offset(-5);
        make.left.equalTo(self.cardRight1.mas_right).offset(5);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(35);
    }];
    [_cardRight3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.yellowViewBottomLeft.mas_top).offset(-5);
        make.left.equalTo(self.cardRight2.mas_right).offset(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(35);
    }];
    
}
-(void)hidenLeftYellowView:(BOOL)b{
    _middleView.hidden=b;
    _yellowViewLeft.hidden=b;
    _yellowViewTopLeft.hidden=b;
    _yellowViewBottomLeft.hidden=b;
    _xianYellowBgView.hidden=b;
}

-(void)hidenRightYellowView:(BOOL)b{
    _middleView.hidden=b;
    _yellowViewRight.hidden=b;
    _yellowViewTopRight.hidden=b;
    _yellowViewBottomRight.hidden=b;
    _zhuangYelloBgView.hidden=b;
}
@end
