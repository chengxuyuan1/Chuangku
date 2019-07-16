//
//  GameHallCell.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GameHallCell.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "HollowCircleView.h"
#import "SlantLine.h"
#import "TopNumPoint.h"
#import "HelperHandle.h"
#import "GridBgView.h"

@implementation GameHallCell

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor=[UIColor colorWithRed:194/255.0 green:158/255.0 blue:126/255.0 alpha:1];
        
        _blackLine=[[UIView alloc] init];
        _blackLine.backgroundColor=[UIColor colorWithRed:59/255.0 green:46/255.0 blue:33/255.0 alpha:1];
        [self.contentView addSubview:_blackLine];
        [_blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.mas_equalTo(1);
        }];
        
//        _iconImgView=[[UIImageView alloc] init];
//        _iconImgView.image=[UIImage imageNamed:@"iconImg"];
        //[self.contentView addSubview:_iconImgView];
        
//        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.contentView.mas_left).offset(3);
//            make.top.equalTo(self.contentView.mas_top).offset(3);
//            make.width.mas_equalTo(60);
//            make.height.mas_equalTo(100);
//        }];
        
        
        
//        _nameLab=[[UILabel alloc] init];
//        _nameLab.backgroundColor=[UIColor colorWithRed:34/255.0 green:32/255.0 blue:37/255.0 alpha:1];
//        _nameLab.text=@"Nancy";
//        _nameLab.textColor=[UIColor colorWithRed:247/255.0 green:208/255.0 blue:20/255.0 alpha:1];
//        _nameLab.textAlignment=NSTextAlignmentCenter;
        //[self.contentView addSubview:_nameLab];
        
