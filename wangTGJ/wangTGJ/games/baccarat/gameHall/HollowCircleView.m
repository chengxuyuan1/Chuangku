//
//  HollowCircleView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/1.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "HollowCircleView.h"

@implementation HollowCircleView

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
        
        self.backgroundColor=[UIColor clearColor];
        _hollowCircleView2=[[UIView alloc] init];
        [self addSubview:_hollowCircleView2];
    }
    
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (_circleType==CircleTypeSolid) {
         _hollowCircleView2.backgroundColor=_bgColor;
    }
    _hollowCircleView2.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [_hollowCircleView2.layer setCornerRadius:self.frame.size.width/2];
    _hollowCircleView2.layer.masksToBounds = YES;
    _hollowCircleView2.layer.borderWidth = 1;//边框width
    _hollowCircleView2.layer.borderColor = [_bgColor CGColor];//边框color
    
}
@end
