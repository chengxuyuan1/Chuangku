//
//  chipBgView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/27.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChipBgView : UIView
@property (nonatomic,strong) UIView *blackView;
@property (nonatomic,strong) UIButton *topArrowBtn;
@property (nonatomic,strong) UIButton *bottomArrowBtn;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *moneyArr;
@end
