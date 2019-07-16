//
//  OperationProcessView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/19.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OperationProcessView : UIView
@property (nonatomic,strong) UIView *blackView;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel* oprationLab;
@property (nonatomic,strong) UILabel* weChatLab;
@property (nonatomic,strong) UILabel* alipayLab;
@property (nonatomic,strong) UIButton* sureBtn;
@end

NS_ASSUME_NONNULL_END
