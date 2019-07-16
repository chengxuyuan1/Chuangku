//
//  RightBgView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "RightBgView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
@implementation RightBgView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:83/255.0 green:66/255.0 blue:50/255.0 alpha:1];
        
        _zhuangLab=[[UILabel alloc] init];
        _zhuangLab.textColor=[UIColor whiteColor];
        _zhuangLab.text=[HelperHandle getLanguage:@"庄"];
        _zhuangLab.textAlignment=NSTextAlignmentCenter;
        _zhuangLab.font=[UIFont systemFontOfSize:12];
        _zhuangLab.backgroundColor=[UIColor redColor];
        _zhuangLab.layer.masksToBounds=YES;
        _zhuangLab.layer.cornerRadius=30/2;
        [self addSubview:_zhuangLab];
        
        [_zhuangLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.top.equalTo(self.mas_top).offset(10);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
        }];
        
        
        _xianLab=[[UILabel alloc] init];
        _xianLab.textColor=[UIColor whiteColor];
        _xianLab.text=[HelperHandle getLanguage:@"闲"];
        _xianLab.textAlignment=NSTextAlignmentCenter;
        _xianLab.font=[UIFont systemFontOfSize:12];
        _xianLab.backgroundColor=[UIColor blueColor];
        _xianLab.layer.masksToBounds=YES;
        _xianLab.layer.cornerRadius=30/2;
        [self addSubview:_xianLab];
        
        [_xianLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
        }];
        
        
        _heLab=[[UILabel alloc] init];
        _heLab.textColor=[UIColor whiteColor];
        _heLab.text=[HelperHandle getLanguage:@"和"];
        _heLab.textAlignment=NSTextAlignmentCenter;
        _heLab.font=[UIFont systemFontOfSize:12];
        _heLab.backgroundColor=[UIColor colorWithRed:25/255.0 green:120/255.0 blue:33/255.0 alpha:1];
        _heLab.layer.masksToBounds=YES;
        _heLab.layer.cornerRadius=30/2;
        [self addSubview:_heLab];
        
        [_heLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
        }];
        
        
        _numLab1=[[UILabel alloc] init];
        _numLab1.textColor=[UIColor whiteColor];
        _numLab1.text=@"0";
        _numLab1.textAlignment=NSTextAlignmentCenter;
        _numLab1.font=[UIFont systemFontOfSize:15];
        _numLab1.backgroundColor=[UIColor clearColor];
        [self addSubview:_numLab1];
        
        [_numLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.zhuangLab.mas_right).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(30);
            make.centerY.equalTo(self.zhuangLab.mas_centerY).offset(0);
        }];
        
        
        _numLab2=[[UILabel alloc] init];
        _numLab2.textColor=[UIColor whiteColor];
        _numLab2.text=@"0";
        _numLab2.textAlignment=NSTextAlignmentCenter;
        _numLab2.font=[UIFont systemFontOfSize:15];
        _numLab2.backgroundColor=[UIColor clearColor];
        [self addSubview:_numLab2];
        
        [_numLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.zhuangLab.mas_right).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(30);
            make.centerY.equalTo(self.xianLab.mas_centerY).offset(0);
        }];
        
        _numLab3=[[UILabel alloc] init];
        _numLab3.textColor=[UIColor whiteColor];
        _numLab3.text=@"0";
        _numLab3.textAlignment=NSTextAlignmentCenter;
        _numLab3.font=[UIFont systemFontOfSize:15];
        _numLab3.backgroundColor=[UIColor clearColor];
        [self addSubview:_numLab3];
        
        [_numLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.zhuangLab.mas_right).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(30);
            make.centerY.equalTo(self.heLab.mas_centerY).offset(0);
        }];
        
    }
        
    return self;
}
-(void)zhuangXiangNumWithArr:(NSArray *)arr{
    NSInteger zhuang=0;
    NSInteger xiang=0;
    NSInteger he=0;
    for(int i=0; i<arr.count; i++) {
        NSInteger num=[arr[i] integerValue];
        if (num==0||num==3||num==4||num==5) {
            zhuang++;
        }else if (num==1||num==6||num==7||num==8) {
            xiang++;
            
        }else if (num==2||num==9||num==10||num==11) {
            he++;
        }
    }
    
    _numLab1.text=[NSString stringWithFormat:@"%ld",zhuang];
     _numLab2.text=[NSString stringWithFormat:@"%ld",xiang];
     _numLab3.text=[NSString stringWithFormat:@"%ld",he];
}
@end
