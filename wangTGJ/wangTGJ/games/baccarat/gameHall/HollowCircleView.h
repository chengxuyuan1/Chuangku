//
//  HollowCircleView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/1.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,CircleType)

{
    
    CircleTypeHollow,
    
    CircleTypeSolid
};
@interface HollowCircleView : UIView
@property (nonatomic,strong) UIView *hollowCircleView2;
@property (nonatomic,strong) UIColor *bgColor;
@property (nonatomic,assign) CircleType circleType;
@end
