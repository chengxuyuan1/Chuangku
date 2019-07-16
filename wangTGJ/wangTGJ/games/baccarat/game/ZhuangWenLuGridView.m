//
//  ZhuangWenLuGridView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/23.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "ZhuangWenLuGridView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "HollowCircleView.h"
#import "TopNumPoint.h"
#import "GridBgView.h"

@implementation ZhuangWenLuGridView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        
        _backBtn=[[UIButton alloc] init];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"new_ver_tap"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"new_ver_roadmap_arrow"] forState:UIControlStateNormal];
        [_backBtn setImageEdgeInsets:UIEdgeInsetsMake(smallW, 5, smallW, 5)];
        [_backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        //顺时针 旋转180度
        _backBtn.transform = CGAffineTransformMakeRotation(180 *M_PI / 180.0);
        
        [self addSubview:_backBtn];
        [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.width.mas_equalTo(30);
             make.height.mas_equalTo(50);
        }];
        
        
        _gridSmallView=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _gridSmallView.lineColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        _gridSmallView.backgroundColor=[UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];
        [self addSubview:_gridSmallView];
        
        
        _blackLine=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _blackLine.backgroundColor=[UIColor blueColor];
        [self addSubview:_blackLine];
        
        
        _grid2View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _grid2View.lineColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        _grid2View.backgroundColor=[UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];
        [self addSubview:_grid2View];
        
        
        
        _blackLine2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
        _blackLine2.backgroundColor=[UIColor blueColor];
        [self addSubview:_blackLine2];
        
        
     
        
        _grid3View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
        _grid3View.lineColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        _grid3View.backgroundColor=[UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];
        [self insertSubview:_grid3View atIndex:0];
        
        
        _blackLine3=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
        _blackLine3.backgroundColor=[UIColor blueColor];
        [self addSubview:_blackLine3];
        
        
        
        
        
        _grid4View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
        _grid4View.lineColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        _grid4View.backgroundColor=[UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];
        [self insertSubview:_grid4View atIndex:0];
        
        
        
        _blackLine4=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
        _blackLine4.backgroundColor=[UIColor blueColor];
        [self addSubview:_blackLine4];
        
        
        
        
        
        _grid5View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
        _grid5View.lineColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        _grid5View.backgroundColor=[UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];
        [self insertSubview:_grid5View atIndex:0];
        
        
        
        _whiteBgView=[[UIView alloc] init];
        _whiteBgView.backgroundColor=[UIColor whiteColor];
        [self addSubview:_whiteBgView];
        
        
       
        
        _sumLab=[[UILabel alloc] init];
        _sumLab.textColor=[UIColor blackColor];
        _sumLab.text=[HelperHandle getLanguage:@"总数"];
        _sumLab.font=[UIFont systemFontOfSize:9];
        [self addSubview:_sumLab];
  
        
         [self updateGridView:GridTypeShort];//设置约束
        
        _numLab=[[UILabel alloc] init];
        _numLab.textColor=[UIColor blackColor];
        _numLab.text=@"17";
        _numLab.font=[UIFont systemFontOfSize:10];
        _numLab.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_numLab];
        [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.sumLab.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(20/25.0);
        }];
        
        _zhuangLab=[[UILabel alloc] init];
        _zhuangLab.textColor=[UIColor colorWithRed:132/255.0 green:0/255.0 blue:11/255.0 alpha:1];
        _zhuangLab.text=[HelperHandle getLanguage:@"庄"];
        _zhuangLab.font=[UIFont systemFontOfSize:10];
        [self addSubview:_zhuangLab];
        [_zhuangLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numLab.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(10/25.0);
        }];
        
        _numLab1=[[UILabel alloc] init];
        _numLab1.textColor=[UIColor blackColor];
        _numLab1.text=@"9";
        _numLab1.font=[UIFont systemFontOfSize:10];
        _numLab1.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_numLab1];
        [_numLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.zhuangLab.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(20/25.0);
        }];
        
        
        _xianLab=[[UILabel alloc] init];
        _xianLab.textColor=[UIColor blueColor];
        _xianLab.text=[HelperHandle getLanguage:@"闲"];
        _xianLab.textAlignment=NSTextAlignmentCenter;
        _xianLab.font=[UIFont systemFontOfSize:10];
        [self addSubview:_xianLab];
        [_xianLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numLab1.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(10/25.0);
        }];
        
        
        _numLab2=[[UILabel alloc] init];
        _numLab2.textColor=[UIColor blackColor];
        _numLab2.text=@"9";
        _numLab2.font=[UIFont systemFontOfSize:10];
        _numLab2.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_numLab2];
        [_numLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.xianLab.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(20/25.0);
        }];
        
        
        _heLab=[[UILabel alloc] init];
        _heLab.textColor=[UIColor greenColor];
        _heLab.text=[HelperHandle getLanguage:@"和"];
        _heLab.textAlignment=NSTextAlignmentCenter;
        _heLab.font=[UIFont systemFontOfSize:10];
        [self addSubview:_heLab];
        [_heLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numLab2.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(10/25.0);
        }];
        
        
        _numLab3=[[UILabel alloc] init];
        _numLab3.textColor=[UIColor blackColor];
        _numLab3.text=@"9";
        _numLab3.textAlignment=NSTextAlignmentCenter;
        _numLab3.font=[UIFont systemFontOfSize:10];
        [self addSubview:_numLab3];
        [_numLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.heLab.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(20/25.0);
        }];
        
        _zhuangLab=[[UILabel alloc] init];
        _zhuangLab.textColor=[UIColor colorWithRed:109/255.0 green:18/255.0 blue:22/255.0 alpha:1];
        _zhuangLab.text=[HelperHandle getLanguage:@"庄对"];
        _zhuangLab.textAlignment=NSTextAlignmentCenter;
        _zhuangLab.font=[UIFont systemFontOfSize:10];
        [self addSubview:_zhuangLab];
        [_zhuangLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numLab3.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width);
        }];
        
        _numLab4=[[UILabel alloc] init];
        _numLab4.textColor=[UIColor blackColor];
        _numLab4.text=@"9";
        _numLab4.font=[UIFont systemFontOfSize:10];
        _numLab4.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_numLab4];
        [_numLab4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.zhuangLab.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(20/25.0);
        }];
        
        _xianDuiLab=[[UILabel alloc] init];
        _xianDuiLab.textColor=[UIColor colorWithRed:109/255.0 green:18/255.0 blue:22/255.0 alpha:1];
        _xianDuiLab.text=[HelperHandle getLanguage:@"闲对"];
        _xianDuiLab.textAlignment=NSTextAlignmentCenter;
        _xianDuiLab.font=[UIFont systemFontOfSize:10];
        [self addSubview:_xianDuiLab];
        [_xianDuiLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numLab4.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width);
        }];
        
        _numLab5=[[UILabel alloc] init];
        _numLab5.textColor=[UIColor blackColor];
        _numLab5.text=@"9";
        _numLab5.font=[UIFont systemFontOfSize:10];
        _numLab5.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_numLab5];
        [_numLab5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.xianDuiLab.mas_right).offset(0);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(self.sumLab.mas_width).multipliedBy(20/25.0);
        }];
        
        
        _leftLine=[[UIView alloc] init];
        _leftLine.backgroundColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        [self addSubview:_leftLine];
        [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.height.mas_equalTo(self.mas_height).multipliedBy(0.77);
            make.width.mas_equalTo(1);
        }];
        
        
        _rightLine=[[UIView alloc] init];
        _rightLine.backgroundColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        [self addSubview:_rightLine];
        [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.grid2View.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.height.mas_equalTo(self.mas_height).multipliedBy(0.77);
            make.width.mas_equalTo(1);
        }];
        
        
        _topLine=[[UIView alloc] init];
        _topLine.backgroundColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        [self addSubview:_topLine];
        [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.height.mas_equalTo(1);
            //make.width.mas_equalTo(self.mas_width).multipliedBy(0.9);
            make.right.equalTo(self.rightLine.mas_left);
        }];
        
     
        
        _bottomLine=[[UIView alloc] init];
        _bottomLine.backgroundColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        [self addSubview:_bottomLine];
        [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.leftLine.mas_bottom).offset(0);
            make.height.mas_equalTo(1);
            //make.width.mas_equalTo(self.mas_width).multipliedBy(0.9);
            make.right.equalTo(self.rightLine.mas_left);
        }];
        
