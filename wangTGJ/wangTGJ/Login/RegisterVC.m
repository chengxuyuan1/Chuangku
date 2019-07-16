//
//  RegisterVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/14.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "RegisterVC.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "LoginNetWork.h"
#import "EasyShowView.h"
@interface RegisterVC ()<UITextFieldDelegate>
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UITextField *acountTextField;
@property (nonatomic,strong) UITextField *secretTextField;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *registerBtn;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    [self initTitleLab];
    [self initAcountTextField];
    [self initsecretTextField];
    [self initLoginBtn];
    [self initRegiterBtn];
}
- (void)initTitleLab{
    _titleLab = [[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"WanTongGuJi"];
    _titleLab.textColor = [UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    _titleLab.font=[UIFont systemFontOfSize:20];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(30);
    }];
}
- (void)initAcountTextField{
    _acountTextField=[[UITextField alloc] init];
    _acountTextField.placeholder = [HelperHandle getLanguage:@"用户名称"];
    [_acountTextField setValue:[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    _acountTextField.layer.borderWidth=1;
    _acountTextField.layer.cornerRadius=5;
    _acountTextField.layer.borderColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1].CGColor;
    [_acountTextField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    _acountTextField.leftView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _acountTextField.leftViewMode=UITextFieldViewModeAlways;
    _acountTextField.delegate=self;
    _acountTextField.tag=1001;
    
    [self.view addSubview:_acountTextField];
    [_acountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.titleLab.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
}
- (void)initsecretTextField{
    _secretTextField=[[UITextField alloc] init];
    _secretTextField.placeholder = [HelperHandle getLanguage:@"用户密码"];
    [_secretTextField setValue:[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    _secretTextField.layer.borderWidth=1;
    _secretTextField.layer.cornerRadius=5;
    _secretTextField.layer.borderColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1].CGColor;
    [_secretTextField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    _secretTextField.leftView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _secretTextField.leftViewMode=UITextFieldViewModeAlways;
    _secretTextField.secureTextEntry=YES;
    _secretTextField.delegate=self;
    _secretTextField.tag=1002;
    
    [self.view addSubview:_secretTextField];
    [_secretTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.acountTextField.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"7");// 点击键盘的‘换行’会调用
    if (textField.tag==1001) {
        [_secretTextField becomeFirstResponder];
    }else{
        [_secretTextField resignFirstResponder];
    }
    return YES;
}
- (void)initLoginBtn{
    _loginBtn = [[UIButton alloc] init];
    [_loginBtn setTitle:[HelperHandle getLanguage:@"登入"] forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor colorWithRed:24/255.0 green:16/255.0 blue:20/255.0 alpha:1] forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:237/255.0 alpha:1];
    [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
}
- (void)loginAction:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)initRegiterBtn{
    _registerBtn = [[UIButton alloc] init];
    [_registerBtn setTitle:[HelperHandle getLanguage:@"注册"] forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[UIColor colorWithRed:24/255.0 green:16/255.0 blue:20/255.0 alpha:1] forState:UIControlStateNormal];
    _registerBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:237/255.0 alpha:1];
    [_registerBtn addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.loginBtn.mas_top).offset(-10);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
}
-(void)registerBtnAction{
    if (_acountTextField.text.length==0) {
        [EasyTextView showInfoText:[HelperHandle getLanguage:@"请填写用户名!"] config:^EasyTextConfig *{
            return [EasyTextConfig shared].setShadowColor([UIColor redColor]).setBgColor([UIColor blackColor]).setTitleColor([UIColor whiteColor]).setStatusType(TextStatusTypeStatusBar);
        }];
        return;
    }
    if (_secretTextField.text.length<6) {
        [EasyTextView showInfoText:[HelperHandle getLanguage:@"密码不能小于6位数!"] config:^EasyTextConfig *{
            return [EasyTextConfig shared].setShadowColor([UIColor redColor]).setBgColor([UIColor blackColor]).setTitleColor([UIColor whiteColor]).setStatusType(TextStatusTypeStatusBar);
        }];
        return;
    }
    [LoginNetWork registerWithUserName:_acountTextField.text Pwd:_secretTextField.text Blcok:^(id data) {
        if ([data[@"message"] isEqualToString:@"success"]) {
            [EasyTextView showSuccessText:[HelperHandle getLanguage:@"注册成功!"]];
            self.resultBlock(data[@"data"][@"username"]);
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }else{
            [EasyTextView showSuccessText:[HelperHandle getLanguage:@"注册失败!"]];
            self.resultBlock(nil);
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
    }];
   
}
-(void)registerResult:(registerBlock)success{
    _resultBlock=success;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
