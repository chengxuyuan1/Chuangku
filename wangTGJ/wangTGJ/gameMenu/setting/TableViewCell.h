//
//  TableViewCell.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/7.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayCardView.h"
@interface TableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel *orderLab;
@property (nonatomic,strong) UIView *line1;
@property (nonatomic,strong) UILabel *BettingTimeLab;
@property (nonatomic,strong) UIView *line2;
@property (nonatomic,strong) UILabel *bureauNumberLab;
@property (nonatomic,strong) UIView *line3;
@property (nonatomic,strong) UILabel *palyWayLab;
@property (nonatomic,strong) UIView *line4;
@property (nonatomic,strong) UILabel *bettingLab;
@property (nonatomic,strong) UIView *line5;
@property (nonatomic,strong) UILabel *payoutLab;
@property (nonatomic,strong) UIView *line6;
@property (nonatomic,strong) UILabel *videoPlaybackLab;
@property (nonatomic,strong) UIView *bankCardView;
@property (nonatomic,strong) DisplayCardView *dispalayCardView;
@property (nonatomic,strong) UIView *cardBgView;
@property (nonatomic,assign) NSInteger xianNum;
@property (nonatomic,assign) NSInteger zhuangNum;
-(void)setCellWithDic:(NSDictionary *)dic;
-(void)showCard;
-(void)remvoeCard;
-(void)setPlayCard:(NSString *)playCard;
-(void)setBankCard:(NSString *)bankCard;
@end