//        _zhuangWenLuLab=[[UILabel alloc] init];
//        _zhuangWenLuLab.text=[HelperHandle getLanguage:@"珠问路"];
//        _zhuangWenLuLab.textColor=[UIColor colorWithRed:116/255.0 green:1/255.0 blue:13/255.0 alpha:1];
//        _zhuangWenLuLab.font=[UIFont systemFontOfSize:10];
//        [self addSubview:_zhuangWenLuLab];
//        [_zhuangWenLuLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).offset(5);
//            make.top.equalTo(self.bottomLine.mas_bottom).offset(0);
//            make.height.mas_equalTo(bigW);
//            make.width.mas_equalTo(35);
//        }];
//
//        _hollowCircleView=[[UIView alloc] init];
//        [_hollowCircleView.layer setCornerRadius:smallW/2];
//        _hollowCircleView.layer.masksToBounds = YES;
//        _hollowCircleView.layer.borderWidth = 1;//边框width
//        _hollowCircleView.layer.borderColor = [[UIColor redColor] CGColor];//边框color
//        [self addSubview:_hollowCircleView];
//        [_hollowCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.zhuangWenLuLab.mas_centerY).offset(0);
//            make.left.equalTo(self.zhuangWenLuLab.mas_right).offset(0);
//            make.height.mas_equalTo(smallW);
//            make.width.mas_equalTo(smallW);
//        }];
        
        
//        _redCircularView=[[RedCircularView alloc] init];
//        _redCircularView.bgColor=[UIColor redColor];
//        [self addSubview:_redCircularView];
//        [_redCircularView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.zhuangWenLuLab.mas_centerY).offset(0);
//            make.left.equalTo(self.hollowCircleView.mas_right).offset(10);
//            make.height.mas_equalTo(smallW);
//            make.width.mas_equalTo(smallW);
//        }];
//
//        _slantLine=[[SlantLine alloc] init];
//        _slantLine.r=251.1;
//        _slantLine.g=0.1;
//        _slantLine.b=6.1;
//        [self addSubview:_slantLine];
//        [_slantLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.zhuangWenLuLab.mas_centerY).offset(0);
//            make.left.equalTo(self.redCircularView.mas_right).offset(10);
//            make.height.mas_equalTo(smallW);
//            make.width.mas_equalTo(smallW);
//        }];
        
        
//        _zxianWenLuLab=[[UILabel alloc] init];
//        _zxianWenLuLab.text=[HelperHandle getLanguage:@"闲问路"];
//        _zxianWenLuLab.textColor=[UIColor blueColor];
//        _zxianWenLuLab.font=[UIFont systemFontOfSize:10];
//        [self addSubview:_zxianWenLuLab];
//        [_zxianWenLuLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.slantLine.mas_right).offset(10);
//            make.centerY.equalTo(self.slantLine.mas_centerY).offset(0);
//            make.height.mas_equalTo(bigW);
//            make.width.mas_equalTo(35);
//        }];
        
