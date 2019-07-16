//
//  GameHallCell.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridSmallView.h"
#import "BottomBgView.h"
#import "RightBgView.h"

#import "CircleBgView.h"
@interface GameHallCell : UITableViewCell
@property (nonatomic,strong) UIImageView *iconImgView;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) GridSmallView *gridSmallView;
@property (nonatomic,strong) GridSmallView *grid2View;
@property (nonatomic,strong) UIView *blackLine;
@property (nonatomic,strong) UIView *blackLine2;
@property (nonatomic,strong) GridSmallView *grid3View;
@property (nonatomic,strong) UIView *blackLine3;
@property (nonatomic,strong) GridSmallView *grid4View;
@property (nonatomic,strong) UIView *blackLine4;
@property (nonatomic,strong) GridSmallView *grid5View;
@property (nonatomic,strong) BottomBgView *bottomBgView;
@property (nonatomic,strong) RightBgView *rightBgView;

@property (nonatomic,strong) CircleBgView *circleBgView;
@property (nonatomic,strong) UIButton *starGameBtn;
@property (nonatomic,strong) UIImageView *arrowImgView;
-(void)updataGridSmallViewWithArr:(NSArray *)arr;
-(void)updateGrid2ViewWith:(NSArray *)arr;
-(void)updateGrid3ViewWith:(NSArray *)arr;
-(void)updateGrid4ViewInitWithArr:(NSArray *)arr;
-(void)updateGrid5ViewInitWithArr:(NSArray *)arr;
@end
