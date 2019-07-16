//
//  RedCircularView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/24.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "RedCircularView.h"

@implementation RedCircularView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        UIView *circular=[[UIView alloc] init];
        [circular.layer setCornerRadius:self.frame.size.width/2];
        circular.layer.masksToBounds = YES;
        [self addSubview:circular];
        _circular=circular;
    }
    
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _circular.backgroundColor=_bgColor;
    _circular.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [_circular.layer setCornerRadius:self.frame.size.width/2];
}
@end
