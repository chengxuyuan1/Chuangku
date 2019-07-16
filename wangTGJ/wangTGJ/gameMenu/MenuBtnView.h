//
//  MenuBtnView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MenuBtnViewDelegate<NSObject>
- (void)menuBtnViewDelegateBtnIndex:(NSString *)title;
@end
@interface MenuBtnView : UIView
@property (nonatomic,strong) UIButton *iconBtn;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *numTipLab;
@property (nonatomic,assign) id<MenuBtnViewDelegate>delegate;

@end
