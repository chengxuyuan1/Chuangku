//
//  JunHaoView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/24.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JunHaoView : UIView
@property (nonatomic,strong) UIView *topLine;
@property (nonatomic,strong) UIView *bottomLine;
@property (nonatomic,strong) UIView *middleLine;
@property (nonatomic,strong) UIView *verticalLine1;
@property (nonatomic,strong) UIView *verticalLine2;
@property (nonatomic,strong) UIView *verticalLine3;
@property (nonatomic,strong) UIView *verticalLine4;
@property (nonatomic,strong) UIView *verticalLine5;
@property (nonatomic,strong) UILabel *lab1;
@property (nonatomic,strong) UIButton *xianLongBaoImgView;
@property (nonatomic,strong) UIImageView *betsXianLongBaoBgView;
@property (nonatomic,strong) UIButton *betsXianLongBaoBtn;
@property (nonatomic,assign) NSInteger betsNum;
@property (nonatomic,strong) UILabel *lab2;
@property (nonatomic,strong) UIButton *xianDuiImgView;
@property (nonatomic,strong) NSMutableArray *betsXianDuiBgViewArr;
@property (nonatomic,strong) UIImageView *betsXianDuiBgView;
@property (nonatomic,strong) UIButton *betsXianDuiBtn;
@property (nonatomic,assign) NSInteger betsXianDuiNum;
@property (nonatomic,strong) UILabel *lab3;
@property (nonatomic,strong) UIButton *zhuangDuiImgView;
@property (nonatomic,strong) NSMutableArray *betsZhuangDuiBgViewArr;
@property (nonatomic,strong) UIImageView *betsZhuangDuiBgView;
@property (nonatomic,strong) UIButton *betsZhuangDuiBtn;
@property (nonatomic,assign) NSInteger betsZhuangDuiNum;
@property (nonatomic,strong) UILabel *lab4;
@property (nonatomic,strong) UIButton *zhuangLongBaoImgView;
@property (nonatomic,strong) NSMutableArray *betsZhuangLongBaoBgViewArr;
@property (nonatomic,strong) UIImageView *betsZhuangLongBaoBgView;
@property (nonatomic,strong) UIButton *betsZhuangLongBaoBtn;
@property (nonatomic,strong) UILabel *lab5;
@property (nonatomic,strong) UIButton *xianImgView;
@property (nonatomic,strong) NSMutableArray *betsXianBgViewArr;
@property (nonatomic,strong) UIImageView *betsXianBgView;
@property (nonatomic,strong) UIButton *betsXianBtn;
@property (nonatomic,assign) NSInteger betsXianNum;
@property (nonatomic,strong) UILabel *lab6;
@property (nonatomic,strong) UIButton *heImgView;
@property (nonatomic,strong) NSMutableArray *betsHeBgViewArr;
@property (nonatomic,strong) UIImageView *betsHeBgView;
@property (nonatomic,strong) UIButton *betsHeBtn;
@property (nonatomic,assign) NSInteger betsHeNum;
@property (nonatomic,strong) UILabel *lab7;
@property (nonatomic,strong) UIButton *zhuangImgView;
@property (nonatomic,strong) NSMutableArray *betsZhuangBgArr;
@property (nonatomic,strong) UIImageView *betsZhuangBgView;
@property (nonatomic,strong) UIButton *betsZhuangBtn;
@property (nonatomic,assign) NSInteger betsZhuangNum;
@property (nonatomic,assign) NSInteger betSum;
@property (nonatomic,strong) NSDictionary * betLimitDic;
@property (nonatomic,assign) BOOL isMaidFree;
-(void)returnToZeroBets;
-(void)returnToZeroBetNum;
-(void)betFailToBets;
-(void)betResultWithArr:(NSArray *)arr;
@end
