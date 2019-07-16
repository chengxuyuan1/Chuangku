//
//  SlantLine.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/24.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "SlantLine.h"

@implementation SlantLine
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 1);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
//    _slantLine.r=251.1;
//    _slantLine.g=0.1;
//    _slantLine.b=6.1;
    CGContextSetRGBStrokeColor(context, _r/ 255.0, _g/ 255.0, _b/ 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, self.frame.size.width, 0);  //起点坐标
    CGContextAddLineToPoint(context, 0, self.frame.size.height);   //终点坐标
    
    CGContextStrokePath(context);
}

@end
