//
//  OperationProcessView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/19.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "OperationProcessView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
@implementation OperationProcessView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        
        _blackView=[[UIView alloc] init];
        _blackView.backgroundColor=[UIColor blackColor];
        _blackView.alpha=0.5;
        [self addSubview:_blackView];
        [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
        }];
        
        
        _bgView=[[UIView alloc] init];
        _bgView.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        [self addSubview:_bgView];
        _bgView.layer.borderWidth = 1;
        _bgView.layer.borderColor = [[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1] CGColor];

        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).offset(0);
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.width.mas_equalTo(460);
            make.height.mas_equalTo(150);
        }];
        
        _oprationLab=[[UILabel alloc] init];
        _oprationLab.text=[HelperHandle getLanguage:@"操作流程:"];
        _oprationLab.textColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        [self addSubview:_oprationLab];
        [_oprationLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset(10);
            make.left.equalTo(self.bgView.mas_left).offset(10);
            make.right.equalTo(self.bgView.mas_right).offset(-10);
            make.height.mas_equalTo(20);
        }];
        
        
        _weChatLab=[[UILabel alloc] init];
        _weChatLab.text=[HelperHandle getLanguage:@"1.微信点击扫一扫，右上角点击后选择从相册选取二维码。"];
        _weChatLab.textColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        [self addSubview:_weChatLab];
        [_weChatLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.oprationLab.mas_bottom).offset(0);
            make.left.equalTo(self.bgView.mas_left).offset(10);
            make.right.equalTo(self.bgView.mas_right).offset(0);
            make.height.mas_equalTo(20);
        }];
        
        _alipayLab=[[UILabel alloc] init];
        _alipayLab.text=[HelperHandle getLanguage:@"2.支付宝点击扫一扫，右上角相册。"];
        _alipayLab.textColor=[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1];
        [self addSubview:_alipayLab];
        [_alipayLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.weChatLab.mas_bottom).offset(0);
            make.left.equalTo(self.bgView.mas_left).offset(10);
            make.right.equalTo(self.bgView.mas_right).offset(-10);
            make.height.mas_equalTo(20);
        }];
        
        
        _sureBtn=[[UIButton alloc] init];
        [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
        _sureBtn.backgroundColor=[UIColor colorWithRed:209/255.0 green:180/255.0 blue:152/255.0 alpha:1];
        [_sureBtn setTitleColor:[UIColor colorWithRed:2/255.0 green:0/255.0 blue:0/255.0 alpha:1] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureBtn];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bgView.mas_bottom).offset(-10);
            make.centerX.equalTo(self.bgView.mas_centerX).offset(0);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(40);
        }];
    }
    return self;
}
-(void)sureBtnAction{
    [self removeFromSuperview];
}
@end
