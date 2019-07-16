//
//  DisplayCardView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/28.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayCardView : UIView
@property (nonatomic,strong) UIView *blackView;
@property (nonatomic,strong) UIView *xianYellowBgView;
@property (nonatomic,strong) UIImageView *xianImgView;
@property (nonatomic,strong) UILabel *xianLab;
@property (nonatomic,strong) UILabel *num1Lab;
@property (nonatomic,strong) UIView *middleView;
@property (nonatomic,strong) UIView *zhuangYelloBgView;
@property (nonatomic,strong) UIImageView *zhuangImgView;
@property (nonatomic,strong) UILabel *zhuangLab;
@property (nonatomic,strong) UILabel *num2Lab;
@property (nonatomic,strong) UIView *yellowViewLeft;
@property (nonatomic,strong) UIView *yellowViewTopLeft;
@property (nonatomic,strong) UIView *yellowViewBottomLeft;
@property (nonatomic,strong) UIView *yellowViewBottomRight;
@property (nonatomic,strong) UIView *yellowViewRight;
@property (nonatomic,strong) UIView *yellowViewTopRight;
@property (nonatomic,strong) UIImageView *cardLeft1;
@property (nonatomic,strong) UIImageView *cardLeft2;
@property (nonatomic,strong) UIImageView *cardLeft3;
@property (nonatomic,strong) UIImageView *cardRight1;
@property (nonatomic,strong) UIImageView *cardRight2;
@property (nonatomic,strong) UIImageView *cardRight3;
-(void)hidenLeftYellowView:(BOOL)b;
-(void)hidenRightYellowView:(BOOL)b;
@end
