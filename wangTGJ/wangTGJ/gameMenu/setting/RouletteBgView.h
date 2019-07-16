//
//  RouletteBgView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/21.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RouletteBgView : UIView
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *canCelBtn;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) NSMutableArray *chipBtns;

@end

NS_ASSUME_NONNULL_END