//        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.contentView.mas_left).offset(2);
//            make.top.equalTo(self.iconImgView.mas_bottom).offset(0);
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(-3);
//            make.width.mas_equalTo(60);
//        }];
        
        _gridSmallView=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _gridSmallView.lineColor=[UIColor grayColor];
        [self.contentView addSubview:_gridSmallView];
        [_gridSmallView initGirdWithWNumber:13 With:16 Count:90];
        
        [_gridSmallView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(3);
            make.top.equalTo(self.mas_top).offset(3);
            make.height.mas_equalTo(16*6);
            make.width.mas_equalTo(16*13);
        }];
        
        
        _grid2View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _grid2View.lineColor=[UIColor grayColor];
        [self.contentView addSubview:_grid2View];
        [_grid2View initGirdWithWNumber:20 With:8 Count:120];
        
        [_grid2View mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.gridSmallView.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(3);
            make.height.mas_equalTo(8*6);
            make.width.mas_equalTo(8*20);
        }];
        
        _blackLine2=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _blackLine2.backgroundColor=[UIColor blackColor];
        [self.contentView addSubview:_blackLine2];
   
        
        [_blackLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.gridSmallView.mas_right).offset(0);
            make.top.equalTo(self.grid2View.mas_bottom).offset(0);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(8*20);
        }];
        
        
        _grid3View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _grid3View.lineColor=[UIColor grayColor];
        [self.contentView insertSubview:_grid3View atIndex:0];
        [_grid3View initGirdWithWNumber:20 With:8 Count:60];
        
        [_grid3View mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.gridSmallView.mas_right).offset(0);
            make.top.equalTo(self.grid2View.mas_bottom).offset(0);
            make.height.mas_equalTo(8*3);
            make.width.mas_equalTo(8*20);
        }];
        
        
        _blackLine3=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _blackLine3.backgroundColor=[UIColor blackColor];
        [self.contentView addSubview:_blackLine3];
        
        
        [_blackLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.gridSmallView.mas_right).offset(0);
            make.top.equalTo(self.grid3View.mas_bottom).offset(0);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(8*20);
        }];
        
        
        
        _grid4View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _grid4View.lineColor=[UIColor grayColor];
        [self.contentView insertSubview:_grid4View atIndex:0];
        [_grid4View initGirdWithWNumber:10 With:8 Count:30];
        
        [_grid4View mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.gridSmallView.mas_right).offset(0);
            make.top.equalTo(self.grid3View.mas_bottom).offset(0);
            make.height.mas_equalTo(8*3);
            make.width.mas_equalTo(8*10);
        }];
        
        
        _blackLine4=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _blackLine4.backgroundColor=[UIColor blackColor];
        [self.contentView addSubview:_blackLine4];
        
        
        [_blackLine4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.grid4View.mas_right).offset(0);
            make.top.equalTo(self.grid3View.mas_bottom).offset(0);
            make.height.mas_equalTo(8*3);
            make.width.mas_equalTo(1);
        }];
        
        
        _grid5View=[[GridSmallView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        _grid5View.lineColor=[UIColor grayColor];
        [self.contentView insertSubview:_grid5View atIndex:0];
        [_grid5View initGirdWithWNumber:10 With:8 Count:30];
        
        [_grid5View mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.grid4View.mas_right).offset(0);
            make.top.equalTo(self.grid3View.mas_bottom).offset(0);
            make.height.mas_equalTo(8*3);
            make.width.mas_equalTo(8*10);
        }];
        
        _bottomBgView=[[BottomBgView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        [self.contentView addSubview:_bottomBgView];
    
        
        [_bottomBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(3);
            make.top.equalTo(self.gridSmallView.mas_bottom).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-3);
            make.width.mas_equalTo(16*13+8*20);
        }];
        
        _rightBgView=[[RightBgView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
        [self.contentView addSubview:_rightBgView];
        
        
      
        
        
        _circleBgView=[[CircleBgView alloc] init];
        _circleBgView.width=70;
        _circleBgView.progress=20;
        _circleBgView.title=[HelperHandle getLanguage:@"结算中"];
        [self.contentView addSubview:_circleBgView];
        
        
        
        _starGameBtn=[[UIButton alloc] init];
        [_starGameBtn setTitle:[HelperHandle getLanguage:@"开始游戏"] forState:UIControlStateNormal];
        [_starGameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _starGameBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_starGameBtn];
        
        
        _arrowImgView=[[UIImageView alloc] init];
        _arrowImgView.image=[UIImage imageNamed:@"lobby_games_sub_category_btn_next"];
        [self.contentView addSubview:_arrowImgView];
        
        
    }
    return self;
}
-(void)updataGridSmallViewWithArr:(NSArray *)arr{
    if (arr.count>13*6) {//显示最新数据
        NSMutableArray *muarr=[NSMutableArray array];
        NSInteger num=arr.count-13*6;
        for (NSInteger i=num; i<arr.count; i++) {
            [muarr addObject:arr[i]];
        }
        arr=muarr;
    }

    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<13; i++) {
        for (int j=0; j<6; j++) {
            NSInteger num=i+j*13;
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
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<20; i++) {
        for (int j=0; j<6; j++) {
            NSInteger num=i+j*20;
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
-(BOOL)isHe:(NSInteger)num{
    if (num==2||num==9||num==10||num==11) {
        return YES;
    }
    return NO;
}
-(void)updateGrid3ViewWith:(NSArray *)arr{
    //计算显示位置
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<20; i++) {
        for (int j=0; j<3; j++) {
            NSInteger num=i+j*20;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    
    //计算显示位置
    NSMutableArray *pvarr=[NSMutableArray array];
    NSMutableArray *topArr=[NSMutableArray array];
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
    

    
    
    //计算庄闲个数
    //int j=0;
    NSString *round=@"";
    int p=0;
    NSMutableArray *muarr=[NSMutableArray array];
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
    
    
    //大眼路结果
    NSMutableArray *luMuarr=[NSMutableArray array];
    if (muarr.count>1) {
        //NSString *color;
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
    //计算显示位置
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<10; i++) {
        for (int j=0; j<3; j++) {
            NSInteger num=i+j*10;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    //计算显示位置
    NSMutableArray *pvarr=[NSMutableArray array];
    NSMutableArray *topArr=[NSMutableArray array];
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
    
    
    
    
    //计算庄闲个数
    //int j=0;
    NSString *round=@"";
    int p=0;
    NSMutableArray *muarr=[NSMutableArray array];
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
    
    //计算红利个数
    NSMutableArray *hongLang=[NSMutableArray array];
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
    //计算显示位置
    NSMutableArray *varr=[NSMutableArray array];
    for (int i=0; i<10; i++) {
        for (int j=0; j<3; j++) {
            NSInteger num=i+j*10;
            [varr addObject:[NSNumber numberWithInteger:num]];
        }
    }
    //计算显示位置
    NSMutableArray *pvarr=[NSMutableArray array];
    NSMutableArray *topArr=[NSMutableArray array];
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
    
    
    
    
    //计算庄闲个数
    //int j=0;
    NSString *round=@"";
    int p=0;
    NSMutableArray *muarr=[NSMutableArray array];
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
    
    //计算红利个数
    NSMutableArray *hongLang=[NSMutableArray array];
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



-(void)layoutSubviews{
    [super layoutSubviews];
    //CGFloat w=screenWidth;
    [_rightBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.grid2View.mas_right).offset(3);
        make.top.equalTo(self.contentView.mas_top).offset(6);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-6);
        make.width.mas_equalTo(self.contentView.frame.size.width*(130/667.0));
    }];
    [_circleBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightBgView.mas_right).offset(0);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.height.mas_equalTo(70);
    }];
    [_starGameBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.circleBgView.mas_centerX).offset(0);
        make.top.equalTo(self.circleBgView.mas_bottom).offset(5);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(70);
    }];
    [_arrowImgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.circleBgView.mas_centerX).offset(0);
        make.top.equalTo(self.starGameBtn.mas_bottom).offset(0);
        make.height.mas_equalTo(18.5);
        make.width.mas_equalTo(17);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