//        _hollowCircleView2=[[UIView alloc] init];
//        [_hollowCircleView2.layer setCornerRadius:smallW/2];
//        _hollowCircleView2.layer.masksToBounds = YES;
//        _hollowCircleView2.layer.borderWidth = 1;//边框width
//        _hollowCircleView2.layer.borderColor = [[UIColor blueColor] CGColor];//边框color
//        [self addSubview:_hollowCircleView2];
//        [_hollowCircleView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.zxianWenLuLab.mas_centerY).offset(0);
//            make.left.equalTo(self.zxianWenLuLab.mas_right).offset(0);
//            make.height.mas_equalTo(smallW);
//            make.width.mas_equalTo(smallW);
//        }];
        
        
        
//        _redCircularView2=[[RedCircularView alloc] init];
//        _redCircularView2.bgColor=[UIColor blueColor];
//        [self addSubview:_redCircularView2];
//        [_redCircularView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.hollowCircleView2.mas_centerY).offset(0);
//            make.left.equalTo(self.hollowCircleView2.mas_right).offset(10);
//            make.height.mas_equalTo(smallW);
//            make.width.mas_equalTo(smallW);
//        }];
        
//        _slantLine2=[[SlantLine alloc] init];
//        _slantLine2.r=3;
//        _slantLine2.g=0;
//        _slantLine2.b=185;
//        [self addSubview:_slantLine2];
//        [_slantLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.redCircularView2.mas_centerY).offset(0);
//            make.left.equalTo(self.redCircularView2.mas_right).offset(10);
//            make.height.mas_equalTo(smallW);
//            make.width.mas_equalTo(smallW);
//        }];
        
        
        _quanluBtn=[[UIButton alloc] init];
        _quanluBtn.backgroundColor=[UIColor colorWithRed:253/255.0 green:131/255.0 blue:44/255.0 alpha:1];
        [_quanluBtn setTitle:[HelperHandle getLanguage:@"全路"] forState:UIControlStateNormal];
        [_quanluBtn addTarget:self action:@selector(quanluBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _quanluBtn.titleLabel.font=[UIFont systemFontOfSize:10];
        [self addSubview:_quanluBtn];
        [_quanluBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomLine.mas_bottom).offset(0);
            make.right.equalTo(self.rightLine.mas_left).offset(-10);
            make.height.mas_equalTo(18);
            make.width.mas_equalTo(25);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    
    return self;
}
-(void)updateLanguage{
    _sumLab.text=[HelperHandle getLanguage:@"总数"];
    _zhuangLab.text=[HelperHandle getLanguage:@"庄"];
    _xianLab.text=[HelperHandle getLanguage:@"闲"];
    _heLab.text=[HelperHandle getLanguage:@"和"];
    _zhuangLab.text=[HelperHandle getLanguage:@"庄对"];
    _xianDuiLab.text=[HelperHandle getLanguage:@"闲对"];
    [_quanluBtn setTitle:[HelperHandle getLanguage:@"全路"] forState:UIControlStateNormal];
}
-(void)quanluBtnAction:(UIButton *)btn{
    
}


-(void)updataGridSmallViewWithArr:(NSArray *)arr{
    _gridArr=arr;
    if (arr.count>(_w1*6-4)) {//显示最新数据
        NSMutableArray *muarr=[NSMutableArray array];
        NSInteger num=arr.count-(_w1*6-4);
        for (NSInteger i=num; i<arr.count; i++) {
            [muarr addObject:arr[i]];
        }
        arr=muarr;
    }
    
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<_w1; i++) {
        for (int j=0; j<6; j++) {
            NSInteger num=i+j*_w1;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    
    for (int i=0;i<arr.count;i++) {
        if (i>varr.count-1) {
            return;
        }
        NSInteger num=[arr[i] integerValue];
        NSInteger gNum=[varr[i] integerValue];
        UIView *view=_gridSmallView.section0Array[gNum];
        UIImageView *imgView=[[UIImageView alloc] init];
        if (num==0||num==3||num==4||num==5) {
            imgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"bead_banker"]];
        }else if (num==1||num==6||num==7||num==8) {
            imgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"bead_player"]];
        }else if (num==2||num==9||num==10||num==11) {
            imgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"bead_tie"]];
        }
        [view addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_left).offset(0);
            make.top.equalTo(view.mas_top).offset(0);
            make.right.equalTo(view.mas_right).offset(0);
            make.bottom.equalTo(view.mas_bottom).offset(0);
        }];
    }
}

