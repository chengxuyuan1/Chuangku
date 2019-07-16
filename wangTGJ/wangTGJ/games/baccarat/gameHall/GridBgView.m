//
//  GridBgView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/10/8.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GridBgView.h"
#import <Masonry/Masonry.h>
@implementation GridBgView


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        UILabel * textLab=[[UILabel alloc] init];
        textLab.font=[UIFont systemFontOfSize:7];
        textLab.textColor=[UIColor grayColor];
        textLab.textAlignment=NSTextAlignmentCenter;
        _textLab=textLab;
        [self addSubview:textLab];
        [_textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
        }];
    }
    return self;
}
@end
