//
//  BottomBgView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "BottomBgView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"

@implementation BottomBgView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:33/255.0 green:32/255.0 blue:27/255.0 alpha:1];
        
        _numLab=[[UILabel alloc] init];
        _numLab.textColor=[UIColor colorWithRed:214/255.0 green:195/255.0 blue:158/255.0 alpha:1];
        _numLab.text=@"百家乐c6";
        _numLab.font=[UIFont systemFontOfSize:12];
        [self addSubview:_numLab];
        
        [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(100);
        }];
        
        
        _limitRedLab=[[UILabel alloc] init];
        _limitRedLab.textColor=[UIColor colorWithRed:214/255.0 green:195/255.0 blue:158/255.0 alpha:1];
        _limitRedLab.text=[NSString stringWithFormat:@"%@%@",[HelperHandle getLanguage:@"下注限红:"],@"20-5000"];
        _limitRedLab.font=[UIFont systemFontOfSize:12];
        [self addSubview:_limitRedLab];
        
        [_limitRedLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(150);
        }];
        
        _peopleNumLab=[[UILabel alloc] init];
        _peopleNumLab.textColor=[UIColor colorWithRed:231/255.0 green:203/255.0 blue:60/255.0 alpha:1];
        _peopleNumLab.text=@"人数：578";
        _peopleNumLab.font=[UIFont systemFontOfSize:12];
        _peopleNumLab.textAlignment=NSTextAlignmentRight;
        [self addSubview:_peopleNumLab];
        
        [_peopleNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(0);
            make.top.equalTo(self.mas_top).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(150);
        }];
        
    }
    return self;
}

@end
