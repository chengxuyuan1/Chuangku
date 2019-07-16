//
//  ChessCardGameBgView.h
//  万通国际
//
//  Created by 许传信 on 2018/8/15.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankCardView.h"
@interface ChessCardGameBgView : UIView
@property (nonatomic,strong) UILabel *payMethoddLab;
@property (nonatomic,strong) UILabel *gameNicknameLab;
@property (nonatomic,strong) UILabel *payerLab;
@property (nonatomic,strong) UILabel *payAccountLab;
@property (nonatomic,strong) UILabel *orderNumberLab;
@property (nonatomic,strong) UILabel *depositAmountLab;
@property (nonatomic,strong) UIButton *bankCardBtn;
@property (nonatomic,strong) BankCardView *bankCardView;
@property (nonatomic,assign) BOOL isBankCard;
@property (nonatomic,strong) UITextField *gameNicknameTextField;
@property (nonatomic,strong) UITextField *payerTextField;
@property (nonatomic,strong) UITextField *payAccountTextField;
@property (nonatomic,strong) UITextField *orderNumberTextField;
@property (nonatomic,strong) UITextField *depositAmountTextField;
@property (nonatomic,strong) UIButton *payBtn;
@property (nonatomic,strong) UIButton *payCodeBtn;
@property (nonatomic,strong) UILabel *cashAreaLab;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UILabel *bankCardNumLab;
@property (nonatomic,strong) UILabel *amountOfCashLab;
@property (nonatomic,strong) UILabel *bankNameLab;
@property (nonatomic,strong) UILabel *branchLab;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UITextField *bankCardNumTextField;
@property (nonatomic,strong) UITextField *amountOfCashTextField;
@property (nonatomic,strong) UITextField *bankNameTextField;
@property (nonatomic,strong) UITextField *branchTextField;
@property (nonatomic,strong) UIButton *putCashBtn;
@property (nonatomic,assign) NSInteger payType;
@end
