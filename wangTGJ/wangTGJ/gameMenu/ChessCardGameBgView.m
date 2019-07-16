//
//  ChessCardGameBgView.m
//  万通国际
//
//  Created by 许传信 on 2018/8/15.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "ChessCardGameBgView.h"
#import "HelperHandle.h"
#import <Masonry/Masonry.h>
#import "LoginUserInfo.h"
#import "EasyShowView.h"
#import "GameMenuNetWork.h"
#import "OperationProcessView.h"
#import <Photos/Photos.h>
//#import <IQKeyboardManager/IQKeyboardManager.h>
@implementation ChessCardGameBgView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        CGFloat height=15;
        CGFloat titleW=60;
        CGFloat textW=110;
        _payType=-1;
        UIFont *font=[UIFont systemFontOfSize:10];
        _payMethoddLab=[[UILabel alloc] init];
        _payMethoddLab.font=font;
        //_payMethoddLab.backgroundColor=[UIColor redColor];
        _payMethoddLab.text=[HelperHandle getLanguage:@"支付方式:"];
        _payMethoddLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _payMethoddLab.numberOfLines=2;
        _payMethoddLab.lineBreakMode=NSLineBreakByWordWrapping;
        [self addSubview:_payMethoddLab];
        [_payMethoddLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        _gameNicknameLab=[[UILabel alloc] init];
        _gameNicknameLab.font=font;
        //_payMethoddLab.backgroundColor=[UIColor redColor];
        _gameNicknameLab.text=[HelperHandle getLanguage:@"游戏昵称:"];
        _gameNicknameLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_gameNicknameLab];
        [_gameNicknameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.payMethoddLab.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        _payerLab=[[UILabel alloc] init];
        _payerLab.font=font;
        //_payMethoddLab.backgroundColor=[UIColor redColor];
        _payerLab.text=[HelperHandle getLanguage:@"支 付 人 :"];
        _payerLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_payerLab];
        [_payerLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gameNicknameLab.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        _payAccountLab=[[UILabel alloc] init];
        _payAccountLab.font=font;
        //_payMethoddLab.backgroundColor=[UIColor redColor];
        _payAccountLab.text=[HelperHandle getLanguage:@"支付账号:"];
        _payAccountLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_payAccountLab];
        [_payAccountLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.payerLab.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        _orderNumberLab=[[UILabel alloc] init];
        _orderNumberLab.font=font;
        //_payMethoddLab.backgroundColor=[UIColor redColor];
        _orderNumberLab.text=[HelperHandle getLanguage:@"订单号(后5位):"];
        _orderNumberLab.textAlignment=NSTextAlignmentLeft;
        //_orderNumberLab.font=[UIFont systemFontOfSize:12];
        _orderNumberLab.numberOfLines=3;
        _orderNumberLab.lineBreakMode = NSLineBreakByWordWrapping;
        _orderNumberLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_orderNumberLab];
        [_orderNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.payAccountLab.mas_bottom).offset(0);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height*2+10);
        }];
        
        
        _depositAmountLab=[[UILabel alloc] init];
        _depositAmountLab.font=font;
        //_payMethoddLab.backgroundColor=[UIColor redColor];
        _depositAmountLab.text=[HelperHandle getLanguage:@"存款金额:"];
        _depositAmountLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_depositAmountLab];
        [_depositAmountLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.orderNumberLab.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(20);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        _bankCardBtn=[[UIButton alloc] init];
        _bankCardBtn.titleLabel.font=font;
        [_bankCardBtn setTitle:[HelperHandle getLanguage:@"请选择"] forState:UIControlStateNormal];
        _bankCardBtn.backgroundColor=[UIColor colorWithRed:102/255.0 green:67/255.0 blue:40/255.0 alpha:1];
        [_bankCardBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bankCardBtn addTarget:self action:@selector(bankCardBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bankCardBtn];
        [_bankCardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.payMethoddLab.mas_centerY).offset(0);
            make.left.equalTo(self.payMethoddLab.mas_right).offset(0);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height+10);
        }];
        
        
        _gameNicknameTextField=[[UITextField alloc] init];
         _gameNicknameTextField.font=font;
        _gameNicknameTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _gameNicknameTextField.text=[LoginUserInfo share].userModel.username;
        //_gameNicknameTextField.placeholder=@"真实姓名";
        // 就下面这两行是重点
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"真实姓名"] attributes:
                                          @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                            NSFontAttributeName:_gameNicknameTextField.font
                                            }];
        //_gameNicknameTextField.attributedPlaceholder = attrString;
        [self addSubview:_gameNicknameTextField];
        [_gameNicknameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankCardBtn.mas_left).offset(0);
            make.centerY.equalTo(self.gameNicknameLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height );
        }];
        
        
        _payerTextField=[[UITextField alloc] init];
        _payerTextField.font=font;
        _payerTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _payerTextField.placeholder=[HelperHandle getLanguage:@"真实姓名"] ;
        // 就下面这两行是重点
        NSAttributedString *attrStringPayer = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"真实姓名"]  attributes:
                                          @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                            NSFontAttributeName:_payerTextField.font
                                            }];
        _payerTextField.attributedPlaceholder = attrStringPayer;
        [self addSubview:_payerTextField];
        [_payerTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankCardBtn.mas_left).offset(0);
            make.centerY.equalTo(self.payerLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        _payAccountTextField=[[UITextField alloc] init];
        _payAccountTextField.font=font;
        _payAccountTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _payAccountTextField.placeholder=[HelperHandle getLanguage:@"支付昵称"];
        // 就下面这两行是重点
        NSAttributedString *attrStringPayAccount = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"支付昵称"] attributes:
                                               @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                 NSFontAttributeName:_payAccountTextField.font
                                                 }];
        _payAccountTextField.attributedPlaceholder = attrStringPayAccount;
        [self addSubview:_payAccountTextField];
        [_payAccountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankCardBtn.mas_left).offset(0);
            make.centerY.equalTo(self.payAccountLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        
        _orderNumberTextField=[[UITextField alloc] init];
        _orderNumberTextField.font=font;
        _orderNumberTextField.keyboardType=UIKeyboardTypeNumberPad;
        //_orderNumberTextField.backgroundColor=[UIColor redColor];
        _orderNumberTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _orderNumberTextField.placeholder=[HelperHandle getLanguage:@"请输入订单号后5位"];
        // 就下面这两行是重点
        NSAttributedString *attrStringOrderNumber = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入订单号后5位"] attributes:
                                                    @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                      NSFontAttributeName:_orderNumberTextField.font
                                                      }];
        _orderNumberTextField.attributedPlaceholder = attrStringOrderNumber;
        [self addSubview:_orderNumberTextField];
        [_orderNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankCardBtn.mas_left).offset(0);
            make.centerY.equalTo(self.orderNumberLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        _depositAmountTextField=[[UITextField alloc] init];
        _depositAmountTextField.font=font;
        _depositAmountTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _depositAmountTextField.placeholder=[HelperHandle getLanguage:@"请输入大于0的整数"];
        _depositAmountTextField.keyboardType=UIKeyboardTypeNumberPad;
        // 就下面这两行是重点
        NSAttributedString *attrStringDepositAmount = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入大于0的整数"] attributes:
                                                     @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                       NSFontAttributeName:_depositAmountTextField.font
                                                       }];
        _depositAmountTextField.attributedPlaceholder = attrStringDepositAmount;
        [self addSubview:_depositAmountTextField];
        [_depositAmountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankCardBtn.mas_left).offset(0);
            make.centerY.equalTo(self.depositAmountLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        
        _payBtn=[[UIButton alloc] init];
        _payBtn.titleLabel.font=font;
        [_payBtn setTitle:[HelperHandle getLanguage:@"支付"] forState:UIControlStateNormal];
        _payBtn.backgroundColor=[UIColor colorWithRed:222/255.0 green:196/255.0 blue:164/255.0 alpha:1];
        [_payBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_payBtn addTarget:self action:@selector(payBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_payBtn];
        [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bankCardBtn.mas_centerX).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30 );
        }];
        
        
        _payCodeBtn=[[UIButton alloc] init];
        [_payCodeBtn setBackgroundImage:[UIImage imageNamed:@"ercode"] forState:UIControlStateNormal];
        [_payCodeBtn addTarget:self action:@selector(payCodeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_payCodeBtn];
        [_payCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.payBtn.mas_centerX).offset(0);
            make.bottom.equalTo(self.payBtn.mas_top).offset(-10);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(40 );
        }];
        
        _cashAreaLab=[[UILabel alloc] init];
        _cashAreaLab.font=font;
        _cashAreaLab.text=[HelperHandle getLanguage:@"提现专区"];
        _cashAreaLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_cashAreaLab];
        [_cashAreaLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.right.equalTo(self.mas_right).offset(-textW/2.0-10);
            make.width.mas_equalTo(titleW+10);
            make.height.mas_equalTo(height);
        }];
        
        _nameLab=[[UILabel alloc] init];
        _nameLab.font=font;
        _nameLab.text=[HelperHandle getLanguage:@"您的姓名:"];
        _nameLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_nameLab];
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cashAreaLab.mas_bottom).offset(10);
            make.right.equalTo(self.cashAreaLab.mas_left).offset(0);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        _bankCardNumLab=[[UILabel alloc] init];
        _bankCardNumLab.font=font;
        _bankCardNumLab.text=[HelperHandle getLanguage:@"银行卡号:"];
        _bankCardNumLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_bankCardNumLab];
        [_bankCardNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLab.mas_bottom).offset(10);
            make.left.equalTo(self.nameLab.mas_left).offset(0);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        _amountOfCashLab=[[UILabel alloc] init];
        _amountOfCashLab.font=font;
        _amountOfCashLab.text=[HelperHandle getLanguage:@"提现金额:"];
        _amountOfCashLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_amountOfCashLab];
        [_amountOfCashLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bankCardNumLab.mas_bottom).offset(10);
            make.left.equalTo(self.nameLab.mas_left).offset(0);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        _bankNameLab=[[UILabel alloc] init];
        _bankNameLab.font=font;
        _bankNameLab.text=[HelperHandle getLanguage:@"银行名称:"];
        _bankNameLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_bankNameLab];
        [_bankNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.amountOfCashLab.mas_bottom).offset(10);
            make.left.equalTo(self.nameLab.mas_left).offset(0);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        _branchLab=[[UILabel alloc] init];
        _branchLab.font=font;
        _branchLab.text=[HelperHandle getLanguage:@"所在分行:"];
        _branchLab.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        [self addSubview:_branchLab];
        [_branchLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bankNameLab.mas_bottom).offset(20);
            make.left.equalTo(self.nameLab.mas_left).offset(0);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(height);
        }];
        
        
        
        _nameTextField=[[UITextField alloc] init];
        _nameTextField.font=font;
        _nameTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _nameTextField.placeholder=[HelperHandle getLanguage:@"请输入姓名"];
        // 就下面这两行是重点
        NSAttributedString *attrStringName = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入姓名"] attributes:
                                                    @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                      NSFontAttributeName:_nameTextField.font
                                                      }];
        _nameTextField.attributedPlaceholder = attrStringName;
        [self addSubview:_nameTextField];
        [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab.mas_right).offset(0);
            make.centerY.equalTo(self.nameLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        _bankCardNumTextField=[[UITextField alloc] init];
        _bankCardNumTextField.font=font;
        _bankCardNumTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _bankCardNumTextField.placeholder=[HelperHandle getLanguage:@"请输入银行卡号"];
        // 就下面这两行是重点
        NSAttributedString *attrStringBankCardNum = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入银行卡号"] attributes:
                                              @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                NSFontAttributeName:_bankCardNumTextField.font
                                                }];
        _bankCardNumTextField.attributedPlaceholder = attrStringBankCardNum;
        [self addSubview:_bankCardNumTextField];
        [_bankCardNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankCardNumLab.mas_right).offset(0);
            make.centerY.equalTo(self.bankCardNumLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        _amountOfCashTextField=[[UITextField alloc] init];
        _amountOfCashTextField.font=font;
        _amountOfCashTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _amountOfCashTextField.placeholder=[HelperHandle getLanguage:@"请输入大于0的整数"];
        _amountOfCashTextField.keyboardType=UIKeyboardTypeNumberPad;
        // 就下面这两行是重点
        NSAttributedString *attrStringAmountOfCash = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入大于0的整数"] attributes:
                                                     @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                       NSFontAttributeName:_amountOfCashTextField.font
                                                       }];
        _amountOfCashTextField.attributedPlaceholder = attrStringAmountOfCash;
        [self addSubview:_amountOfCashTextField];
        [_amountOfCashTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.amountOfCashLab.mas_right).offset(0);
            make.centerY.equalTo(self.amountOfCashLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        _bankNameTextField=[[UITextField alloc] init];
        _bankNameTextField.font=font;
        _bankNameTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _bankNameTextField.placeholder=[HelperHandle getLanguage:@"开户行名称"];
        // 就下面这两行是重点
        NSAttributedString *attrStringBankName = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"开户行名称"] attributes:
                                                      @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                        NSFontAttributeName:_bankNameTextField.font
                                                        }];
        _bankNameTextField.attributedPlaceholder = attrStringBankName;
        [self addSubview:_bankNameTextField];
        [_bankNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankNameLab.mas_right).offset(0);
            make.centerY.equalTo(self.bankNameLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        
        _branchTextField=[[UITextField alloc] init];
        _branchTextField.font=font;
        _branchTextField.textColor=[UIColor colorWithRed:208/255.0 green:144/255.0 blue:68/255.0 alpha:1];
        _branchTextField.placeholder=[HelperHandle getLanguage:@"请填写分行"];
        // 就下面这两行是重点
        NSAttributedString *attrStringBranch = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请填写分行"] attributes:
                                                  @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                    NSFontAttributeName:_branchTextField.font
                                                    }];
        _branchTextField.attributedPlaceholder = attrStringBranch;
        [self addSubview:_branchTextField];
        [_branchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.branchLab.mas_right).offset(0);
            make.centerY.equalTo(self.branchLab.mas_centerY).offset(0);
            make.width.mas_equalTo(textW);
            make.height.mas_equalTo(height);
        }];
        
        
        _putCashBtn=[[UIButton alloc] init];
        _putCashBtn.titleLabel.font=font;
        [_putCashBtn setTitle:[HelperHandle getLanguage:@"提现"] forState:UIControlStateNormal];
        _putCashBtn.backgroundColor=[UIColor colorWithRed:222/255.0 green:196/255.0 blue:164/255.0 alpha:1];
        [_putCashBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_putCashBtn addTarget:self action:@selector(putCashBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_putCashBtn];
        [_putCashBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.cashAreaLab.mas_centerX).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30 );
        }];
        
        
        //[IQKeyboardManager sharedManager].enable=YES;
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
    }
    return self;
}
-(void)updateLanguage{
    _payMethoddLab.text=[HelperHandle getLanguage:@"支付方式:"];
    _gameNicknameLab.text=[HelperHandle getLanguage:@"游戏昵称:"];
    _payerLab.text=[HelperHandle getLanguage:@"支 付 人 :"];
    _payAccountLab.text=[HelperHandle getLanguage:@"支付账号:"];
    _orderNumberLab.text=[HelperHandle getLanguage:@"订单号(后5位):"];
    _depositAmountLab.text=[HelperHandle getLanguage:@"存款金额:"];
    [_bankCardBtn setTitle:[HelperHandle getLanguage:@"请选择"] forState:UIControlStateNormal];
    if (_payType==BankCardAlipayType) {
        [self.bankCardBtn setTitle:[HelperHandle getLanguage:@"支付宝"] forState:UIControlStateNormal];
    }
    if (_payType==BankCardWeChatType) {
        [self.bankCardBtn setTitle:[HelperHandle getLanguage:@"微信"] forState:UIControlStateNormal];
    }
    if (_payType==BankCardBankPayType) {
        [self.bankCardBtn setTitle:[HelperHandle getLanguage:@"银行卡"] forState:UIControlStateNormal];
    }
    
   
    // 就下面这两行是重点
    NSAttributedString *attrStringPayer = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"真实姓名"]  attributes:
                                           @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                             NSFontAttributeName:_payerTextField.font
                                             }];
    _payerTextField.attributedPlaceholder = attrStringPayer;
    
    
    // 就下面这两行是重点
    NSAttributedString *attrStringPayAccount = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"支付昵称"] attributes:
                                                @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                  NSFontAttributeName:_payAccountTextField.font
                                                  }];
    _payAccountTextField.attributedPlaceholder = attrStringPayAccount;
    
    
    // 就下面这两行是重点
    NSAttributedString *attrStringOrderNumber = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入订单号后5位"] attributes:
                                                 @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                   NSFontAttributeName:_orderNumberTextField.font
                                                   }];
    _orderNumberTextField.attributedPlaceholder = attrStringOrderNumber;
    
    // 就下面这两行是重点
    NSAttributedString *attrStringDepositAmount = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入大于0的整数"] attributes:
                                                   @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                     NSFontAttributeName:_depositAmountTextField.font
                                                     }];
    _depositAmountTextField.attributedPlaceholder = attrStringDepositAmount;
    
    [_payBtn setTitle:[HelperHandle getLanguage:@"支付"] forState:UIControlStateNormal];
    _cashAreaLab.text=[HelperHandle getLanguage:@"提现专区"];
    _nameLab.text=[HelperHandle getLanguage:@"您的姓名:"];
    _bankCardNumLab.text=[HelperHandle getLanguage:@"银行卡号:"];
    _amountOfCashLab.text=[HelperHandle getLanguage:@"提现金额:"];
    _bankNameLab.text=[HelperHandle getLanguage:@"银行名称:"];
    _branchLab.text=[HelperHandle getLanguage:@"所在分行:"];
    
    NSAttributedString *attrStringName = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入姓名"] attributes:
                                          @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                            NSFontAttributeName:_nameTextField.font
                                            }];
    _nameTextField.attributedPlaceholder = attrStringName;
    
    NSAttributedString *attrStringBankCardNum = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入银行卡号"] attributes:
                                                 @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                   NSFontAttributeName:_bankCardNumTextField.font
                                                   }];
    _bankCardNumTextField.attributedPlaceholder = attrStringBankCardNum;
    
    NSAttributedString *attrStringAmountOfCash = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请输入大于0的整数"] attributes:
                                                  @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                    NSFontAttributeName:_amountOfCashTextField.font
                                                    }];
    _amountOfCashTextField.attributedPlaceholder = attrStringAmountOfCash;
    
    
    NSAttributedString *attrStringBankName = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"开户行名称"] attributes:
                                              @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                                NSFontAttributeName:_bankNameTextField.font
                                                }];
    _bankNameTextField.attributedPlaceholder = attrStringBankName;
    
    
    NSAttributedString *attrStringBranch = [[NSAttributedString alloc] initWithString:[HelperHandle getLanguage:@"请填写分行"] attributes:
                                            @{NSForegroundColorAttributeName:[UIColor colorWithRed:237/255.0 green:195/255.0 blue:166/255.0 alpha:1],
                                              NSFontAttributeName:_branchTextField.font
                                              }];
    _branchTextField.attributedPlaceholder = attrStringBranch;
    
    [_putCashBtn setTitle:[HelperHandle getLanguage:@"提现"] forState:UIControlStateNormal];
}
-(void)bankCardBtnAction{
    if (_bankCardView==nil) {
        BankCardView *bandCardView=[[BankCardView alloc] init];
        _bankCardView=bandCardView;
        [_bankCardView selectPayType:^(BankCardType type) {
            if (type==BankCardAlipayType) {
                [self.bankCardBtn setTitle:[HelperHandle getLanguage:@"支付宝"] forState:UIControlStateNormal];
                self.payType=type;
            }
            if (type==BankCardWeChatType) {
                [self.bankCardBtn setTitle:[HelperHandle getLanguage:@"微信"] forState:UIControlStateNormal];
                self.payType=type;
            }
            if (type==BankCardBankPayType) {
                [self.bankCardBtn setTitle:[HelperHandle getLanguage:@"银行卡"] forState:UIControlStateNormal];
                self.payType=type;
            }
        }];
    }
    if (_isBankCard) {
        [_bankCardView removeFromSuperview];
        _isBankCard=NO;
    }else{
        [self addSubview:_bankCardView];
        [_bankCardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bankCardBtn.mas_centerX).offset(0);
            make.top.equalTo(self.bankCardBtn.mas_bottom).offset(3);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100 );
        }];
        _isBankCard=YES;
    }
}
-(void)payBtnAction{
    if (_payType==-1) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"请选择支付方式！"]];
        return;
    }
    if (_gameNicknameTextField.text.length==0) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"请填写昵称！"]];
        return;
    }
    if (_payAccountTextField.text.length==0) {
         [EasyTextView showSuccessText:[HelperHandle getLanguage:@"支付账号不能为空！"]];
        return;
    }
    if (_orderNumberTextField.text.length==0) {
         [EasyTextView showSuccessText:[HelperHandle getLanguage:@"订单号不能为空！"]];
        return;
    }
   
    if (_depositAmountTextField.text.length==0) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"存款金额不能为空"]];
        return;
    }
    NSString *payType;
    if (_payType==BankCardWeChatType) {
        payType=@"1";
    }if (_payType==BankCardAlipayType) {
        payType=@"2";
    }
    if (_payType==BankCardBankPayType) {
        payType=@"3";
    }
    [GameMenuNetWork payWithScore:_depositAmountTextField.text payChannel:payType tradeNo:_orderNumberTextField.text payNumber:_payAccountTextField.text payName:_payAccountTextField.text complete:^(id  _Nullable data) {
        if([data[@"message"] isEqualToString:@"success"]) {
            [EasyTextView showSuccessText:[HelperHandle getLanguage:@"充值成功"]];
        }else{
            [EasyTextView showSuccessText:[HelperHandle getLanguage:@"充值失败"]];
        }
    }];
}
-(void)putCashBtnAction{
    if (_nameTextField.text.length==0) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"姓名不能为空！"]];
        return;
    }
    if (_bankCardNumTextField.text.length==0) {
         [EasyTextView showSuccessText:[HelperHandle getLanguage:@"银行卡号不能为空"]];
        return;
    }
    if (_amountOfCashTextField.text.length==0) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"提现金额不能为空！"]];
        return;
    }
    if (_bankNameTextField.text.length==0) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"银行名称不能为空！"]];
        return;
    }
    if (_branchTextField.text.length==0) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"银行分行不能为空！"]];
        return;
    }
    [GameMenuNetWork putForwardWithScore:_amountOfCashTextField.text withdrawNumber:_bankCardNumTextField.text withdrawName:_bankNameTextField.text trueName:_nameTextField.text auditRemark:_branchTextField.text complete:^(id  _Nullable data) {
        if([data[@"message"] isEqualToString:@"success"]) {
            [EasyTextView showSuccessText:[HelperHandle getLanguage:@"提现成功"]];
        }else{
            [EasyTextView showSuccessText:[HelperHandle getLanguage:@"提现失败"]];
        }
    }];
}
-(void)payCodeBtnAction:(UIButton *)btn{
    UIImage *img=btn.currentBackgroundImage;
     UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    
    OperationProcessView *openrationView=[[OperationProcessView alloc] init];
    [self.superview addSubview:openrationView];
    [openrationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.superview.mas_left).offset(0);
        make.right.equalTo(self.superview.mas_right).offset(0);
        make.top.equalTo(self.superview.mas_top).offset(0);
        make.bottom.equalTo(self.superview.mas_bottom).offset(0);
    }];
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
    if (error==nil) {
        [EasyTextView showSuccessText:[HelperHandle getLanguage:@"二维码已存入相册"]];
    }
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
@end
