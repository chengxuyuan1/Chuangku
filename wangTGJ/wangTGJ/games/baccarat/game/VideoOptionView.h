//
//  VideoOptionView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/8/28.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,VideoType)
{
    
    VideoTypeHigh,
    
    VideoTypeStandard,
    VideoTypeClose
    
};
@protocol VideoOptionViewDelegate<NSObject>
-(void)VideoOptionViewdelegate:(VideoType)videoType;
@end
@interface VideoOptionView : UIView

@property (nonatomic,strong) UIButton *highDefinitionDBtn;
@property (nonatomic,strong) UIButton *standardDefinitionDBtn;
@property (nonatomic,strong) UIButton *closeDefinitionDBtn;
@property (nonatomic,assign) id<VideoOptionViewDelegate>delegate;
@end
