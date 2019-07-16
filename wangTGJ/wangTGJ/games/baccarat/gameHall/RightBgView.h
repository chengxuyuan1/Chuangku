//
//  RightBgView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightBgView : UIView
@property (nonatomic,strong) UILabel * zhuangLab;
@property (nonatomic,strong) UILabel * xianLab;
@property (nonatomic,strong) UILabel * heLab;
@property (nonatomic,strong) UILabel *numLab1;
@property (nonatomic,strong) UILabel *numLab2;
@property (nonatomic,strong) UILabel *numLab3;
-(void)zhuangXiangNumWithArr:(NSArray *)arr;
@end
