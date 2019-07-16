//
//  TableLimitRedMenu.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/23.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "TableLimitRedMenu.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
@implementation TableLimitRedMenu
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
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
        }];
        
        [self initTitleArr];
         NSArray *arr2=@[@"20-50000",@"20-50000",@"20-5000",@"20-5000",@"20-5000",@"20-1700",@"20-1700"];
        _betArr=arr2;
        NSMutableArray *muarr=[NSMutableArray array];
        _muarr=muarr;
        for (int i=0; i<_titleArr.count; i++) {
            UILabel *lab=[[UILabel alloc] init];
            lab.text=[NSString stringWithFormat:@"%@%@",_titleArr[i],arr2[i]];
            lab.font=[UIFont systemFontOfSize:12];
            lab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
            lab.textAlignment=NSTextAlignmentLeft;
            [self addSubview:lab];
            [muarr addObject:lab];
        }
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    
    return self;
}
-(void)initTitleArr{
    NSArray *arr1=@[[HelperHandle getLanguage:@"庄:"],[HelperHandle getLanguage:@"闲:"],[HelperHandle getLanguage:@"和:"],[HelperHandle getLanguage:@"庄对:"],[HelperHandle getLanguage:@"闲对:"],[HelperHandle getLanguage:@"庄龙宝:"],[HelperHandle getLanguage:@"闲龙宝:"]];
    _titleArr=arr1;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i=0; i<_muarr.count; i++) {
        UILabel *lab=_muarr[i];
        lab.frame=CGRectMake(0, i*20, self.frame.size.width, 20);
    }
}
-(void)setLabWithMinbetArr:(NSArray *)minbetArr  MaxbetArr:(NSArray *)maxbetArr{
    _minbetArr=minbetArr;
    _maxbetArr=maxbetArr;
    {
    UILabel *lab=_muarr[0];
    lab.text=[NSString stringWithFormat:@"%@%ld-%ld",_titleArr[0],[minbetArr[0] integerValue],[maxbetArr[0] integerValue]];
    UILabel *lab1=_muarr[1];
    lab1.text=[NSString stringWithFormat:@"%@%ld-%ld",_titleArr[1],[minbetArr[0] integerValue],[maxbetArr[0] integerValue]];
    }
    
    {
    UILabel *lab=_muarr[2];
    lab.text=[NSString stringWithFormat:@"%@%ld-%ld",_titleArr[2],[minbetArr[1] integerValue],[maxbetArr[1] integerValue]];
    }
    
    {
    UILabel *lab=_muarr[3];
    lab.text=[NSString stringWithFormat:@"%@%ld-%ld",_titleArr[3],[minbetArr[2] integerValue],[maxbetArr[2] integerValue]];
    UILabel *lab1=_muarr[4];
    lab1.text=[NSString stringWithFormat:@"%@%ld-%ld",_titleArr[4],[minbetArr[2] integerValue],[maxbetArr[2] integerValue]];
    }

}
-(void)updateLanguage{
    if (_minbetArr==nil) {
        [self initTitleArr];
        for (int i=0; i<_muarr.count; i++) {
            UILabel *lab=_muarr[i];
            lab.text=[NSString stringWithFormat:@"%@%@",_titleArr[i],_betArr[i]];
        }
    }else{
        [self setLabWithMinbetArr:_minbetArr MaxbetArr:_maxbetArr];
    }
}
@end