-(void)updateGrid2ViewWith:(NSArray *)arr{
    _gridArr=arr;
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<_w2*2; i++) {
        for (int j=0; j<6; j++) {
            NSInteger num=i+j*_w2*2;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    
    int j=0;
    int he=0;
    NSString *round=@"";
    for (int i=0;i<arr.count;i++) {
        if (i>varr.count-1) {
            return;
        }
        
        NSInteger num=[arr[i] integerValue];
        
        UIImageView *imgView=[[UIImageView alloc] init];
        
        HollowCircleView * hollowCircleView=[[HollowCircleView alloc] init];
        
        if (num==0||num==3||num==4||num==5) {
            he=0;
            imgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"bead_banker"]];
            hollowCircleView.bgColor=[UIColor redColor];
            if ([round isEqualToString:@"庄"]) {
                round=@"庄";
            }else{
                round=@"庄";
                NSInteger k=j%6;
                if (j>0) {
                    j+=6-k;
                }
                
            }
        }else if (num==1||num==6||num==7||num==8) {
            he=0;
            imgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"bead_player"]];
            hollowCircleView.bgColor=[UIColor blueColor];
            if ([round isEqualToString:@"闲"]) {
                round=@"闲";
            }else{
                round=@"闲";
                NSInteger k=j%6;
                if (j>0) {
                    j+=6-k;
                }
            }
        }else if (num==2||num==9||num==10||num==11) {
            imgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"bead_tie"]];
            hollowCircleView.bgColor=[UIColor greenColor];
            SlantLine *slantLine2=[[SlantLine alloc] init];
            slantLine2.r=45;
            slantLine2.g=225;
            slantLine2.b=32;
            hollowCircleView=slantLine2;
            if ([round isEqualToString:@"和"]) {
                //round=@"和";
            }else{
                //round=@"和";
                he++;
                
                NSInteger k=j%6;
                if (j>0) {
                    j-=1;
                }
            }
        }
        if (j>varr.count-1) {
            return;
        }
        NSInteger gNum=[varr[j] integerValue];
        GridBgView *view=_grid2View.section0Array[gNum];
        if (he>0) {
            view.textLab.text=[NSString stringWithFormat:@"%d",he];
        }
        
        [view addSubview: hollowCircleView];
        [ hollowCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_left).offset(0);
            make.top.equalTo(view.mas_top).offset(0);
            make.right.equalTo(view.mas_right).offset(0);
            make.bottom.equalTo(view.mas_bottom).offset(0);
        }];
        j++;
    }
}
-(void)disPlayPointVarr:(NSMutableArray *)varr Pvarr:(NSMutableArray *)pvarr topArr:(NSMutableArray *)topArr result:(void(^)(NSMutableArray *arr1,NSMutableArray *arr2))complete{
    for (int i=0; i<varr.count; i+=3) {
        
        for (int j=0; j<6; j++) {
            NSNumber *num;
            TopNumPoint *top=[[TopNumPoint alloc] init];
            if (j==0) {
                top.x=0;
                top.y=0;
                num=varr[i+0];
            }
            if (j==1) {
                top.x=0;
                top.y=5;
                num=varr[i+0];
            }
            if (j==2) {
                top.x=0;
                top.y=0;
                if (varr.count>(i+1)) {
                    num=varr[i+1];
                }
                
            }
            if (j==3) {
                top.x=0;
                top.y=5;
                
                if (varr.count>(i+1)) {
                    num=varr[i+1];
                }
            }
            if (j==4) {
                top.x=0;
                top.y=0;
                if (varr.count>(i+2)) {
                    num=varr[i+2];
                }
                
            }
            if (j==5) {
                top.x=0;
                top.y=5;
                if (varr.count>(i+2)) {
                    num=varr[i+2];
                }
            }
            if (num) {
                [pvarr addObject:num];
                [topArr addObject:top];
            }
            
        }
        
        for (int j=0; j<6; j++) {
            NSNumber *num;
            TopNumPoint *top=[[TopNumPoint alloc] init];
            if (j==0) {
                top.x=5;
                top.y=0;
                num=varr[i+0];
            }
            if (j==1) {
                top.x=5;
                top.y=5;
                num=varr[i+0];
            }
            if (j==2) {
                top.x=5;
                top.y=0;
                if (varr.count>(i+1)) {
                    num=varr[i+1];
                }
            }
            if (j==3) {
                top.x=5;
                top.y=5;
                if (varr.count>(i+1)) {
                    num=varr[i+1];
                }
            }
            if (j==4) {
                top.x=5;
                top.y=0;
                if (varr.count>(i+2)) {
                    num=varr[i+2];
                }
            }
            if (j==5) {
                top.x=5;
                top.y=5;
                if (varr.count>(i+2)) {
                    num=varr[i+2];
                }
            }
            if (num) {
                [pvarr addObject:num];
                [topArr addObject:top];
            }
        }
    }
    
}
-(void)calculationZhuangXiangNumArr:(NSArray *)arr muarr:(NSMutableArray *)muarr{
    //计算庄闲个数
    //int j=0;
    NSString *round=@"";
    int p=0;
    for (int i=0;i<arr.count;i++) {
        
        NSInteger num=[arr[i] integerValue];
        
        if (num==0||num==3||num==4||num==5) {
            
            if ([round isEqualToString:@"庄"]) {
                round=@"庄";
                p++;
            }else{
                if (p>0) {
                    [muarr addObject:[NSNumber numberWithInt:p]];
                }
                
                p=0;
                p++;
                round=@"庄";
                
                
            }
        }
        if (num==1||num==6||num==7||num==8) {
            
            if ([round isEqualToString:@"闲"]) {
                round=@"闲";
                p++;
            }else{
                if (p>0) {
                    [muarr addObject:[NSNumber numberWithInt:p]];
                }
                p=0;
                p++;
                round=@"闲";
                
            }
        }
        // else if (num==2||num==9||num==10||num==11) {
        //            SlantLine *slantLine2=[[SlantLine alloc] init];
        //            slantLine2.r=45;
        //            slantLine2.g=225;
        //            slantLine2.b=32;
        //            //hollowCircleView=slantLine2;
        //            if ([round isEqualToString:@"和"]) {
        //                round=@"和";
        //
        //            }else{
        //                if (p>0) {
        //                    //[muarr addObject:[NSNumber numberWithInt:p]];
        //                }
        //                p=0;
        //                round=@"和";
        //                NSInteger k=j%6;
        //                if (j>0) {
        //                    j-=1;
        //                }
        //            }
        //        }
        
    }
}
-(void)calcultationHongLangNumLuMuarr:(NSArray*)luMuarr hongLang:(NSMutableArray *)hongLang{
    NSInteger hong=0;
    NSInteger lang=0;
    if (luMuarr.count>1) {
        for (int i=0; i<luMuarr.count; i++) {
            if ([luMuarr[i] isEqualToString:@"红"]) {
                hong++;
            }else if ([luMuarr[i] isEqualToString:@"蓝"]) {
                lang++;
            }
            if (i>0&&![luMuarr[i] isEqualToString:luMuarr[i-1]]) {
                if (hong>0&&[luMuarr[i-1] isEqualToString:@"红"]) {
                    [hongLang addObject:[NSNumber numberWithInteger:hong]];
                    hong=0;
                }
                if (lang>0&&[luMuarr[i-1] isEqualToString:@"蓝"]) {
                    [hongLang addObject:[NSNumber numberWithInteger:lang]];
                    lang=0;
                }
                
            }
        }
    }
    if (lang>0) {
        [hongLang addObject:[NSNumber numberWithInteger:lang]];
    }
    if (hong>0) {
        [hongLang addObject:[NSNumber numberWithInteger:hong]];
    }
}
-(void)updateGrid3ViewWith:(NSArray *)arr{
    _gridArr=arr;
    //计算显示位置
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<_w2*2; i++) {
        for (int j=0; j<3; j++) {
            NSInteger num=i+j*_w2*2;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    //计算显示位置
    __block  NSMutableArray *pvarr=[NSMutableArray array];
    __block  NSMutableArray *topArr=[NSMutableArray array];
    [self disPlayPointVarr:varr Pvarr:pvarr topArr:topArr result:^(NSMutableArray *arr1, NSMutableArray *arr2) {
        pvarr=arr1;
        topArr=arr2;
    }];
    
    
    
    
    //计算庄闲个数
    NSMutableArray *muarr=[NSMutableArray array];
    [self calculationZhuangXiangNumArr:arr muarr:muarr];
    
    
    //大眼路结果
    NSMutableArray *luMuarr=[NSMutableArray array];
    if (muarr.count>1) {
        for (int i=1; i<muarr.count; i++) {
            NSInteger num1=[muarr[i-1] integerValue];
            NSInteger num2=[muarr[i] integerValue];
            for (int j=1; j<=num2; j++) {
                if (j==1&&i==1) {
                    continue;
                }else if (j==1) {
                    if (num1==[muarr[i-2] integerValue]) {
                        [luMuarr addObject:@"红"];
                    }else{
                        [luMuarr addObject:@"蓝"];
                    }
                    
                }else
                    if ((j-num1)<=0) {
                        [luMuarr addObject:@"红"];
                        
                    }else if ((j-num1)==1) {
                        [luMuarr addObject:@"蓝"];
                    }
                    else if ((j-num1)>=2) {
                        [luMuarr addObject:@"红"];
                    }
                
            }
 
        }
    }
    
    
    
    NSString *color;
    NSInteger m=0;
    
    
    //显示红蓝
    for (int i=0; i<luMuarr.count; i++) {
        if (![color isEqualToString:luMuarr[i]]) {
            NSInteger k=m%6;
            if (k>0) {
                m+=6-k;
            }
        }
        color=luMuarr[i];
        HollowCircleView * hollowCircleView=[[HollowCircleView alloc] init];
        if ([color isEqualToString:@"红"]) {
            hollowCircleView.bgColor=[UIColor redColor];
        }else{
            hollowCircleView.bgColor=[UIColor blueColor];
        }
        if (m>4*varr.count-1) {
            return;
        }
        
        NSInteger gNum=[pvarr[m] integerValue];
        UIView *view=_grid3View.section0Array[gNum];
        [view addSubview: hollowCircleView];
        
        TopNumPoint *top=topArr[m];
        NSInteger x=top.x;
        NSInteger y=top.y;
        if (x>0) {
            x=view.frame.size.width/2.0;
        }
        if (y>0) {
            y=view.frame.size.height/2.0;
        }
        
        [ hollowCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_left).offset(x);
            make.top.equalTo(view.mas_top).offset(y);
            make.width.mas_equalTo(view.frame.size.width/2.0);
            make.height.mas_equalTo(view.frame.size.height/2.0);
        }];
        
        m++;
    }
    
    
    
}


