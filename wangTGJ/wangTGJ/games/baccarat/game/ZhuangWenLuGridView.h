//
//  ZhuangWenLuGridView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/23.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridSmallView.h"
#import "SlantLine.h"
#import "RedCircularView.h"
#define bigW 16
#define smallW 8
typedef NS_ENUM(NSInteger,GridType)

{
    
    GridTypeShort,
    
    GridTypeLong
    
};


@protocol ZhuangWenLuGridViewDelegate<NSObject>
-(void)ZhuangWenLuGridViewDelegateBackAction;
@end

@interface ZhuangWenLuGridView : UIView
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,assign) id<ZhuangWenLuGridViewDelegate>delegate;
@property (nonatomic,strong) GridSmallView *gridSmallView;
@property (nonatomic,strong) UIView *blackLine;
@property (nonatomic,strong) GridSmallView *grid2View;
@property (nonatomic,strong) UIView *blackLine2;
@property (nonatomic,strong) GridSmallView *grid3View;
@property (nonatomic,strong) UIView *blackLine3;
@property (nonatomic,strong) GridSmallView *grid4View;
@property (nonatomic,strong) UIView *blackLine4;
@property (nonatomic,strong) GridSmallView *grid5View;
@property (nonatomic,strong) UIView *whiteBgView;
@property (nonatomic,strong) UILabel *sumLab;
@property (nonatomic,strong) UILabel *numLab;
@property (nonatomic,strong) UILabel *zhuangLab;
@property (nonatomic,strong) UILabel *numLab1;
@property (nonatomic,strong) UILabel *xianLab;
@property (nonatomic,strong) UILabel *numLab2;
@property (nonatomic,strong) UILabel *heLab;
@property (nonatomic,strong) UILabel *numLab3;
@property (nonatomic,strong) UILabel *zhuangDuiLab;
@property (nonatomic,strong) UILabel *numLab4;
@property (nonatomic,strong) UILabel *xianDuiLab;
@property (nonatomic,strong) UILabel *numLab5;
@property (nonatomic,strong) UIView *leftLine;
@property (nonatomic,strong) UIView *topLine;
@property (nonatomic,strong) UIView *rightLine;
@property (nonatomic,strong) UIView *bottomLine;
@property (nonatomic,strong) UILabel *zhuangWenLuLab;
@property (nonatomic,strong) UIView *hollowCircleView;
@property (nonatomic,strong) RedCircularView *redCircularView;
@property (nonatomic,strong) SlantLine *slantLine;
@property (nonatomic,strong) UILabel *zxianWenLuLab;
@property (nonatomic,strong) UIView *hollowCircleView2;
@property (nonatomic,strong) RedCircularView *redCircularView2;
@property (nonatomic,strong) SlantLine *slantLine2;
@property (nonatomic,strong) UIButton *quanluBtn;
@property (nonatomic,assign) NSInteger w1;//grid宽度
@property (nonatomic,assign) NSInteger w2;//grid宽度
@property (nonatomic,strong) NSArray *gridArr;

-(void)updataGridSmallViewWithArr:(NSArray *)arr;
-(void)updateGrid2ViewWith:(NSArray *)arr;
-(void)updateGrid3ViewWith:(NSArray *)arr;
-(void)updateGrid4ViewInitWithArr:(NSArray *)arr;
-(void)updateGrid5ViewInitWithArr:(NSArray *)arr;
-(void)zongShuNumWithArr:(NSArray*)arr;
-(void)updateGridView:(GridType)gridType;
-(void)updateGridAll:(NSArray *)arr;
@end
