//
//  chipBgView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/27.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "ChipBgView.h"
#import <Masonry/Masonry.h>
#import "CustomBtn.h"
@implementation ChipBgView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        _blackView=[[UIView alloc] init];
        _blackView.backgroundColor=[UIColor blackColor];
        _blackView.alpha=0.5;
        [self addSubview:_blackView];
        [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
        }];
        
        _topArrowBtn=[[UIButton alloc] init];
        [_topArrowBtn setImage:[UIImage imageNamed:@"arrow_up"] forState:UIControlStateNormal];
        [self addSubview:_topArrowBtn];
        [_topArrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.right.equalTo(self.mas_right).offset(-10);
            make.top.equalTo(self.mas_top).offset(60);
            make.height.mas_equalTo(20);
        }];
        
        _bottomArrowBtn=[[UIButton alloc] init];
        [_bottomArrowBtn setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        [self addSubview:_bottomArrowBtn];
        [_bottomArrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.right.equalTo(self.mas_right).offset(-10);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.height.mas_equalTo(20);
        }];
        
        _scrollView=[[UIScrollView alloc] init];
        _scrollView.contentSize=CGSizeMake(0, 10*70);
        [self addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.bottomArrowBtn.mas_top).offset(0);
            make.top.equalTo(self.topArrowBtn.mas_bottom).offset(0);
        }];
        
        NSArray *arr=@[@"money_10",@"money_20",@"money_50",@"money_100",@"money_200",@"money_500",@"money_1000",@"money_5000",@"money_10000",@"money_50000"];
        _moneyArr=[NSMutableArray array];
        for (int i=0; i<arr.count; i++) {
            CustomBtn *btn=[[CustomBtn alloc] init];
            [btn setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.Key=arr[i];
            [_scrollView addSubview:btn];
            [_moneyArr addObject:btn];

        }
        
        
    }
    
    return self;
}
-(void)btnAction:(CustomBtn *)btn{
    NSArray *arr=[btn.Key componentsSeparatedByString:@"_"];
    NSString *money;
    money=arr[1];
    NSLog(@"%@",money);
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"ChipNum" object:nil userInfo:@{@"ChipNum":money}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
    for (int i=0; i<_moneyArr.count; i++) {
        CustomBtn *kbtn=_moneyArr[i];
        kbtn.layer.borderWidth = 0;
    }
    
    btn.layer.borderWidth = 1;
    btn.layer.borderColor =[[UIColor colorWithRed:212/255.0 green:144/255.0 blue:61/255.0 alpha:1] CGColor];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i=0; i<_moneyArr.count; i++) {
        UIButton *btn=_moneyArr[i];
        btn.imageEdgeInsets=UIEdgeInsetsMake(10, 10, 10, 10);
        btn.frame=CGRectMake(0, i*70, 70, 70);
    }
}
@end
