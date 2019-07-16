//
//  JunHaoView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/24.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "JunHaoView.h"
#import <Masonry/Masonry.h>
#import "LoginUserInfo.h"
#import <EasyShowView/EasyShowView.h>
#import "HelperHandle.h"
@implementation JunHaoView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _topLine=[[UIView alloc] init];
        _topLine.backgroundColor=[UIColor whiteColor];
        [self addSubview:_topLine];
        [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(20);
            make.right.equalTo(self.mas_right).offset(-20);
            make.height.mas_equalTo(1);
        }];
        
        _bottomLine=[[UIView alloc] init];
        _bottomLine.backgroundColor=[UIColor whiteColor];
        [self addSubview:_bottomLine];
        [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(1);
        }];
        
        _middleLine=[[UIView alloc] init];
        _middleLine.backgroundColor=[UIColor whiteColor];
        [self addSubview:_middleLine];
       
        
        _verticalLine1=[[UIView alloc] init];
        _verticalLine1.backgroundColor=[UIColor whiteColor];
        [self addSubview:_verticalLine1];
        
        _verticalLine2=[[UIView alloc] init];
        _verticalLine2.backgroundColor=[UIColor whiteColor];
        [self addSubview:_verticalLine2];
        
        _verticalLine3=[[UIView alloc] init];
        _verticalLine3.backgroundColor=[UIColor whiteColor];
        [self addSubview:_verticalLine3];
        
        _verticalLine4=[[UIView alloc] init];
        _verticalLine4.backgroundColor=[UIColor whiteColor];
        [self addSubview:_verticalLine4];
        
        _verticalLine5=[[UIView alloc] init];
        _verticalLine5.backgroundColor=[UIColor whiteColor];
        [self addSubview:_verticalLine5];
        
        
        _lab1=[[UILabel alloc] init];
        _lab1.text=@"0/0";
        _lab1.textColor=[UIColor colorWithRed:198/255.0 green:243/255.0 blue:150/255.0 alpha:1];
        _lab1.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_lab1];
        
        
        _xianLongBaoImgView=[[UIButton alloc] init];
        [_xianLongBaoImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"p_dragon_bonus"]] forState:UIControlStateNormal];
        [_xianLongBaoImgView addTarget:self action:@selector(xianLongBaoImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_xianLongBaoImgView];
        
        _betsNum=50;
        //获取通知中心单例对象
        NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
        //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
        [center addObserver:self selector:@selector(notice:) name:@"ChipNum" object:nil];
        
        
        _lab2=[[UILabel alloc] init];
        _lab2.text=@"0/0";
        _lab2.textColor=[UIColor colorWithRed:198/255.0 green:243/255.0 blue:150/255.0 alpha:1];
        _lab2.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_lab2];
        
        
        _xianDuiImgView=[[UIButton alloc] init];
        [_xianDuiImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"playerpair_v2"]] forState:UIControlStateNormal];
        [_xianDuiImgView addTarget:self action:@selector(xianDuiImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_xianDuiImgView];
        
       
        
        
        _lab3=[[UILabel alloc] init];
        _lab3.text=@"0/0";
        _lab3.textColor=[UIColor colorWithRed:198/255.0 green:243/255.0 blue:150/255.0 alpha:1];
        _lab3.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_lab3];
        
        
        
        
        _zhuangDuiImgView=[[UIButton alloc] init];
        [_zhuangDuiImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"bankerpair_v3"]] forState:UIControlStateNormal];
        [_zhuangDuiImgView  addTarget:self action:@selector(zhuangDuiImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_zhuangDuiImgView];
        
        _lab4=[[UILabel alloc] init];
        _lab4.text=@"0/0";
        _lab4.textColor=[UIColor colorWithRed:198/255.0 green:243/255.0 blue:150/255.0 alpha:1];
        _lab4.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_lab4];
        
        _zhuangLongBaoImgView=[[UIButton alloc] init];
         [_zhuangLongBaoImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"b_dragon_bonus"]] forState:UIControlStateNormal];
         [_zhuangLongBaoImgView  addTarget:self action:@selector(zhuangLongBaoImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_zhuangLongBaoImgView];
        
        
        _lab5=[[UILabel alloc] init];
        _lab5.text=@"0/0";
        _lab5.textColor=[UIColor colorWithRed:198/255.0 green:243/255.0 blue:150/255.0 alpha:1];
        _lab5.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_lab5];
        
        _xianImgView=[[UIButton alloc] init];
       [_xianImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"player_1_1_v2"]] forState:UIControlStateNormal];
        [_xianImgView  addTarget:self action:@selector(xianImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_xianImgView];
        
        _lab6=[[UILabel alloc] init];
        _lab6.text=@"0/0";
        _lab6.textColor=[UIColor colorWithRed:198/255.0 green:243/255.0 blue:150/255.0 alpha:1];
        _lab6.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_lab6];
        
        _heImgView=[[UIButton alloc] init];
        [_heImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"tie_v2"]] forState:UIControlStateNormal];
        [_heImgView  addTarget:self action:@selector(heImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_heImgView];
        
        _lab7=[[UILabel alloc] init];
        _lab7.text=@"0/0";
        _lab7.textColor=[UIColor colorWithRed:198/255.0 green:243/255.0 blue:150/255.0 alpha:1];
        _lab7.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_lab7];
        
        _zhuangImgView=[[UIButton alloc] init];
        [_zhuangImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"banker_1_0_95_v2"]] forState:UIControlStateNormal];
        [_zhuangImgView  addTarget:self action:@selector(zhuangImgViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_zhuangImgView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
        
    }
    
    return self;
}
-(void)updateLanguage{
    [_xianLongBaoImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"p_dragon_bonus"]] forState:UIControlStateNormal];
      [_xianDuiImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"playerpair_v2"]] forState:UIControlStateNormal];
     [_zhuangDuiImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"bankerpair_v3"]] forState:UIControlStateNormal];
     [_zhuangLongBaoImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"b_dragon_bonus"]] forState:UIControlStateNormal];
      [_xianImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"player_1_1_v2"]] forState:UIControlStateNormal];
    [_heImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"tie_v2"]] forState:UIControlStateNormal];
    [_zhuangImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"banker_1_0_95_v2"]] forState:UIControlStateNormal];
    if (!_isMaidFree) {
        [_zhuangImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"banker_1_0_95_v2"]] forState:UIControlStateNormal];
    }else{
        [_zhuangImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"banker_1_1_v2"]] forState:UIControlStateNormal];
    }
    
}
-(void)notice:(NSNotification *)notice{
    NSString *notiNum=notice.userInfo[@"ChipNum"];
    _betsNum=[notiNum integerValue];
}
-(void)showTipWithText:(NSString *)text{
    [EasyTextView showText:[HelperHandle getLanguage:text] config:^EasyTextConfig *{
        //（这三种方法都是一样的，根据使用习惯选择一种就行。|| 不传的参数就会使用EasyTextGlobalConfig全局配置的属性）
        //方法一
        //return [EasyTextConfig configWithSuperView:self.view superReceiveEvent:ShowTextEventUndefine animationType:TextAnimationTypeNone textStatusType:TextStatusTypeBottom];
        //方法二
        //return [EasyTextConfig shared].setBgColor([UIColor lightGrayColor]).setShadowColor([UIColor clearColor]).setStatusType(TextStatusTypeBottom);
        //方法三
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor blackColor] ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeMidden;
        return config ;
    }];
}
-(void)xianLongBaoImgViewAction:(UIButton *)btn{
    return;
    if (_betsXianLongBaoBgView==nil) {
        _betsXianLongBaoBgView=[[UIImageView alloc] init];
        _betsXianLongBaoBgView.image=[UIImage imageNamed:@"new_chip_01"];
    }
    
    if (_betsXianLongBaoBtn==nil) {
        _betsXianLongBaoBtn=[[UIButton alloc] init];
        [_betsXianLongBaoBtn setBackgroundImage:[UIImage imageNamed:@"M_Betbox"] forState:UIControlStateNormal];
         [_betsXianLongBaoBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        _betsXianLongBaoBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        _betsXianLongBaoBtn.titleLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    }
    NSInteger sum=[_betsXianLongBaoBtn.currentTitle integerValue];
    NSInteger betNum=_betsNum;
    if (_betsNum>=20&&_betsNum<=1700) {
        if (_betSum+_betsNum<=[LoginUserInfo share].userModel.goldcoins) {
            _betSum+=_betsNum;
        }else{
            
            if ([LoginUserInfo share].userModel.goldcoins-_betSum>0) {
                betNum=[LoginUserInfo share].userModel.goldcoins-_betSum;
                _betSum+=[LoginUserInfo share].userModel.goldcoins-_betSum;
            }else{
             [self showTipWithText:@"超过限红"];
                return;
            }
        }
        
    }else{
        [self showTipWithText:@"超过限红"];
        return;
    }
    [self addSubview:_betsXianLongBaoBgView];
    [_betsXianLongBaoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lab1.mas_centerY).offset(0);
        make.left.equalTo(self.lab1.mas_right).offset(-20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(45);
    }];
    [_betsXianLongBaoBtn setTitle:[NSString stringWithFormat:@"%ld",sum+betNum] forState:UIControlStateNormal];
    [_betsXianLongBaoBgView addSubview:_betsXianLongBaoBtn];
    [_betsXianLongBaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.betsXianLongBaoBgView.mas_centerX).offset(0);
        make.bottom.equalTo(self.betsXianLongBaoBgView.mas_bottom).offset(-15);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(45);
    }];
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"BetsStar" object:nil userInfo:@{@"BetNum":[NSNumber numberWithInteger:sum+_betsNum]}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
-(void)xianDuiImgViewAction:(UIButton *)btn{

    if (_betsXianDuiBtn==nil) {
        _betsXianDuiBtn=[[UIButton alloc] init];
        [_betsXianDuiBtn setBackgroundImage:[UIImage imageNamed:@"M_Betbox"] forState:UIControlStateNormal];
        [_betsXianDuiBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        _betsXianDuiBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        _betsXianDuiBtn.titleLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    }
     NSInteger betNum=_betsNum;
    NSInteger minBet=20;
    NSInteger maxBet=5000;
    if (_betLimitDic) {
        minBet=[_betLimitDic[@"minbet"][2] integerValue];
        maxBet=[_betLimitDic[@"maxbet"][2] integerValue];
    }
    if (_betsNum>=minBet&&_betsNum<=maxBet) {
        if (_betSum+_betsNum<=[LoginUserInfo share].userModel.goldcoins) {
            _betSum+=_betsNum;
        }else{
            
            if ([LoginUserInfo share].userModel.goldcoins-_betSum>0) {
                betNum=[LoginUserInfo share].userModel.goldcoins-_betSum;
                _betSum+=[LoginUserInfo share].userModel.goldcoins-_betSum;
            }else{
                [self showTipWithText:@"超过限红"];
                return;
            }
        }
    }else{
        [self showTipWithText:@"超过限红"];
        return;
    }
    

    
    NSInteger sum=[_betsXianDuiBtn.currentTitle integerValue];
    if (_betsXianDuiBgViewArr==nil) {
        _betsXianDuiBgViewArr=[NSMutableArray array];
    }
    _betsXianDuiNum+=betNum;
    [self addChip:_betsXianDuiBgViewArr View:_lab2 Num:sum+betNum BetsBtn:_betsXianDuiBtn];
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"BetsStar" object:nil userInfo:@{@"BetNum":[NSNumber numberWithInteger:_betsNum]}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
-(void)addChip:(NSMutableArray *)muarr View:(UILabel *)betLab Num:(NSInteger)num BetsBtn:(UIButton *)betBtn{
    [self initMoneyChipWithNum:num View:betLab Arr:muarr];
    [betBtn setTitle:[NSString stringWithFormat:@"%ld",num] forState:UIControlStateNormal];
    UIView *bgView=muarr.lastObject;
    [bgView addSubview:betBtn];
    [betBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView.mas_centerX).offset(0);
        make.bottom.equalTo(bgView.mas_bottom).offset(-15);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(45);
    }];
}
-(void)initMoneyChipWithNum:(NSInteger)num View:(UIView *)view Arr:(NSMutableArray *)muarr{
    for (UIView *v in muarr) {
        [v removeFromSuperview];
    }
    [muarr removeAllObjects];
    num=[self initMoneyChipWithChipNum:10000 Num:num View:view Img:@"new_chip_10" Arr:muarr];
    num=[self initMoneyChipWithChipNum:5000 Num:num View:view Img:@"new_chip_09" Arr:muarr];
    num=[self initMoneyChipWithChipNum:1000 Num:num View:view Img:@"new_chip_07" Arr:muarr];
    num=[self initMoneyChipWithChipNum:500 Num:num View:view Img:@"new_chip_06" Arr:muarr];
    num=[self initMoneyChipWithChipNum:200 Num:num View:view Img:@"new_chip_05" Arr:muarr];
    num=[self initMoneyChipWithChipNum:100 Num:num View:view Img:@"new_chip_04" Arr:muarr];
    num=[self initMoneyChipWithChipNum:50 Num:num View:view Img:@"new_chip_03" Arr:muarr];
    num=[self initMoneyChipWithChipNum:20 Num:num View:view Img:@"new_chip_02" Arr:muarr];
    num=[self initMoneyChipWithChipNum:10 Num:num View:view Img:@"new_chip_01" Arr:muarr];
    for (int i=0; i<muarr.count; i++) {
        UIImageView *betsBgView=muarr[i];
        [self addSubview:betsBgView];
        [betsBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view.mas_centerY).offset(i*(-2));
            make.left.equalTo(view.mas_right).offset(-20);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(45);
        }];
    }
}
-(NSInteger)initMoneyChipWithChipNum:(NSInteger)chipNum Num:(NSInteger)num View:(UIView *)view Img:(NSString *)img Arr:(NSMutableArray *)arr{
    if (num/chipNum>=1) {
        NSInteger kn=num/chipNum;
        num=num-chipNum*kn;
        for (int i=0; i<kn; i++) {
            UIImageView * betsBgView=[[UIImageView alloc] init];
            betsBgView.image=[UIImage imageNamed:img];
            [arr addObject:betsBgView];
        }
    }
    return num;
}
-(void)zhuangDuiImgViewAction:(UIButton *)btn{

    if (_betsZhuangDuiBtn==nil) {
        _betsZhuangDuiBtn=[[UIButton alloc] init];
        [_betsZhuangDuiBtn setBackgroundImage:[UIImage imageNamed:@"M_Betbox"] forState:UIControlStateNormal];
        [_betsZhuangDuiBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        _betsZhuangDuiBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        _betsZhuangDuiBtn.titleLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    }
    NSInteger betNum=_betsNum;
    NSInteger minBet=20;
    NSInteger maxBet=5000;
    if (_betLimitDic) {
        minBet=[_betLimitDic[@"minbet"][2] integerValue];
        maxBet=[_betLimitDic[@"maxbet"][2] integerValue];
    }
    if (_betsNum>=minBet&&_betsNum<=maxBet) {
        if (_betSum+_betsNum<=[LoginUserInfo share].userModel.goldcoins) {
            _betSum+=_betsNum;
        }else{
            
            if ([LoginUserInfo share].userModel.goldcoins-_betSum>0) {
                betNum=[LoginUserInfo share].userModel.goldcoins-_betSum;
                _betSum+=[LoginUserInfo share].userModel.goldcoins-_betSum;
            }else{
                [self showTipWithText:@"超过限红"];
                return;
            }
        }
    }else{
        [self showTipWithText:@"超过限红"];
        return;
    }

    NSInteger sum=[_betsZhuangDuiBtn.currentTitle integerValue];
    if (_betsZhuangDuiBgViewArr==nil) {
        _betsZhuangDuiBgViewArr=[NSMutableArray array];
    }
    _betsZhuangDuiNum+=betNum;
    [self addChip:_betsZhuangDuiBgViewArr View:_lab3 Num:sum+betNum BetsBtn:_betsZhuangDuiBtn];
    
   
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"BetsStar" object:nil userInfo:@{@"BetNum":[NSNumber numberWithInteger:sum+_betsNum]}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
-(void)zhuangLongBaoImgViewAction:(UIButton *)btn{
    return;

    if (_betsZhuangLongBaoBtn==nil) {
        _betsZhuangLongBaoBtn=[[UIButton alloc] init];
        [_betsZhuangLongBaoBtn setBackgroundImage:[UIImage imageNamed:@"M_Betbox"] forState:UIControlStateNormal];
        [_betsZhuangLongBaoBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        _betsZhuangLongBaoBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        _betsZhuangLongBaoBtn.titleLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    }
    NSInteger betNum=_betsNum;
    if (_betsNum>=20&&_betsNum<=1700) {
        if (_betSum+_betsNum<=[LoginUserInfo share].userModel.goldcoins) {
            _betSum+=_betsNum;
        }else{
            
            if ([LoginUserInfo share].userModel.goldcoins-_betSum>0) {
                betNum=[LoginUserInfo share].userModel.goldcoins-_betSum;
                _betSum+=[LoginUserInfo share].userModel.goldcoins-_betSum;
            }else{
                [self showTipWithText:@"超过限红"];
                return;
            }
        }
    }else{
        [self showTipWithText:@"超过限红"];
        return;
    }
  
    NSInteger sum=[_betsZhuangLongBaoBtn.currentTitle integerValue];
    if (_betsZhuangLongBaoBgViewArr==nil) {
        _betsZhuangLongBaoBgViewArr=[NSMutableArray array];
    }
    [self addChip:_betsZhuangLongBaoBgViewArr View:_lab4 Num:sum+betNum BetsBtn:_betsZhuangLongBaoBtn];
    
   
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"BetsStar" object:nil userInfo:@{@"BetNum":[NSNumber numberWithInteger:sum+_betsNum]}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
-(void)xianImgViewAction:(UIButton *)btn{

    if (_betsXianBtn==nil) {
        _betsXianBtn=[[UIButton alloc] init];
        [_betsXianBtn setBackgroundImage:[UIImage imageNamed:@"M_Betbox"] forState:UIControlStateNormal];
        [_betsXianBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        _betsXianBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        _betsXianBtn.titleLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    }
     NSInteger betNum=_betsNum;
    NSInteger minBet=20;
    NSInteger maxBet=50000;
    if (_betLimitDic) {
        minBet=[_betLimitDic[@"minbet"][0] integerValue];
        maxBet=[_betLimitDic[@"maxbet"][0] integerValue];
    }
    if (_betsNum>=minBet&&_betsNum<=maxBet) {
        if (_betSum+_betsNum<=[LoginUserInfo share].userModel.goldcoins) {
            _betSum+=_betsNum;
        }else{
            
            if ([LoginUserInfo share].userModel.goldcoins-_betSum>0) {
                betNum=[LoginUserInfo share].userModel.goldcoins-_betSum;
                _betSum+=[LoginUserInfo share].userModel.goldcoins-_betSum;
            }else{
                [self showTipWithText:@"超过限红"];
                return;
            }
        }
    }else{
        [self showTipWithText:@"超过限红"];
        return;
    }
  
    NSInteger sum=[_betsXianBtn.currentTitle integerValue];
    if (_betsXianBgViewArr==nil) {
        _betsXianBgViewArr=[NSMutableArray array];
    }
    _betsXianNum+=betNum;
    [self addChip:_betsXianBgViewArr View:_lab5 Num:sum+betNum BetsBtn:_betsXianBtn];
    
    
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"BetsStar" object:nil userInfo:@{@"BetNum":[NSNumber numberWithInteger:sum+_betsNum]}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
-(void)heImgViewAction:(UIButton *)btn{

    if (_betsHeBtn==nil) {
        _betsHeBtn=[[UIButton alloc] init];
        [_betsHeBtn setBackgroundImage:[UIImage imageNamed:@"M_Betbox"] forState:UIControlStateNormal];
        [_betsHeBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        _betsHeBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        _betsHeBtn.titleLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    }
    
    NSInteger betNum=_betsNum;
    NSInteger minBet=20;
    NSInteger maxBet=5000;
    if (_betLimitDic) {
        minBet=[_betLimitDic[@"minbet"][1] integerValue];
        maxBet=[_betLimitDic[@"maxbet"][1] integerValue];
    }
    if (_betsNum>=minBet&&_betsNum<=maxBet) {
        if (_betSum+_betsNum<=[LoginUserInfo share].userModel.goldcoins) {
            _betSum+=_betsNum;
        }else{
            
            if ([LoginUserInfo share].userModel.goldcoins-_betSum>0) {
                betNum=[LoginUserInfo share].userModel.goldcoins-_betSum;
                _betSum+=[LoginUserInfo share].userModel.goldcoins-_betSum;
            }else{
                [self showTipWithText:@"超过限红"];
                return;
            }
        }
    }else{
        [self showTipWithText:@"超过限红"];
        return;
    }

    NSInteger sum=[_betsHeBtn.currentTitle integerValue];
    if (_betsHeBgViewArr==nil) {
        _betsHeBgViewArr=[NSMutableArray array];
    }
    _betsHeNum+=betNum;
    [self addChip:_betsHeBgViewArr View:_lab6 Num:sum+betNum BetsBtn:_betsHeBtn];
    
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"BetsStar" object:nil userInfo:@{@"BetNum":[NSNumber numberWithInteger:sum+_betsNum]}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
-(void)zhuangImgViewAction:(UIButton *)btn{

    if (_betsZhuangBtn==nil) {
        _betsZhuangBtn=[[UIButton alloc] init];
        [_betsZhuangBtn setBackgroundImage:[UIImage imageNamed:@"M_Betbox"] forState:UIControlStateNormal];
        [_betsZhuangBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        _betsZhuangBtn.titleLabel.font=[UIFont systemFontOfSize:12];
        _betsZhuangBtn.titleLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    }
    NSInteger betNum=_betsNum;
    NSInteger minBet=20;
    NSInteger maxBet=50000;
    if (_betLimitDic) {
        minBet=[_betLimitDic[@"minbet"][0] integerValue];
        maxBet=[_betLimitDic[@"maxbet"][0] integerValue];
    }
    if (_betsNum>=minBet&&_betsNum<=maxBet) {
        if (_betSum+_betsNum<=[LoginUserInfo share].userModel.goldcoins) {
            _betSum+=_betsNum;
        }else{
            
            if ([LoginUserInfo share].userModel.goldcoins-_betSum>0) {
                betNum=[LoginUserInfo share].userModel.goldcoins-_betSum;
                _betSum+=[LoginUserInfo share].userModel.goldcoins-_betSum;
            }else{
                [self showTipWithText:@"超过限红"];
                return;
            }
        }
    }else{
        [self showTipWithText:@"超过限红"];
        return;
    }
;
    NSInteger sum=[_betsZhuangBtn.currentTitle integerValue];
    if (_betsZhuangBgArr==nil) {
        _betsZhuangBgArr=[NSMutableArray array];
    }
    _betsZhuangNum+=betNum;
    [self addChip:_betsZhuangBgArr View:_lab7 Num:sum+betNum BetsBtn:_betsZhuangBtn];
    
    
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"BetsStar" object:nil userInfo:@{@"BetNum":[NSNumber numberWithInteger:sum+_betsNum]}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}
-(void)removeBetsChipView:(NSMutableArray *)muarr{
    for (UIView *view in muarr) {
        [view removeFromSuperview];
    }
    [muarr removeAllObjects];
}
-(void)returnToZeroBets{
    [_betsXianLongBaoBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
    [_betsXianLongBaoBgView removeFromSuperview];
    
    [_betsXianDuiBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
   
    [self removeBetsChipView:_betsXianDuiBgViewArr];
    
    
    [_betsZhuangDuiBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
    [self removeBetsChipView:_betsZhuangDuiBgViewArr];
    
    [_betsZhuangLongBaoBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
    [self removeBetsChipView:_betsZhuangLongBaoBgViewArr];
    
    [_betsXianBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
    [self removeBetsChipView:_betsXianBgViewArr];
    
    [_betsHeBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
    [self removeBetsChipView:_betsHeBgViewArr];
    
    [_betsZhuangBtn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
     [self removeBetsChipView:_betsZhuangBgArr];
    
}
-(void)betFailToBets{
    [_betsXianDuiBtn setTitle:[NSString stringWithFormat:@"%ld",[_betsXianDuiBtn.currentTitle integerValue]-_betsXianDuiNum ] forState:UIControlStateNormal];
    _betsXianDuiNum=0;
    
    [_betsZhuangDuiBtn setTitle:[NSString stringWithFormat:@"%ld",[_betsZhuangDuiBtn.currentTitle integerValue]-_betsZhuangDuiNum] forState:UIControlStateNormal];
    _betsZhuangDuiNum=0;
    
    [_betsXianBtn setTitle:[NSString stringWithFormat:@"%ld",[_betsXianBtn.currentTitle integerValue]-_betsXianNum] forState:UIControlStateNormal];
    _betsXianNum=0;
    
    [_betsHeBtn setTitle:[NSString stringWithFormat:@"%ld",[_betsHeBtn.currentTitle integerValue]-_betsHeNum] forState:UIControlStateNormal];
    _betsHeNum=0;
    
     [_betsZhuangBtn setTitle:[NSString stringWithFormat:@"%ld",[_betsZhuangBtn.currentTitle integerValue]-_betsZhuangNum] forState:UIControlStateNormal];
    _betsZhuangNum=0;
    
}
-(void)returnToZeroBetNum{
     _betsXianDuiNum=0;
    _betsZhuangDuiNum=0;
    _betsXianNum=0;
    _betsHeNum=0;
    _betsZhuangNum=0;
}
-(void)betResultWithArr:(NSArray *)arr{
    [self addSubview:_betsXianLongBaoBgView];
//    [_betsXianLongBaoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.lab1.mas_centerY).offset(0);
//        make.left.equalTo(self.lab1.mas_right).offset(-20);
//        make.height.mas_equalTo(30);
//        make.width.mas_equalTo(45);
//    }];
//    [_betsXianLongBaoBtn setTitle:[NSString stringWithFormat:@"%ld",[arr[0] integerValue]] forState:UIControlStateNormal];
    
    
    
    if ([arr[3] integerValue]>0) {
        if (_betsXianDuiBgViewArr==nil) {
            _betsXianDuiBgViewArr=[NSMutableArray array];
        }
        [self addChip:_betsXianDuiBgViewArr View:_lab2 Num:[arr[3] integerValue] BetsBtn:_betsXianDuiBtn];
    }
    
    
    if ([arr[4] integerValue]>0) {
        if (_betsZhuangDuiBgViewArr==nil) {
            _betsZhuangDuiBgViewArr=[NSMutableArray array];
        }
        [self addChip:_betsZhuangDuiBgViewArr View:_lab3 Num:[arr[4] integerValue] BetsBtn:_betsZhuangDuiBtn];
    }
    
    
    
    
//    [self addSubview:_betsZhuangLongBaoBgView];
//    [_betsZhuangLongBaoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.lab4.mas_centerY).offset(0);
//        make.left.equalTo(self.lab4.mas_right).offset(-20);
//        make.height.mas_equalTo(30);
//        make.width.mas_equalTo(45);
//    }];
//    NSInteger sum=[_betsZhuangLongBaoBtn.currentTitle integerValue];
//    [_betsZhuangLongBaoBtn setTitle:[NSString stringWithFormat:@"%ld",sum+betNum] forState:UIControlStateNormal];
    
    
    
    if ([arr[0] integerValue]>0) {
        if (_betsXianBgViewArr==nil) {
            _betsXianBgViewArr=[NSMutableArray array];
        }
        [self addChip:_betsXianBgViewArr View:_lab5 Num:[arr[0] integerValue] BetsBtn:_betsXianBtn];
    }
    
    
    
    if ([arr[2] integerValue]>0) {
         [self addChip:_betsHeBgViewArr View:_lab6 Num:[arr[2] integerValue] BetsBtn:_betsHeBtn];
    }
    
    
    
    if ([arr[1] integerValue]>0) {
        if (_betsHeBgViewArr==nil) {
            _betsHeBgViewArr=[NSMutableArray array];
        }
        [self addChip:_betsZhuangBgArr View:_lab7 Num:[arr[1] integerValue] BetsBtn:_betsZhuangBtn];
    }
    
    
    
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger w=(self.frame.size.width+self.frame.size.width-20*2)/2;
    _middleLine.frame=CGRectMake((self.frame.size.width-w)/2, self.frame.size.height/2, w, 1);
    
    NSInteger vw=self.frame.size.width/4;
    
    [_verticalLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(vw);
        make.bottom.equalTo(self.middleLine.mas_top).offset(0);
        make.width.mas_equalTo(1);
    }];
    
    [_verticalLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(vw*2);
        make.bottom.equalTo(self.middleLine.mas_top).offset(0);
        make.width.mas_equalTo(1);
    }];
    
    [_verticalLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(vw*3);
        make.bottom.equalTo(self.middleLine.mas_top).offset(0);
        make.width.mas_equalTo(1);
    }];
    
    [_verticalLine4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleLine.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(vw+vw/2);
        make.bottom.equalTo(self.bottomLine.mas_top).offset(0);
        make.width.mas_equalTo(1);
    }];
    
    
    [_verticalLine5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleLine.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(vw*2+vw/2);
        make.bottom.equalTo(self.bottomLine.mas_top).offset(0);
        make.width.mas_equalTo(1);
    }];
    
    [_lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLine.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.verticalLine1.mas_left).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [_xianLongBaoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab1.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.verticalLine1.mas_left).offset(0);
        make.bottom.equalTo(self.middleLine.mas_top).offset(0);
        //make.height.mas_equalTo(30);
    }];
    
    [_lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLine.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine1.mas_left).offset(0);
        make.right.equalTo(self.verticalLine2.mas_left).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [_xianDuiImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab2.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine1.mas_left).offset(0);
        make.right.equalTo(self.verticalLine2.mas_left).offset(0);
        make.bottom.equalTo(self.middleLine.mas_top).offset(0);
        //make.height.mas_equalTo(30);
    }];
    
    [_lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLine.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine2.mas_left).offset(0);
        make.right.equalTo(self.verticalLine3.mas_left).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [_zhuangDuiImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab3.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine2.mas_left).offset(0);
        make.right.equalTo(self.verticalLine3.mas_left).offset(0);
        make.bottom.equalTo(self.middleLine.mas_top).offset(0);
        //make.height.mas_equalTo(30);
    }];
    
    
    [_lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLine.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine3.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-20);
        make.height.mas_equalTo(30);
    }];
    
    [_zhuangLongBaoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab4.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine3.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-20);
        make.bottom.equalTo(self.middleLine.mas_top).offset(0);
        //make.height.mas_equalTo(30);
    }];
    
    [_lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleLine.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.verticalLine4.mas_right).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [_xianImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab5.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.verticalLine4.mas_right).offset(0);
        make.bottom.equalTo(self.bottomLine.mas_top).offset(0);
        //make.height.mas_equalTo(30);
    }];
    
    [_lab6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleLine.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine4.mas_left).offset(0);
        make.right.equalTo(self.verticalLine5.mas_right).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [_heImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab6.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine4.mas_left).offset(0);
        make.right.equalTo(self.verticalLine5.mas_right).offset(0);
        make.bottom.equalTo(self.bottomLine.mas_top).offset(0);
        //make.height.mas_equalTo(30);
    }];
    
    [_lab7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleLine.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine5.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-20);
        make.height.mas_equalTo(30);
    }];
    
    [_zhuangImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab7.mas_bottom).offset(0);
        make.left.equalTo(self.verticalLine5.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(-20);
        make.bottom.equalTo(self.bottomLine.mas_top).offset(0);
        //make.height.mas_equalTo(30);
    }];
}
- (void)drawRect:(CGRect)rect {
    [self initSlantLinePoint1:CGPointMake(20, 0) Point2:CGPointMake(0, self.frame.size.height)];
    [self initSlantLinePoint1:CGPointMake(self.frame.size.width-20, 0) Point2:CGPointMake(self.frame.size.width, self.frame.size.height)];
}
-(void)initSlantLinePoint1:(CGPoint)point1 Point2:(CGPoint)point2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 1);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 255/ 255.0,255/ 255.0, 255/ 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, point1.x, point1.y);  //起点坐标
    CGContextAddLineToPoint(context, point2.x, point2.y);   //终点坐标
    
    CGContextStrokePath(context);
}
@end
