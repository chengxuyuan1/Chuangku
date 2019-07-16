//
//  VideoGameBgView.m
//  万通国际
//
//  Created by 许传信 on 2018/8/15.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "VideoGameBgView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
@implementation VideoGameBgView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        //self.backgroundColor=[UIColor blueColor];
        _baiJLBtnView=[[MenuBtnView alloc] initWithFrame:CGRectZero];
        [_baiJLBtnView.iconBtn setImage:[UIImage imageNamed:@"lobbyicon_dt"] forState:UIControlStateNormal];
        _baiJLBtnView.titleLab.text=[HelperHandle getLanguage:@"百家乐"];
        _baiJLBtnView.titleLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _baiJLBtnView.titleLab.font=[UIFont systemFontOfSize:12];
        _baiJLBtnView.numTipLab.text=@"9";
        _baiJLBtnView.delegate=self;
        //[self addSubview:_baiJLBtnView];
        
        _longHuBtnView=[[MenuBtnView alloc] initWithFrame:CGRectZero];
        [_longHuBtnView.iconBtn setImage:[UIImage imageNamed:@"lobbyicon_bac"] forState:UIControlStateNormal];
        _longHuBtnView.titleLab.text=[HelperHandle getLanguage:@"龙虎"];
        _longHuBtnView.titleLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _longHuBtnView.numTipLab.text=@"6";
        //[self addSubview:_longHuBtnView];
        
        
        
        NSArray *nameArr=@[@"百家乐",@"龙虎",@"皇家国际"];
        NSArray *imgArr=@[@"lobbyicon_dt",@"lobbyicon_bac",@"huangJia_logo"];
        _gamesArr=[NSMutableArray array];
        for (int i=0; i<nameArr.count; i++) {
            MenuBtnView * gameBtnView=[[MenuBtnView alloc] initWithFrame:CGRectZero];
            [ gameBtnView.iconBtn setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
            gameBtnView.titleLab.text=[HelperHandle getLanguage:nameArr[i]];
            gameBtnView.titleLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
            gameBtnView.titleLab.font=[UIFont systemFontOfSize:12];
            gameBtnView.numTipLab.text=@"9";
            gameBtnView.delegate=self;
            [_gamesArr addObject:gameBtnView];
            [self addSubview: gameBtnView];
            [gameBtnView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(2);
                make.top.equalTo(self.mas_top).offset(2);
                make.width.mas_equalTo(80);
                make.height.mas_equalTo(100);
            }];
        }
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
    NSArray *nameArr=@[@"百家乐",@"龙虎",@"皇家国际"];
     for (int i=0; i<nameArr.count; i++) {
         MenuBtnView * gameBtnView=_gamesArr[i];
        gameBtnView.titleLab.text=[HelperHandle getLanguage:nameArr[i]];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width=80;
    CGFloat heigth=100;
    NSInteger num=self.frame.size.width/(width+10);
    CGFloat interval=(self.frame.size.width-80*num)/(num+1);
    
    for (int i=0; i<_gamesArr.count; i++) {
        MenuBtnView * gameBtnView=_gamesArr[i];
        [gameBtnView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(i%num*width+(i%num+1)*interval);
            make.top.equalTo(self.mas_top).offset(i/num*heigth+(i/num+1)*10);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(heigth);
        }];
    }
    
    _baiJLBtnView.frame=CGRectMake(20, 10, 80, 100);
    _longHuBtnView.frame=CGRectMake(_baiJLBtnView.frame.origin.x+80+10, 10, 80, 100);
    
    
}
-(void)menuBtnViewDelegateBtnIndex:(NSString *)title{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(videoGameBgViewDelegateIndex:)]) {
        [self.delegate videoGameBgViewDelegateIndex:title];
    }
}
@end
