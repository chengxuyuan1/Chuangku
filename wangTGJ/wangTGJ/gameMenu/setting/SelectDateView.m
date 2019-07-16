//
//  SelectDateView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/10/8.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "SelectDateView.h"
#import <Masonry/Masonry.h>
@implementation SelectDateView


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
       self.backgroundColor=[UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1];
        NSArray *arr=@[@"今天",@"昨天",@"一星期内"];
        _btns=[NSMutableArray array];
        for (int i=0; i<arr.count; i++) {
            UIButton *btn=[[UIButton alloc] init];
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:241/255.0 green:195/255.0 blue:163/255.0 alpha:1] forState:UIControlStateNormal];
            btn.layer.borderColor=[UIColor colorWithRed:241/255.0 green:195/255.0 blue:163/255.0 alpha:1].CGColor;
            btn.layer.borderWidth=1;
            btn.tag=5000+i;
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [_btns addObject:btn];
        }
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i=0; i<_btns.count; i++) {
        UIButton *btn=_btns[i];
        [btn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(i*50);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(50);
        }];
    }
}
-(void)btnAction:(UIButton *)btn{
    [self removeFromSuperview];
    _block(btn.tag-5000);
}
-(void)selectDateBlock:(SelectDateBlock)block{
    _block= block;
}
@end
