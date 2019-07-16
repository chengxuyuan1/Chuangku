//
//  CircleBgView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "CircleBgView.h"
#import <Masonry/Masonry.h>

@implementation CircleBgView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (_circle==nil) {
        _circle = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(0, 0, _width, _width) pathBackColor:nil pathFillColor:[UIColor colorWithRed:245/255.0 green:208/255.0 blue:24/255.0 alpha:1] startAngle:0 strokeWidth:10];
        _circle.layer.masksToBounds=YES;
        _circle.layer.cornerRadius=_width/2;
        _circle.progress = _progress;
        _circle.title=_title;
        [self addSubview:_circle];
    }
    _circle.frame=CGRectMake((self.frame.size.width-_width)/2, 10, _width, _width);
}

@end
