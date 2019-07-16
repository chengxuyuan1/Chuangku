//
//  BankCardView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "BankCardView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
@implementation BankCardView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:59/255.0 green:53/255.0 blue:50/255.0 alpha:1];
        
        _alipayBtn=[[UIButton alloc] init];
        [_alipayBtn setTitle:[HelperHandle getLanguage:@"支付宝"] forState:UIControlStateNormal];
        [_alipayBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
        [_alipayBtn addTarget:self action:@selector(alipayBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_alipayBtn];
        [_alipayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(20 );
        }];
        
        
        _weChatBtn=[[UIButton alloc] init];
        [_weChatBtn setTitle:[HelperHandle getLanguage:@"微信"] forState:UIControlStateNormal];
        [_weChatBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
        [_weChatBtn addTarget:self action:@selector(weChatBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_weChatBtn];
        [_weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.alipayBtn.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(20 );
        }];
        
        
        _bankCardBtn=[[UIButton alloc] init];
        [_bankCardBtn setTitle:[HelperHandle getLanguage:@"银行卡"] forState:UIControlStateNormal];
        [_bankCardBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
        [_bankCardBtn addTarget:self action:@selector(bankCardBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bankCardBtn];
        [_bankCardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.weChatBtn.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(20 );
        }];
        
          [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
    [_alipayBtn setTitle:[HelperHandle getLanguage:@"支付宝"] forState:UIControlStateNormal];
    [_weChatBtn setTitle:[HelperHandle getLanguage:@"微信"] forState:UIControlStateNormal];
    [_bankCardBtn setTitle:[HelperHandle getLanguage:@"银行卡"] forState:UIControlStateNormal];
}
-(void)alipayBtnAction{
    _block(BankCardAlipayType);
    [self removeFromSuperview];
}
-(void)weChatBtnAction{
    _block(BankCardWeChatType);
    [self removeFromSuperview];
}
-(void)bankCardBtnAction{
    _block(BankCardBankPayType);
    [self removeFromSuperview];
}
-(void)selectPayType:(BankCardBlock)block{
    _block=block;
    
}
@end