-(void)updateGrid4ViewInitWithArr:(NSArray *)arr{
    _gridArr=arr;
    //计算显示位置
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<_w2; i++) {
        for (int j=0; j<3; j++) {
            NSInteger num=i+j*_w2;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    //计算显示位置
    __block  NSMutableArray *pvarr=[NSMutableArray array];
    __block  NSMutableArray *topArr=[NSMutableArray array];
    [self disPlayPointVarr:varr Pvarr:pvarr topArr:topArr result:^(NSMutableArray *arr1, NSMutableArray *arr2) {
        pvarr=arr1;
        topArr=arr2;
    }];
    
    
    
    //计算庄闲个数
    NSMutableArray *muarr=[NSMutableArray array];
    [self calculationZhuangXiangNumArr:arr muarr:muarr];
    
    
    //小路结果
    NSMutableArray *luMuarr=[NSMutableArray array];
    for (int i=0; i<muarr.count; i++) {
        if (muarr.count>(i+2)) {
            NSInteger num1=[muarr[i] integerValue];
            NSInteger num3=[muarr[i+2] integerValue];
            for (int j=1; j<=num3; j++) {
                if (j==1&&i==0) {
                    continue;
                }else if(j==1&&i>0){
                    if (muarr[i+1]==muarr[i-1]) {
                        [luMuarr addObject:@"红"];
                    }else{
                        [luMuarr addObject:@"蓝"];
                    }
                }else if(j-num1<=-4){
                    [luMuarr addObject:@"蓝"];
                }
                else
                    if (j-num1==1) {
                        [luMuarr addObject:@"蓝"];
                    }else
                        if (j-num1>=-3&&j-num1<=0) {
                            [luMuarr addObject:@"红"];
                        }else
                            if (j-num1>=2) {
                                
                                [luMuarr addObject:@"红"];
                                
                            }
            }
            
        }
    }
    
    //计算红蓝个数
    NSMutableArray *hongLang=[NSMutableArray array];
    [self calcultationHongLangNumLuMuarr:luMuarr hongLang:hongLang];
    
    
    NSString *color;
    NSInteger m=0;
    //第一个是红还是蓝
    if(luMuarr.count>0&&[luMuarr[0] isEqualToString:@"红"]){
        color=@"红";
    }else{
        color=@"蓝";
    }
    
    //显示红蓝
    for (int i=0; i<hongLang.count; i++) {
        NSInteger num=[hongLang[i] integerValue];
        
        for (int j=0; j<num; j++) {
            
            HollowCircleView * hollowCircleView=[[HollowCircleView alloc] init];
            if ([color isEqualToString:@"红"]) {
                hollowCircleView.bgColor=[UIColor redColor];
                hollowCircleView.circleType=CircleTypeSolid;
                
            }else{
                hollowCircleView.bgColor=[UIColor blueColor];
                hollowCircleView.circleType=CircleTypeSolid;
            }
            if (m>4*varr.count-1) {
                return;
            }
            NSInteger gNum=[pvarr[m] integerValue];
            UIView *view=_grid4View.section0Array[gNum];
            [view addSubview: hollowCircleView];
            
            TopNumPoint *top=topArr[m];
            NSInteger x=top.x;
            NSInteger y=top.y;
            if (x>0) {
                x=view.frame.size.width/2.0;
            }
            if (y>0) {
                y=view.frame.size.height/2.0;
            }
            
            [ hollowCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view.mas_left).offset(x);
                make.top.equalTo(view.mas_top).offset(y);
                make.width.mas_equalTo(view.frame.size.width/2.0);
                make.height.mas_equalTo(view.frame.size.height/2.0);
            }];
            
            m++;
            
        }
        NSInteger k=m%6;
        if (k>0) {
            m+=6-k;
        }
        
        if ([color isEqualToString:@"红"]) {
            color=@"蓝";
        }else{
            color=@"红";
        }
        
    }
    
    
    
    
}



