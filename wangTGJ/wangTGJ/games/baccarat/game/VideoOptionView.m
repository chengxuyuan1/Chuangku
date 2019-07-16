//
//  VideoOptionView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/28.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "VideoOptionView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
@implementation VideoOptionView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        _highDefinitionDBtn=[[UIButton alloc] init];
        _highDefinitionDBtn.backgroundColor=[UIColor colorWithRed:59/255.0 green:53/255.0 blue:50/255.0 alpha:1];
        [_highDefinitionDBtn setTitle:[HelperHandle getLanguage:@"高清"] forState:UIControlStateNormal];
        [_highDefinitionDBtn setTitleColor:[UIColor colorWithRed:218/255.0 green:185/255.0 blue:161/255.0 alpha:1] forState:UIControlStateNormal];
        [_highDefinitionDBtn setImage:[UIImage imageNamed:@"video_channel"] forState:UIControlStateNormal];
        _highDefinitionDBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -50, 0, 0);
        _highDefinitionDBtn.imageEdgeInsets=UIEdgeInsetsMake(5, 50, 5, 5);
        [_highDefinitionDBtn addTarget:self action:@selector(highDefinitionDBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_highDefinitionDBtn];
        [_highDefinitionDBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(30);
        }];
        
        _standardDefinitionDBtn=[[UIButton alloc] init];
        _standardDefinitionDBtn.backgroundColor=[UIColor colorWithRed:59/255.0 green:53/255.0 blue:50/255.0 alpha:1];
        [_standardDefinitionDBtn setTitle:[HelperHandle getLanguage:@"标清"] forState:UIControlStateNormal];
        [_standardDefinitionDBtn setTitleColor:[UIColor colorWithRed:218/255.0 green:185/255.0 blue:161/255.0 alpha:1] forState:UIControlStateNormal];
        [_standardDefinitionDBtn setImage:[UIImage imageNamed:@"video_channel"] forState:UIControlStateNormal];
        _standardDefinitionDBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -50, 0, 0);
        _standardDefinitionDBtn.imageEdgeInsets=UIEdgeInsetsMake(5, 50, 5, 5);
         [_standardDefinitionDBtn addTarget:self action:@selector(standardDefinitionDBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_standardDefinitionDBtn];
        [_standardDefinitionDBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.highDefinitionDBtn.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(30);
        }];
        
        _closeDefinitionDBtn=[[UIButton alloc] init];
        _closeDefinitionDBtn.backgroundColor=[UIColor colorWithRed:59/255.0 green:53/255.0 blue:50/255.0 alpha:1];
        [_closeDefinitionDBtn setTitle:[HelperHandle getLanguage:@"关闭视频"] forState:UIControlStateNormal];
        [_closeDefinitionDBtn setTitleColor:[UIColor colorWithRed:218/255.0 green:185/255.0 blue:161/255.0 alpha:1] forState:UIControlStateNormal];
        [_closeDefinitionDBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        //[_closeDefinitionDBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self addSubview:_closeDefinitionDBtn];
        [_closeDefinitionDBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.standardDefinitionDBtn.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(30);
        }];
    
    }
    
    return self;
}
-(void)highDefinitionDBtnAction:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(VideoOptionViewdelegate:)]) {
        [self.delegate VideoOptionViewdelegate:VideoTypeHigh];
    }
}
-(void)standardDefinitionDBtnAction:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(VideoOptionViewdelegate:)]) {
        [self.delegate VideoOptionViewdelegate:VideoTypeStandard];
    }
}
-(void)closeBtnAction:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(VideoOptionViewdelegate:)]) {
        [self.delegate VideoOptionViewdelegate:VideoTypeClose];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
@end
