//
//  CustomChipView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouletteBgView.h"
#import "DiceBgView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CustomChipView : UIView
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *topBgView;
@property (nonatomic,strong) UIButton *rouletteBtn;
@property (nonatomic,strong) UIButton *diceBtn;
@property (nonatomic,strong) UIView *bottomline;
@property (nonatomic,strong) RouletteBgView *rouletteBgView;
@property (nonatomic,strong) DiceBgView *diceBgView;
@end

NS_ASSUME_NONNULL_END
