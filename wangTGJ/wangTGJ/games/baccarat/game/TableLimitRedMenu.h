//
//  TableLimitRedMenu.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/23.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableLimitRedMenu : UIView
@property (nonatomic,strong) NSMutableArray *muarr;
@property (nonatomic,strong) UIView *blackView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *minbetArr;
@property (nonatomic,strong) NSArray *maxbetArr;
@property (nonatomic,strong) NSArray *betArr;
-(void)setLabWithMinbetArr:(NSArray *)minbetArr  MaxbetArr:(NSArray *)maxbetArr;
@end
