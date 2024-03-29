//
//  ZZCircleProgress.h
//  ZZCircleProgressDemo
//
//  Created by iMac on 2016/12/23.
//  Copyright © 2016年 zhouxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CircleIncreaseModel) {
    CircleIncreaseSameTime      = 0,    // 同等时间
    CircleIncreaseByProgress    = 1,    // 根据进度决定动画时间
};

@interface ZZCircleProgress : UIView

//图形定制
@property (nonatomic, strong) UIColor *pathBackColor;/**<线条背景色*/
@property (nonatomic, strong) UIColor *pathFillColor;/**<线条填充色*/

@property (nonatomic, assign) CGFloat startAngle;/**<起点角度。角度从水平右侧开始为0，顺时针为增加角度。直接传度数 如-90 */
@property (nonatomic, assign) CGFloat reduceValue;/**<减少的角度 直接传度数 如30*/
@property (nonatomic, assign) CGFloat strokeWidth;/**<线宽*/

@property (nonatomic, assign) BOOL showPoint;/**<是否显示小圆点*/
@property (nonatomic, assign) BOOL showProgressText;/**<是否显示文字*/
@property (nonatomic, assign) CircleIncreaseModel animationModel;/**<动画模式*/

@property (nonatomic, assign) CGFloat progress;/**<进度 0-1 */
@property (nonatomic,assign) NSInteger numValue;
@property (nonatomic,copy) NSString *title;

//初始化 坐标 线条背景色 填充色 起始角度 线宽
- (instancetype)initWithFrame:(CGRect)frame
                pathBackColor:(UIColor *)pathBackColor
                pathFillColor:(UIColor *)pathFillColor
                   startAngle:(CGFloat)startAngle
                  strokeWidth:(CGFloat)strokeWidth;

@end
