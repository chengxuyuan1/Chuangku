//
//  HotGamebgView.h
//  万通国际
//
//  Created by 许传信 on 2018/8/15.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBtnView.h"
@protocol HotGameBgViewDelegate<NSObject>
-(void)hotGameViewDelegateIndex:(NSString *)title;
@end
@interface HotGamebgView : UIView<MenuBtnViewDelegate>
@property (nonatomic,strong) MenuBtnView *baiJLBtnView;
@property (nonatomic,strong) MenuBtnView *longHuBtnView;
@property (nonatomic,strong) MenuBtnView *ziXuanDTBtnView;
@property (nonatomic,assign) id<HotGameBgViewDelegate>delegate;
@property (nonatomic,assign) UIViewController *vc;
@property (nonatomic,strong) NSMutableArray *gamesArr;
@end
