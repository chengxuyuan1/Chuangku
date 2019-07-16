//
//  RecordMenuView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/6.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordMenuView : UIView
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;
@property (weak, nonatomic) IBOutlet UIButton *betRecordBtn;
@property (weak, nonatomic) IBOutlet UIButton *quotaRecordBtn;

@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (nonatomic,weak) UIViewController *vc;
@end
