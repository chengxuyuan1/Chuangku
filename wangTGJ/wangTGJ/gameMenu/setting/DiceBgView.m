//
//  RouletteBgView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/21.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "DiceBgView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
#import "EasyTextView.h"
@implementation DiceBgView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initTitleLab];
        [self initCanCelBtn];
        [self initSureBtn];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
    _titleLab.text=[HelperHandle getLanguage:@"请选择最常用的五种筹码:"];
    [_canCelBtn setTitle:[HelperHandle getLanguage:@"取消"] forState:UIControlStateNormal];
    [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
}
-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"请选择最常用的五种筹码:"];
    _titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _titleLab.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        make.left.equalTo(self.mas_left).offset(10);
        make.width.mas_equalTo(230);
        make.height.mas_equalTo(20);
    }];
}
-(void)initCanCelBtn{
    _canCelBtn=[[UIButton alloc] init];
    [_canCelBtn setTitle:[HelperHandle getLanguage:@"取消"] forState:UIControlStateNormal];
    [_canCelBtn setTitleColor:[UIColor colorWithRed:167/255.0 green:132/255.0 blue:104/255.0 alpha:1] forState:UIControlStateNormal];
    [_canCelBtn addTarget:self action:@selector(canCelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_canCelBtn];
    [ _canCelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(-50);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
}
-(void)canCelBtnAction:(UIButton *)btn{
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    NSArray *arr=[userDef objectForKey:@"touBao"];
    for (int i=0; i<_chipBtns.count; i++) {
        UIButton *kbtn=_chipBtns[i];
        if ([arr[i] integerValue]) {
            kbtn.layer.borderWidth=2;
        }else{
           kbtn.layer.borderWidth=0;
        }
    }
}
-(void)initSureBtn{
    _sureBtn=[[UIButton alloc] init];
    [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
    _sureBtn.backgroundColor=[UIColor colorWithRed:220/255.0 green:191/255.0 blue:160/255.0 alpha:1];
    [_sureBtn setTitleColor:[UIColor colorWithRed:6/255.0 green:0/255.0 blue:0/255.0 alpha:1] forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(sureBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _sureBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [self addSubview:_sureBtn];
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(50);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
}
-(void)sureBtnAction:(UIButton *)btn{
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    NSArray *arr=[userDef objectForKey:@"touBao"];
    NSMutableArray *muarr=[NSMutableArray arrayWithArray:arr];
    for (int i=0; i<_chipBtns.count; i++) {
        UIButton *kbtn=_chipBtns[i];
        if (kbtn.layer.borderWidth==0) {
            muarr[i]=@"0";
        }else{
             muarr[i]=@"1";
        }
    }
    [userDef setObject:muarr forKey:@"touBao"];
}
-(void)initChips{
    if (_chipBtns==nil) {
        _chipBtns=[NSMutableArray array];
        NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
        NSArray *arr=[userDef objectForKey:@"touBao"];
        if (arr==nil) {
            [userDef setObject:@[@"0",@"0",@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1"] forKey:@"touBao"];
            [userDef synchronize];
            arr=@[@"0",@"0",@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1"];
        }
        NSArray *chips=@[@"new_chip_01",@"new_chip_02",@"new_chip_03",@"new_chip_04",@"new_chip_05",@"new_chip_06",@"new_chip_07",@"new_chip_08",@"new_chip_09",@"new_chip_10"];
        NSArray *nums=@[@"10",@"20",@"50",@"100",@"200",@"500",@"1000",@"5000",@"10000",@"50000"];
        CGFloat xInd=(self.frame.size.width-50*5)/6.0;
        CGFloat yInd=(_canCelBtn.frame.origin.y-_titleLab.frame.size.height-_titleLab.frame.origin.y-50*2)/3.0;
        for (int i=0; i<chips.count; i++) {
            UIButton *btn=[[UIButton alloc] init];
             [btn setImage:[UIImage imageNamed:chips[i]] forState:UIControlStateNormal];
            [btn setTitle:[HelperHandle getLanguage:[NSString stringWithFormat:@"%@",nums[i]]] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(chipBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=7000+i;
            //btn.backgroundColor=[UIColor redColor];
            btn.titleLabel.font=[UIFont systemFontOfSize:12];
            btn.titleEdgeInsets=UIEdgeInsetsMake(0,-120, 30, 0);
            btn.imageEdgeInsets=UIEdgeInsetsMake(20, 0, 0, 0);
            [self addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(xInd+i%5*xInd+i%5*50);
                make.top.equalTo(self.titleLab.mas_bottom).offset(yInd+i/5*yInd+i/5*50);
                make.width.mas_equalTo(50);
                make.height.mas_equalTo(50);
            }];
            if ([arr[i] integerValue]) {
                btn.layer.borderWidth=2;
            }else{
                btn.layer.borderWidth=0;
            }
            btn.layer.borderColor=[UIColor colorWithRed:168/255.0 green:132/255.0 blue:102/255.0 alpha:1].CGColor;
            [_chipBtns addObject:btn];
        }
    }
}
-(void)chipBtnAction:(UIButton *)btn{
  
    if (btn.layer.borderWidth==0) {
        btn.layer.borderWidth=2;
    }else{
         btn.layer.borderWidth=0;
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self initChips];
}
@end
