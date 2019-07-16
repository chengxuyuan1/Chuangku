//
//  SoundSettingView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/25.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SoundSettingView : UIView
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *midleBgView;
@property (nonatomic,strong) UILabel *soundSwitchLab;
@property (nonatomic,strong) UILabel *musicSwitchLab;
@property (nonatomic,strong) UILabel *volumeSwitchLab;
@property (nonatomic,strong) UIButton *soundSwitch;
@property (nonatomic,strong) UIButton *musicSwitch;
@property (nonatomic,strong) UISlider *volumeSlider;
@end

NS_ASSUME_NONNULL_END
