//
//  SelectDateView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/10/8.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectDateBlock)(NSInteger tag);
@interface SelectDateView : UIView
@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,copy) SelectDateBlock block;
-(void)selectDateBlock:(SelectDateBlock)block;
@end

NS_ASSUME_NONNULL_END