-(void)updateGrid5ViewInitWithArr:(NSArray *)arr{
    _gridArr=arr;
    //计算显示位置
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<_w2; i++) {
        for (int j=0; j<3; j++) {
            NSInteger num=i+j*_w2;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    //计算显示位置
    __block  NSMutableArray *pvarr=[NSMutableArray array];
    __block  NSMutableArray *topArr=[NSMutableArray array];
    [self disPlayPointVarr:varr Pvarr:pvarr topArr:topArr result:^(NSMutableArray *arr1, NSMutableArray *arr2) {
        pvarr=arr1;
        topArr=arr2;
    }];
    
    
    
    //计算庄闲个数
    NSMutableArray *muarr=[NSMutableArray array];
    [self calculationZhuangXiangNumArr:arr muarr:muarr];
    
    //小强路结果
    NSMutableArray *luMuarr=[NSMutableArray array];
    for (int i=0; i<muarr.count; i++) {
        if (muarr.count>(i+3)) {
            NSInteger num1=[muarr[i] integerValue];
            NSInteger num4=[muarr[i+3] integerValue];
            for (int j=1; j<=num4; j++) {
                if (j==1&&i==0) {
                    continue;
                }else if(j==1&&i>0){
                    if (muarr[i+2]==muarr[i-1]) {
                        [luMuarr addObject:@"红"];
                    }else{
                        [luMuarr addObject:@"蓝"];
                    }
                }else
                    if (j-num1>=2) {
                        [luMuarr addObject:@"红"];
                    }else
                        if (j-num1<0) {
                            [luMuarr addObject:@"红"];
                        }
                        else
                            if (j==num1) {
                                [luMuarr addObject:@"红"];
                            }else if(j-num1==1){
                                [luMuarr addObject:@"蓝"];
                            }
                
            }
            
        }
    }
    
    //计算红蓝个数
    NSMutableArray *hongLang=[NSMutableArray array];
    [self calcultationHongLangNumLuMuarr:luMuarr hongLang:hongLang];
    
    
    
    
    NSString *color;
    NSInteger m=0;
    //第一个是红还是蓝
    if(luMuarr.count>0&&[luMuarr[0] isEqualToString:@"红"]){
        color=@"红";
    }else{
        color=@"蓝";
    }
    
    
    
    
    //显示红蓝
    for (int i=0; i<hongLang.count; i++) {
        NSInteger num=[hongLang[i] integerValue];
        
        for (int j=0; j<num; j++) {
            SlantLine *slantLine2=[[SlantLine alloc] init];
            if ([color isEqualToString:@"红"]) {
                slantLine2.r=251;
                slantLine2.g=0;
                slantLine2.b=6;
                
            }else{
                slantLine2.r=0;
                slantLine2.g=0;
                slantLine2.b=252;
            }
            if (m>4*varr.count-1) {
                return;
            }
            NSInteger gNum=[pvarr[m] integerValue];
            UIView *view=_grid5View.section0Array[gNum];
            [view addSubview: slantLine2];
            
            TopNumPoint *top=topArr[m];
            NSInteger x=top.x;
            NSInteger y=top.y;
            if (x>0) {
                x=view.frame.size.width/2.0;
            }
            if (y>0) {
                y=view.frame.size.height/2.0;
            }
            
            [ slantLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view.mas_left).offset(x);
                make.top.equalTo(view.mas_top).offset(y);
                make.width.mas_equalTo(view.frame.size.width/2.0);
                make.height.mas_equalTo(view.frame.size.height/2.0);
            }];
            
            m++;
            
        }
        NSInteger k=m%6;
        if (k>0) {
            m+=6-k;
        }
        
        if ([color isEqualToString:@"红"]) {
            color=@"蓝";
        }else{
            color=@"红";
        }
        
    }
    
    
}
-(void)zongShuNumWithArr:(NSArray*)arr{
    //谁赢了 0庄 1闲 2和 3庄赢 庄对 4 庄赢 闲对 5 庄赢 庄对闲对 6闲赢 庄对 7闲赢 闲对 8闲赢 庄对闲对 9和赢 庄对 10和赢 闲对 11和赢 庄对闲对
    //计算庄闲个数
    NSInteger sum=arr.count;
    NSInteger zhuang=0;
    NSInteger xian=0;
    NSInteger he=0;
    NSInteger zhuangDui=0;
    NSInteger xianDui=0;
 
    for (int i=0;i<arr.count;i++) {
        NSInteger num=[arr[i] integerValue];
        if (num==0) {
            zhuang++;
        }
        if (num==1) {
            xian++;
        }
        if (num==2) {
            he++;
        }
        if (num==3||num==5||num==6||num==8||num==9||num==11) {
            zhuangDui++;
        }
        if (num==4||num==5||num==7||num==8||num==10||num==11) {
            xianDui++;
        }
    }
    _numLab.text=[NSString stringWithFormat:@"%ld",sum];
    _numLab1.text=[NSString stringWithFormat:@"%ld",zhuang];
    _numLab2.text=[NSString stringWithFormat:@"%ld",xian];
    _numLab3.text=[NSString stringWithFormat:@"%ld",he];
    _numLab4.text=[NSString stringWithFormat:@"%ld",zhuangDui];
    _numLab5.text=[NSString stringWithFormat:@"%ld",xianDui];
}
-(void)updateGridView:(GridType)gridType{
    if (gridType==GridTypeShort) {
        _w1=4;
        _w2=9;
    }else{
        _w1=11;
        _w2=17;
        
    }
    [_gridSmallView initGirdWithWNumber:_w1 With:bigW Count:_w1*6];
    [_gridSmallView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.height.mas_equalTo(6*bigW);
        make.width.mas_equalTo(self.w1*bigW);
    }];
    
    
    [_blackLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gridSmallView.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.height.mas_equalTo(6*bigW);
        make.width.mas_equalTo(1);
    }];
    
    [_grid2View initGirdWithWNumber:_w2*2 With:smallW Count:_w2*2*6];
    [_grid2View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.height.mas_equalTo(6*smallW);
        make.width.mas_equalTo(self.w2*2*smallW);
    }];
    
    
    [_blackLine2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.grid2View.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(self.w2*2*smallW);
    }];
    
    [_grid3View initGirdWithWNumber:_w2*2 With:smallW Count:_w2*2*3];
    [_grid3View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.grid2View.mas_bottom).offset(0);
        make.height.mas_equalTo(3*smallW);
        make.width.mas_equalTo(self.w2*2*smallW);
    }];
    
    
    [_blackLine3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gridSmallView.mas_right).offset(0);
        make.top.equalTo(self.grid3View.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(self.w2*2*smallW);
    }];
    
    
    [_grid4View initGirdWithWNumber:_w2 With:smallW Count:_w2*3];
    [_grid4View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blackLine.mas_right).offset(0);
        make.top.equalTo(self.grid3View.mas_bottom).offset(0);
        make.height.mas_equalTo(3*smallW);
        make.width.mas_equalTo(self.w2*smallW);
    }];
    
    
    [_blackLine4 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.grid4View.mas_right).offset(0);
        make.top.equalTo(self.grid3View.mas_bottom).offset(0);
        make.height.mas_equalTo(3*smallW);
        make.width.mas_equalTo(1);
    }];
    
    
    [_grid5View initGirdWithWNumber:_w2 With:smallW Count:_w2*3];
    [_grid5View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.grid4View.mas_right).offset(0);
        make.top.equalTo(self.grid3View.mas_bottom).offset(0);
        make.height.mas_equalTo(3*smallW);
        make.width.mas_equalTo(self.w2*smallW);
    }];
    
    
    [_whiteBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
        make.right.equalTo(self.grid5View.mas_right).offset(0);
        make.height.mas_equalTo(25);
        //make.width.mas_equalTo(self.w1*bigW+self.w2*2*smallW);
    }];
    
    [_sumLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(5);
        make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(23);
    }];
    
    [self updateGridAll:_gridArr];
    
}
-(void)updateGridAll:(NSArray *)arr{
    [self updataGridSmallViewWithArr:arr];
    [self updateGrid2ViewWith:arr];
    [self updateGrid3ViewWith:arr];
    [self updateGrid4ViewInitWithArr:arr];
    [self updateGrid5ViewInitWithArr:arr];
    [self zongShuNumWithArr:arr];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(void)backBtnAction:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(ZhuangWenLuGridViewDelegateBackAction)]) {
        [self.delegate ZhuangWenLuGridViewDelegateBackAction];
    }
}
@end
