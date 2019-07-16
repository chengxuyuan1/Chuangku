//
//  GridSmallView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridSmallView : UIView
@property (nonatomic,strong) NSMutableArray * section0Array;
@property (nonatomic,strong) UIColor *lineColor;
-(void)initGirdWithWNumber:(NSInteger)wNumber With:(NSInteger)w Count:(NSInteger)count;

@end
