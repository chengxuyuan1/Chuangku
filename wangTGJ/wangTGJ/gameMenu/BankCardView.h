//
//  BankCardView.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
//NS_ENUM，定义状态等普通枚举
typedef NS_ENUM(NSUInteger, BankCardType) {
    BankCardAlipayType  = 1,
    BankCardWeChatType,
    BankCardBankPayType
};
typedef void (^BankCardBlock)(BankCardType type);
@interface BankCardView : UIView
@property (nonatomic,strong) UIButton *alipayBtn;
@property (nonatomic,strong) UIButton *weChatBtn;
@property (nonatomic,strong) UIButton *bankCardBtn;
@property (nonatomic,copy) BankCardBlock block;
-(void)selectPayType:(BankCardBlock)block;
@end
