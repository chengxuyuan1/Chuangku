//
//  RecordMenuView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/6.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "RecordMenuView.h"
#import "BetRecordVC.h"
#import "HelperHandle.h"
#import "QuotaRecordVC.h"
@implementation RecordMenuView
-(void)awakeFromNib{
    [super awakeFromNib];
    [_recordBtn setTitle:[HelperHandle getLanguage:@"记录"] forState:UIControlStateNormal];
     [_betRecordBtn setTitle:[HelperHandle getLanguage:@"下注记录"] forState:UIControlStateNormal];
     [_quotaRecordBtn setTitle:[HelperHandle getLanguage:@"额度记录"] forState:UIControlStateNormal];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_blackView addGestureRecognizer:tapGesture];
}
- (IBAction)backBtnAction:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)betRecordBtnAction:(id)sender {
    BetRecordVC *betRecordVC=[[BetRecordVC alloc] init];
    [_vc presentViewController:betRecordVC animated:YES completion:^{
        
    }];
}
- (IBAction)limitBtnAction:(id)sender {
    QuotaRecordVC *qutaRecordVC=[[QuotaRecordVC alloc] init];
    [_vc presentViewController:qutaRecordVC animated:YES completion:^{
        
    }];
}
// 点击事件

-(void)tapClick:(UITapGestureRecognizer *)tap{
     [self.superview removeFromSuperview];
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
