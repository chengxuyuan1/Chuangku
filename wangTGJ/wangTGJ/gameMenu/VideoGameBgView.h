//
//  VideoGameBgView.h
//  万通国际
//
//  Created by 许传信 on 2018/8/15.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBtnView.h"
@protocol VideoGameBgViewDelegate<NSObject>
-(void)videoGameBgViewDelegateIndex:(NSString *)title;
@end
@interface VideoGameBgView : UIView<MenuBtnViewDelegate>
@property (nonatomic,strong) MenuBtnView *baiJLBtnView;
@property (nonatomic,strong) MenuBtnView *longHuBtnView;
@property (nonatomic,assign) id<VideoGameBgViewDelegate>delegate;
@property (nonatomic,strong) NSMutableArray *gamesArr;
@end
