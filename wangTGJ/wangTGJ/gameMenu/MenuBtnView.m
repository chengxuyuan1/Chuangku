//
//  MenuBtnView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "MenuBtnView.h"

@implementation MenuBtnView

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
        _iconBtn=[[UIButton alloc] init];
        [_iconBtn addTarget:self action:@selector(iconBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_iconBtn];
        
        _titleLab=[[UILabel alloc] init];
        _titleLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _titleLab.textAlignment=NSTextAlignmentCenter;
        _titleLab.font=[UIFont systemFontOfSize:12];
        _titleLab.numberOfLines=2;
        _titleLab.lineBreakMode=NSLineBreakByCharWrapping;
        [self addSubview:_titleLab];
        
        _numTipLab=[[UILabel alloc] init];
        _numTipLab.textColor=[UIColor whiteColor];
        _numTipLab.font=[UIFont systemFontOfSize:12];
        _numTipLab.backgroundColor=[UIColor redColor];
        _numTipLab.textAlignment=NSTextAlignmentCenter;
        _numTipLab.layer.masksToBounds = YES;
        _numTipLab.layer.cornerRadius = 10;
        [self addSubview:_numTipLab];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _iconBtn.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-20);
    _titleLab.frame=CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 30);
    _numTipLab.frame=CGRectMake(self.frame.size.width-20, 0, 20, 20);
}
-(void)iconBtnAction:(UIButton *)btn{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(menuBtnViewDelegateBtnIndex:)]) {
        [self.delegate menuBtnViewDelegateBtnIndex:_titleLab.text];
    }
}
@end
