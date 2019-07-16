//
//  GameVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/23.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GameVC.h"
#import "PlayerView.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "CircleBgView.h"
#import "TableLimitRedMenu.h"
#import "ZhuangWenLuGridView.h"
#import "JunHaoView.h"
#import "ChipBgView.h"
#import "DisplayCardView.h"
#import "VideoOptionView.h"
#import <EasyShowView/EasyShowView.h>
#import "GameMusicPalyer.h"
#import "LoginUserInfo.h"
#import "NetworkingAdress.h"
#import "SettingMenuView.h"
#import "UserInfoVC.h"
typedef void (^GameBlock)(void);

@interface GameVC ()<ZhuangWenLuGridViewDelegate,VideoOptionViewDelegate>
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) PlayerView *palyerView;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) CircleBgView *circleBgView;
@property (nonatomic,strong) UIButton *tableLimitRedBtn;
@property (nonatomic,strong) TableLimitRedMenu *tableLimitRedMenu;
@property (nonatomic,assign) BOOL  isOpen;
@property (nonatomic,strong) UIButton *menuBtn;
@property (nonatomic,strong) UIImageView *userNameBgImgView;
@property (nonatomic,strong) UIImageView *userIconImgView;
@property  (nonatomic,strong) UILabel *userNameLab;
@property (nonatomic,strong) UIView *moneyBgView;
@property (nonatomic,strong) UIImageView *moneyImgView;
@property (nonatomic,strong) UILabel *moneyLab;
@property (nonatomic,strong) UIImageView *headImgView;
@property (nonatomic,strong) ZhuangWenLuGridView *zhuangWenLuGridView;
@property (nonatomic,assign) BOOL isReach;
@property (nonatomic,assign) BOOL isReachLong;
@property (nonatomic,strong) UIButton *longBaoBtn;
@property (nonatomic,strong) UIButton *canCelBtn;
@property (nonatomic,strong) JunHaoView *junHaoView;
@property (nonatomic,strong) UIImageView * zhuang6DianImgView;
@property (nonatomic,strong) ChipBgView *chipBgView;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *maidFreeBtn;
@property (nonatomic,assign) BOOL isMaidFree;
@property (nonatomic,strong) UIButton *videoOptionsBtn;
@property (nonatomic,strong) DisplayCardView *dispalayCardView;
@property (nonatomic,strong) VideoOptionView *videoOptionView;
@property (nonatomic,assign) BOOL isVideoOption;
@property (nonatomic, strong) SocketIOClient *clientSocket;
@property (nonatomic,strong) NSDictionary *joinGameDic;
@property (nonatomic,strong) NSDictionary *resultDic;
@property (nonatomic,strong) NSDictionary *betrecordDic;
@property (nonatomic,strong) NSDictionary *fillcardDic;
@property (nonatomic,strong) NSDictionary *liquidation;
@property (nonatomic,strong) NSDictionary *stateDic;
@property (nonatomic,strong) NSDictionary *switch_resultDic;
@property (nonatomic,strong) NSDictionary *dobetDic;
@property (nonatomic,strong) NSDictionary *nobetDic;
@property (nonatomic,strong) NSDictionary *betscoreDic;
@property (nonatomic,strong) GameMusicPalyer *gameMusicPlayer;
@property (nonatomic,assign) NSInteger xianNum;
@property (nonatomic,assign) NSInteger zhuangNum;
@property (nonatomic,copy) GameBlock musicBlock;
@property (nonatomic,assign) BOOL isBeting;//是否下注
@property (nonatomic,strong) SettingMenuView *settingMenuView;
@property (nonatomic,assign) BOOL isRepeat;
@property (nonatomic,assign) CGFloat leftF;

@end

@implementation GameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _leftF=isIphoneX;
    if (_leftF>0) {
        _leftF-=14;
    }
    [self initGameMusicPalyer];
    [self initPlayerView];
    [self initBackBtn];
    [self initTitleLab];
    [self initCircleBgView];
    [self initTableLimitRedBtn];
    [self initTableLimitRedMenu];
    [self initMenuBtn];
    [self initUserNameBgImgView];
    [self initUserIconImgView];
    [self initUserNameLab];
    [self initMoneyBgView];
    [self initMoneyImgView];
    [self initMoneyLab];
    [self initHeadImgView];
    [self initZhuangWenLuGridView];
    [self initLongBaolBtn];
    [self initCancelBtn];
    [self initChipBgView];
    [self initSureBtn];
    [self initJunHaoView];
    [self initMaidFreeBtn];
    [self initVideoOptionsBtn];
    //[self initDisplayCardView];
    [self initData];
    [self initSwipeGesture];
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(notice:) name:@"BetsStar" object:nil];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLanguage) name:@"changeLanguage" object:nil];
}
-(void)updateLanguage{
    _titleLab.text=[HelperHandle getLanguage:@"百家乐"];
    if (_circleBgView.circle.progress==0) {
        _circleBgView.circle.progress=0;
    }
    [_tableLimitRedBtn setTitle:[HelperHandle getLanguage:@"桌台限红"] forState:UIControlStateNormal];
    if (_joinGameDic) {
        [self.tableLimitRedMenu setLabWithMinbetArr:_joinGameDic[@"minbet"] MaxbetArr:_joinGameDic[@"maxbet"]];
    }
    [_canCelBtn setTitle:[HelperHandle getLanguage:@"取消"] forState:UIControlStateNormal];
    [_videoOptionsBtn setTitle:[HelperHandle getLanguage:@"视频选项"] forState:UIControlStateNormal];
    if (!_isMaidFree) {
        [_maidFreeBtn setTitle:[HelperHandle getLanguage:@"非免佣"] forState:UIControlStateNormal];
    }else{
        [_maidFreeBtn setTitle:[HelperHandle getLanguage:@"免佣"] forState:UIControlStateNormal];
    }
    [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
    if (_isRepeat) {
        [_sureBtn setTitle:[HelperHandle getLanguage:@"重复"] forState:UIControlStateNormal];
    }
    _zhuang6DianImgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"nocomm_v2"]];
}
-(void)initSwipeGesture{
   UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizerRight];
    
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:recognizerLeft];
}
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (_isReachLong) {
            [_zhuangWenLuGridView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left).offset(self.leftF);
                make.top.equalTo(self.backBtn.mas_bottom).offset(30);
                make.height.mas_equalTo(6*bigW+30+30);
                make.width.mas_equalTo(4*bigW+18*smallW+30);
            }];
            _isReach=YES;
            _isReachLong=NO;
            [_zhuangWenLuGridView updateGridView:GridTypeShort];
        }else if (_isReach) {
            [_zhuangWenLuGridView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left).offset(-4*bigW-18*smallW-self.leftF);
                make.top.equalTo(self.backBtn.mas_bottom).offset(30);
                make.height.mas_equalTo(6*bigW+30+30);
                make.width.mas_equalTo(4*bigW+18*smallW+30);
            }];
            _isReach=NO;
        }
        
        NSLog(@"swipe left");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        if(!_isReach){
            [_zhuangWenLuGridView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left).offset(self.leftF);
                make.top.equalTo(self.backBtn.mas_bottom).offset(30);
                make.height.mas_equalTo(6*bigW+30+30);
                make.width.mas_equalTo(4*bigW+18*smallW+30);
            }];
            _isReach=YES;
            _isReachLong=NO;
        }else if (_isReach) {
            [_zhuangWenLuGridView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left).offset(self.leftF);
                make.top.equalTo(self.backBtn.mas_bottom).offset(30);
                make.height.mas_equalTo(6*bigW+30+30);
                make.width.mas_equalTo(11*bigW+17*2*smallW+30);
            }];
            _isReachLong=YES;
            [_zhuangWenLuGridView updateGridView:GridTypeLong];
        }
        
        NSLog(@"swipe right");
    }
}
-(void)notice:(NSNotification *)niti{
    //@{@"BetNum":[NSNumber numberWithInteger:sum+_betsNum]}
    //NSDictionary *dic=niti.userInfo;
    //NSInteger num=[dic[@"BetNum"] integerValue];
    
    
    _canCelBtn.backgroundColor=[UIColor colorWithRed:253/255.0 green:131/255.0 blue:44/255.0 alpha:1];
    _sureBtn.backgroundColor=[UIColor colorWithRed:253/255.0 green:131/255.0 blue:44/255.0 alpha:1];
    [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
    _isRepeat=NO;
    _canCelBtn.enabled=YES;
    _sureBtn.enabled=YES;
    [_sureBtn addTarget:self action:@selector(sureBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_canCelBtn addTarget:self action:@selector(canCelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark-确定下注
-(void)sureBtnAction:(UIButton *)btn{
    
   
    _canCelBtn.enabled=NO;
    _sureBtn.enabled=NO;
    _canCelBtn.backgroundColor=[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    _sureBtn.backgroundColor=[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    
    NSInteger xianNum=_junHaoView.betsXianNum;
    NSInteger zhuangNum=_junHaoView.betsZhuangNum;
    NSInteger heNum=_junHaoView.betsHeNum;
     NSInteger xianDuiNum=_junHaoView.betsXianDuiNum;
    NSInteger zhuangDuiNum=_junHaoView.betsZhuangDuiNum;
    
    NSString *nstr;
    nstr=[NSString stringWithFormat:@"{'bets':[%ld,%ld,%ld,%ld,%ld],'freeCommission':%d}",xianNum,zhuangNum,heNum,xianDuiNum,zhuangDuiNum,_isMaidFree];
    if (_isRepeat) {
        _isRepeat=NO;
        NSArray *data=_betscoreDic[@"data"];
         nstr=[NSString stringWithFormat:@"{'bets':[%ld,%ld,%ld,%ld,%ld],'freeCommission':%d}",[data[0] integerValue],[data[1] integerValue],[data[2] integerValue],[data[3] integerValue],[data[4] integerValue],_isMaidFree];
        
        [self.junHaoView betResultWithArr:data];
    }
    [self.clientSocket emit:@"dobet" with:@[nstr]];//发送下注消息
    _junHaoView.betSum=0;
    [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
    //[_junHaoView returnToZeroBets];
    
}
#pragma mark-取消下注
-(void)canCelBtnAction:(UIButton *)btn{
    [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
    _isRepeat=NO;
    _junHaoView.betSum=0;
    
    _canCelBtn.enabled=NO;
    _sureBtn.enabled=NO;
    _canCelBtn.backgroundColor=[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    _sureBtn.backgroundColor=[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    [_junHaoView returnToZeroBets];
}
-(void)initGameMusicPalyer{
    _gameMusicPlayer=[[GameMusicPalyer alloc] init];
    NSString *url=[[NSBundle mainBundle] pathForResource:[HelperHandle getLanguage:@"1_欢迎光临百家乐游戏zh"] ofType:@"mp3"];
    _gameMusicPlayer.mp3url=url;
    [_gameMusicPlayer playBlcok:^{
        
    }];
}
-(void)palyMp3:(NSString *)mp3{
    NSString *url=[[NSBundle mainBundle] pathForResource:[HelperHandle getLanguage:mp3] ofType:@"mp3"];
    _gameMusicPlayer.mp3url=url;
    [_gameMusicPlayer playBlcok:^{
        
    }];
}
-(void)palyMp3:(NSString *)mp3 Block:(GameBlock)block{
    NSString *url=[[NSBundle mainBundle] pathForResource:[HelperHandle getLanguage:mp3] ofType:@"mp3"];
    _gameMusicPlayer.mp3url=url;
    [_gameMusicPlayer playBlcok:^{
        block();
    }];
}
-(void)initData{
    NSString *urlStr=[NSString stringWithFormat:@"%@:9082",kIPAdree];
    NSURL *url = [NSURL URLWithString:urlStr];
    _clientSocket = [[SocketIOClient alloc]initWithSocketURL:url
                                                      config:@{@"log": @YES, @"forcePolling": @YES}];
    
    
    //    // 2.连接服务器
    [self.clientSocket connect];
    [self.clientSocket on:@"connect" callback:^(NSArray * array, SocketAckEmitter * emitter) {
        NSLog(@"connect success");
        NSString *nstr;
        nstr=[NSString stringWithFormat:@"{'token':'%@','room':'%@'}",[LoginUserInfo share].token,self.room];
        [self.clientSocket emit:@"joinroom" with:@[nstr]];
    }];
    [self.clientSocket on:@"disconnect" callback:^(NSArray * arr, SocketAckEmitter * emitter) {
        NSLog(@"disconnect");
        NSString *nstr;
        nstr=[NSString stringWithFormat:@"{'token':'%@','room':'%@'}",[LoginUserInfo share].token,self.room];
        [self.clientSocket emit:@"joinroom" with:@[nstr]];
    }];
    [self.clientSocket on:@"command" callback:^(NSArray * array, SocketAckEmitter * emitter) {
        NSLog(@"connect success");
        NSString *json=[self jsonWithArr:array];
        if (array.count>0) {
            NSDictionary *dic=array.firstObject;
            NSString *command=dic[@"command"];
            if ([command isEqualToString:@"joinroom"]) {
                self.joinGameDic=dic;
                self.gridData=dic[@"boardMessages"];
                [self setGrid];
                self.circleBgView.title=[HelperHandle getLanguage:@"结算中"];
                self.circleBgView.progress=[dic[@"second"] integerValue];
                [self.tableLimitRedMenu setLabWithMinbetArr:dic[@"minbet"] MaxbetArr:dic[@"maxbet"]];
                self.junHaoView.betLimitDic=dic;
               [self nowState:dic[@"state"] and:[dic[@"second"] integerValue]];
                //playCard
                if ([dic[@"state"] isEqualToString:@"RESULT"]) {
                    NSArray *parr=dic[@"playCard"];
                    for (int i=0; i<parr.count; i++) {
                        NSString *card=parr[i];
                        NSInteger num=0;
                        if (i==0) {
                            num=1;
                        }else if (i==1) {
                            num=3;
                        }if (i==2) {
                            num=5;
                        }
                        NSString *poc=[NSString stringWithFormat:@"0%ld",num];
                        [self switch_resultCard:card Pos:poc];
                    }
                    //bankCar
                    NSArray *barr=dic[@"bankCard"];
                    for (int i=0; i<barr.count; i++) {
                        NSString *card=barr[i];
                        NSInteger num=0;
                        if (i==0) {
                            num=2;
                        }else if (i==1) {
                            num=4;
                        }if (i==2) {
                            num=6;
                        }
                        NSString *poc=[NSString stringWithFormat:@"0%ld",num];
                        [self switch_resultCard:card Pos:poc];
                    }
                }
            }else if([command isEqualToString:@"result"]) {
                self.resultDic=dic;

                
                [self resualtWithWin:[dic[@"win"] integerValue]];
                [self liquidationesults:[dic[@"win"] integerValue]];
                NSLog(@"结果");
            }else if([command isEqualToString:@"betrecord"]) {
                self.betrecordDic=dic;
                [self betrecordScore:dic[@"score"] BetPeople:dic[@"betPeople"]];
                NSLog(@"下注数据");
            }else if([command isEqualToString:@"fillcard"]) {
                self.fillcardDic=dic;
                [self fillcardPoc:dic[@"poc"]];
            }else if([command isEqualToString:@"liquidation"]) {
                self.liquidation=dic;
                [self liquidationesults:[dic[@"ratio"] integerValue]];
                NSLog(@"清算阶段结果");
                NSInteger goldcoins=[LoginUserInfo share].userModel.goldcoins;
                NSInteger balance=[dic[@"balance"] integerValue];
                if (goldcoins<balance) {
                    [self showTipWithText:[NSString stringWithFormat:@"%@%ld",[HelperHandle getLanguage:@"您赢了："],balance-goldcoins]];
                }else{
                    [self showTipWithText:[NSString stringWithFormat:@"%@%ld",[HelperHandle getLanguage:@"您输了："],goldcoins-balance]];
                }
                
                self.moneyLab.text=[NSString stringWithFormat:@"%ld",[dic[@"balance"] integerValue]];
                [LoginUserInfo share].userModel.goldcoins=[dic[@"balance"] integerValue];
                self.isBeting=NO;//本局结束
            }else if([command isEqualToString:@"result"]) {
                
            }else if([command isEqualToString:@"state"]) {
                self.stateDic=dic;
                [self nowState:dic[@"state"] and:[dic[@"second"] integerValue]];
                NSLog(@"");
            }else if([command isEqualToString:@"switch_result"]) {
                self.switch_resultDic=dic;
                [self switch_resultCard:dic[@"card"] Pos:dic[@"pos"]];
            }else if([command isEqualToString:@"dobet"]) {
                self.dobetDic=dic;
                self.moneyLab.text=[NSString stringWithFormat:@"%ld",[self.moneyLab.text integerValue]-[dic[@"addBet"] integerValue]];
                [self showTipWithText:@"下注成功"];
                self.isBeting=YES;
                [self.junHaoView returnToZeroBetNum];
            }
            else if([command isEqualToString:@"nobet"]) {
                self.nobetDic=dic;
                [self showTipWithText:@"下注失败"];
                self.isBeting=NO;
                [self.junHaoView betFailToBets];
            }else if([command isEqualToString:@"betscore"]) {//本局下注数据
                self.betscoreDic=dic;
                [self canCelBtnAction:nil];
                [self.junHaoView betResultWithArr:dic[@"data"]];
            }
            
        }
        
        NSLog(@"%@",json);
         
    }];
}
-(void)betrecordScore:(NSArray *)score BetPeople:(NSArray *)betPeople{
    _junHaoView.lab5.text=[NSString stringWithFormat:@"%ld/%ld",[score[0] integerValue],[betPeople[0] integerValue]];
    _junHaoView.lab7.text=[NSString stringWithFormat:@"%ld/%ld",[score[1] integerValue],[betPeople[1] integerValue]];
    _junHaoView.lab6.text=[NSString stringWithFormat:@"%ld/%ld",[score[2] integerValue],[betPeople[2] integerValue]];
    _junHaoView.lab2.text=[NSString stringWithFormat:@"%ld/%ld",[score[3] integerValue],[betPeople[3] integerValue]];
    _junHaoView.lab3.text=[NSString stringWithFormat:@"%ld/%ld",[score[4] integerValue],[betPeople[4] integerValue]];
}
-(void)resualtWithWin:(NSInteger)win{
    __weak __typeof(self)weakSelf = self;
    switch (win) {
        case 0:{
            [self zhuangWinWithNum:_zhuangNum Block:^{
                [weakSelf xianWinWithNum:weakSelf.xianNum Block:^{
                    [self palyMp3:@"5庄赢zh"];
                }];
            }];
            [_dispalayCardView hidenRightYellowView:NO];
        }
            break;
        case 1:{
            [self zhuangWinWithNum:_zhuangNum Block:^{
                [weakSelf xianWinWithNum:weakSelf.xianNum Block:^{
                     [self palyMp3:@"6闲赢zh"];
                }];
            }];
            [_dispalayCardView hidenLeftYellowView:NO];
        }
            break;
        case 2:
            [self palyMp3:@"7和局zh"];
            break;
        case 3:
            [self palyMp3:@"8庄赢庄对zh"];
            [_dispalayCardView hidenRightYellowView:NO];
            break;
        case 4:
            [self palyMp3:@"9庄赢闲对zh"];
            [_dispalayCardView hidenRightYellowView:NO];
            break;
        case 5:
            [self palyMp3:@"10_庄赢庄对闲对zh"];
            [_dispalayCardView hidenRightYellowView:NO];
            break;
        case 6:
            [self palyMp3:@"11闲赢庄对zh"];
             [_dispalayCardView hidenLeftYellowView:NO];
            break;
        case 7:
            [self palyMp3:@"12闲赢闲对zh"];
             [_dispalayCardView hidenLeftYellowView:NO];
            break;
        case 8:
            [self palyMp3:@"13闲赢庄对闲对zh"];
             [_dispalayCardView hidenLeftYellowView:NO];
            break;
        case 9:
            [self palyMp3:@"14和局庄对zh"];
            break;
        case 10:
            [self palyMp3:@"15和局闲对zh"];
            break;
        case 11:
            [self palyMp3:@"16和局庄对闲对zh"];
            break;
        default:
            break;
    }
}
-(void)zhuangWinWithNum:(NSInteger)num Block:(GameBlock)block{
    switch (num%10) {
        case 0:
            [self palyMp3:@"26庄0点zh" Block:block];
            break;
        case 1:
            [self palyMp3:@"17庄1点zh" Block:block];
            break;
        case 2:
            [self palyMp3:@"18庄2点zh" Block:block];
            break;
        case 3:
            [self palyMp3:@"19庄3点zh" Block:block];
            break;
        case 4:
            [self palyMp3:@"20庄4点zh" Block:block];
            break;
        case 5:
            [self palyMp3:@"21庄5点zh" Block:block];
            break;
        case 6:
            [self palyMp3:@"22庄6点zh" Block:block];
            break;
        case 7:
            [self palyMp3:@"23庄7点zh" Block:block];
            break;
        case 8:
            [self palyMp3:@"24庄8点zh" Block:block];
            break;
        case 9:
            [self palyMp3:@"25庄9点zh" Block:block];
            break;
        default:
            break;
    }
}
-(void)xianWinWithNum:(NSInteger)num Block:(GameBlock)block{
    switch (num%10) {
        case 0:
            [self palyMp3:@"36闲0点zh" Block:block];
            break;
        case 1:
            [self palyMp3:@"27闲1点zh" Block:block];
            break;
        case 2:
            [self palyMp3:@"28闲2点zh" Block:block];
            break;
        case 3:
            [self palyMp3:@"29闲3点zh" Block:block];
            break;
        case 4:
            [self palyMp3:@"30闲4点zh" Block:block];
            break;
        case 5:
            [self palyMp3:@"31闲5点zh" Block:block];
            break;
        case 6:
            [self palyMp3:@"32闲6点zh" Block:block];
            break;
        case 7:
            [self palyMp3:@"33闲7点zh" Block:block];
            break;
        case 8:
            [self palyMp3:@"34闲8点zh" Block:block];
            break;
        case 9:
            [self palyMp3:@"35闲9点zh" Block:block];
            break;
        default:
            break;
    }
}
-(void)liquidationesults:(NSInteger)num{
    //谁赢了 0庄 1闲 2和 3庄赢 庄对 4 庄赢 闲对 5 庄赢 庄对闲对 6闲赢 庄对 7闲赢 闲对 8闲赢 庄对闲对 9和赢 庄对 10和赢 闲对 11和赢 庄对闲对
    if (num==0) {
        [self showTipWithText:@"庄赢"];
    }else if (num==1) {
        [self showTipWithText:@"闲赢"];
    }else if (num==2) {
        [self showTipWithText:@"和"];
    }else if (num==3) {
        [self showTipWithText:@"庄赢 庄对"];
    }else if (num==4) {
        [self showTipWithText:@"庄赢 闲对"];
    }else if (num==5) {
        [self showTipWithText:@"庄赢 庄对闲对"];
    }else if (num==6) {
        [self showTipWithText:@"闲赢 庄对"];
    }else if (num==7) {
        [self showTipWithText:@"闲赢 闲对"];
    }else if (num==8) {
        [self showTipWithText:@"闲赢 庄对闲对"];
    }else if (num==9) {
        [self showTipWithText:@"和赢 庄对"];
    }else if (num==10) {
        [self showTipWithText:@"和赢 闲对"];
    }else if (num==11) {
        [self showTipWithText:@"和赢 庄对闲对"];
    }
}
-(void)switch_resultCard:(NSString *)card Pos:(NSString *)pos{
    NSLog(@"发牌：card:%@,位置: %@",card,pos);
   [self initDisplayCardView];
    NSString *huse=[card substringWithRange:NSMakeRange(0, 1)];
    NSString *kcard;
    if (card.length==3) {
        kcard=[card substringWithRange:NSMakeRange(1, 2)];
    }else{
        kcard=[card substringWithRange:NSMakeRange(1, 1)];
        if ([kcard isEqualToString:@"a"]) {
            kcard=@"10";
        }else if ([kcard isEqualToString:@"b"]) {
            kcard=@"11";
        }else if ([kcard isEqualToString:@"c"]) {
            kcard=@"12";
        }
        else if ([kcard isEqualToString:@"d"]) {
            kcard=@"13";
        }
    }
    NSString *nowCardStr=[NSString stringWithFormat:@"card_%@_%@",kcard,huse];
    
    if ([pos isEqualToString:@"01"]) {
        if ([kcard integerValue]<10) {
            _xianNum+=[kcard integerValue];
            _dispalayCardView.num1Lab.text=[NSString stringWithFormat:@"%ld",_xianNum%10];
        }
        _dispalayCardView.cardLeft1.image=[UIImage imageNamed:nowCardStr];
        
    }else if ([pos isEqualToString:@"03"]) {
        if ([kcard integerValue]<10) {
            _xianNum+=[kcard integerValue];
            _dispalayCardView.num1Lab.text=[NSString stringWithFormat:@"%ld",_xianNum%10];
        }
         _dispalayCardView.cardLeft2.image=[UIImage imageNamed:nowCardStr];
        
    }else if ([pos isEqualToString:@"05"]) {
        if ([kcard integerValue]<10) {
            _xianNum+=[kcard integerValue];
            _dispalayCardView.num1Lab.text=[NSString stringWithFormat:@"%ld",_xianNum%10];
        }
        _dispalayCardView.cardLeft3.image=[UIImage imageNamed:nowCardStr];
        [self palyMp3:@"95闲博牌zh"];
        
    }else if ([pos isEqualToString:@"02"]) {
        if ([kcard integerValue]<10) {
            _zhuangNum+=[kcard integerValue];
            _dispalayCardView.num2Lab.text=[NSString stringWithFormat:@"%ld",_zhuangNum%10];
        }
         _dispalayCardView.cardRight1.image=[UIImage imageNamed:nowCardStr];
        
    }else if ([pos isEqualToString:@"04"]) {
        if ([kcard integerValue]<10) {
            _zhuangNum+=[kcard integerValue];
            _dispalayCardView.num2Lab.text=[NSString stringWithFormat:@"%ld",_zhuangNum%10];
        }
        _dispalayCardView.cardRight2.image=[UIImage imageNamed:nowCardStr];
        
    }else if ([pos isEqualToString:@"06"]) {
        if ([kcard integerValue]<10) {
            _zhuangNum+=[kcard integerValue];
            _dispalayCardView.num2Lab.text=[NSString stringWithFormat:@"%ld",_zhuangNum%10];
        }
         _dispalayCardView.cardRight3.image=[UIImage imageNamed:nowCardStr];
        [self palyMp3:@"94庄博牌zh"];
    }

}
-(void)fillcardPoc:(NSString *)pos{
    if ([pos isEqualToString:@"01"]) {
        NSLog(@"01闲家补牌");
       [self initDisplayCardView];
    }else if ([pos isEqualToString:@"02"]) {
         NSLog(@"02庄家补牌");
        [self initDisplayCardView];
    }
}
-(void)nowState:(NSString *)state and:(NSInteger)second{
    if ([state isEqualToString:@"BET"]) {
        NSLog(@"下注阶段");
      
        _circleBgView.circle.progress=20;
        _circleBgView.circle.title=[HelperHandle getLanguage:@"结算中"];
        _maidFreeBtn.enabled=YES;
        [_dispalayCardView hidenLeftYellowView:YES];
        [_dispalayCardView hidenRightYellowView:YES];
        [self palyMp3:@"2已开局请下注zh"];
        [self showTipWithText:@"下注阶段"];
        [_junHaoView returnToZeroBets];
        [self removeDisPlayCard];
        NSArray *betArr=_betscoreDic[@"data"];
        if (betArr) {
            BOOL b=NO;
            for (NSNumber *num in betArr) {
                if ([num integerValue]>0) {
                    b=YES;
                }
            }
            if (b) {
                _isRepeat=YES;
                [_sureBtn setTitle:[HelperHandle getLanguage:@"重复"] forState:UIControlStateNormal];
                _sureBtn.backgroundColor=[UIColor colorWithRed:253/255.0 green:131/255.0 blue:44/255.0 alpha:1];
                _canCelBtn.backgroundColor=[UIColor colorWithRed:253/255.0 green:131/255.0 blue:44/255.0 alpha:1];
                _sureBtn.enabled=YES;
                _canCelBtn.enabled=YES;
            }else{
                _isRepeat=NO;
            }
        }
    }else if ([state isEqualToString:@"RESULT"]) {
        NSLog(@"开牌阶段");
//        _canCelBtn.enabled=NO;
//        _sureBtn.enabled=NO;
        _maidFreeBtn.enabled=NO;
        [self palyMp3:@"4.停止下注zh"];
        [self showTipWithText:@"开牌阶段"];
        [self initDisplayCardView];
    }else if ([state isEqualToString:@"OVER"]) {
        NSLog(@"清算阶段");
        
         [self showTipWithText:@"清算阶段"];
        
    }else if ([state isEqualToString:@"WAITTING"]) {
        NSLog(@"同步识别");
     
    }else if ([state isEqualToString:@"CREATED"]) {
        NSLog(@"重开一局");
        
    }else if ([state isEqualToString:@"SYNCHRONIZATION"]) {
        NSLog(@"重开一局");
        
    }
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
-(NSString *)jsonWithArr:(NSArray *)arr{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr
                                                       options:kNilOptions
                                                         error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    
    return jsonString;
}
- (void)initBackBtn{
    _backBtn=[[UIButton alloc] init];
    [_backBtn setImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.height.mas_equalTo(37.5);;
        make.width.mas_equalTo(25);
    }];
}
- (void)backBtnAction:(UIButton *)btn{
    if (!_isBeting) {
        [_palyerView StopPlayer];
        [_palyerView UnInitPlayer];
        _palyerView=nil;
        [_clientSocket disconnect];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else{
        [self showTipWithText:@"本局已下注,派彩之后才能离开"];
    }
   
}
-(void)initPlayerView{
    PlayerView *palyerView=[[PlayerView alloc] init];
    _palyerView=palyerView;
    NSString *url;
    url=@"rtmp://119.188.246.219/live/room101a";
    if ([_room isEqualToString:@"10000000000000001"]) {
        url=@"rtmp://119.188.246.219/live/room101a";
    }else if([self.room isEqualToString:@"10000000000000002"]) {
        url=@"rtmp://119.188.246.219/live/room102a";
    }else if([self.room isEqualToString:@"10000000000000003"]) {
        url=@"rtmp://119.188.246.219/live/room103a";
    }else if([self.room isEqualToString:@"10000000000000004"]) {
        url=@"rtmp://119.188.246.219/live/room104a";
    }else{
        url=@"rtmp://119.188.246.219/live/room104b";
    }
    _palyerView.playback_url_=url;
    palyerView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bacvideo_loading"]];
    [self.view addSubview:palyerView];
  
    [palyerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    [_palyerView InitPlayer];
    [_palyerView StartPlayer];
}

-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"百家乐"];
    _titleLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    [self.view addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backBtn.mas_right).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.backBtn.mas_centerY).offset(0);
    }];
}
- (void)initCircleBgView{
    _circleBgView=[[CircleBgView alloc] init];
    _circleBgView.width=50;
    _circleBgView.title=[HelperHandle getLanguage:@"结算中"];
    _circleBgView.progress=0;
    [self.view addSubview:_circleBgView];
    [_circleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(0);
        make.centerY.equalTo(self.backBtn.mas_centerY).offset(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
}
- (void)initTableLimitRedBtn{
    _tableLimitRedBtn=[[UIButton alloc] init];
    [_tableLimitRedBtn setTitle:[HelperHandle getLanguage:@"桌台限红"] forState:UIControlStateNormal];
    _tableLimitRedBtn.backgroundColor=[UIColor colorWithRed:104/255.0 green:69/255.0 blue:42/255.0 alpha:1];
    [_tableLimitRedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_tableLimitRedBtn addTarget:self action:@selector(tableLimitRedBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tableLimitRedBtn];
    [_tableLimitRedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.circleBgView.mas_right).offset(10);
        make.centerY.equalTo(self.backBtn.mas_centerY).offset(0);
        make.width.mas_equalTo(100);;
        make.height.mas_equalTo(30);
    }];
}
-(void)initTableLimitRedMenu{
    if (_tableLimitRedMenu==nil) {
        _tableLimitRedMenu=[[TableLimitRedMenu alloc] init];
    }
}
-(void)tableLimitRedBtnAction:(UIButton *)btn{
    
        if (_isOpen) {
            [_tableLimitRedMenu removeFromSuperview];
            _isOpen=NO;
        }else{
            [self.view addSubview:_tableLimitRedMenu];
            [_tableLimitRedMenu mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.tableLimitRedBtn.mas_bottom).offset(0);
                make.centerX.equalTo(self.tableLimitRedBtn.mas_centerX).offset(50/2.0);
                make.width.mas_equalTo(150);
                make.height.mas_equalTo(140);
            }];
            _isOpen=YES;
        }
    
}
- (void)initMenuBtn{
    _menuBtn=[[UIButton alloc] init];
    [_menuBtn setImage:[UIImage imageNamed:@"menu_pressed"] forState:UIControlStateNormal];
    [_menuBtn addTarget:self action:@selector(menuBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_menuBtn];
    [_menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.centerY.equalTo(self.tableLimitRedBtn.mas_centerY).offset(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(30);
    }];
}
-(void)menuBtnAction:(UIButton*)btn{
    if (_settingMenuView==nil) {
        _settingMenuView=[[SettingMenuView alloc] init];
    }
    _settingMenuView.vc=self;
    [self.view addSubview:_settingMenuView];
    [_settingMenuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
    }];
    
}

- (void)initUserNameBgImgView{
    _userNameBgImgView=[[UIImageView alloc] init];
    _userNameBgImgView.image=[UIImage imageNamed:@"common_btn"];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_userNameBgImgView addGestureRecognizer:tapGesture];
    _userNameBgImgView.userInteractionEnabled=YES;
    [self.view addSubview:_userNameBgImgView];
    [_userNameBgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.menuBtn.mas_left).offset(-30);
        make.top.equalTo(self.view.mas_top).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(120);
    }];
}
- (void)initUserIconImgView{
    _userIconImgView=[[UIImageView alloc] init];
    _userIconImgView.image=[UIImage imageNamed:@"ac_icon"];
    [self.userNameBgImgView addSubview:_userIconImgView];
    [_userIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameBgImgView.mas_left).offset(5);
        make.top.equalTo(self.userNameBgImgView.mas_top).offset(2);
        make.bottom.equalTo(self.userNameBgImgView.mas_bottom).offset(-2);
        make.width.mas_equalTo(20);
    }];
}
- (void)initUserNameLab{
    _userNameLab=[[UILabel alloc] init];
    _userNameLab.text=[LoginUserInfo share].userModel.username;
    _userNameLab.textColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    _userNameLab.font=[UIFont systemFontOfSize:12];
    [self.userNameBgImgView addSubview:_userNameLab];
    [_userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userIconImgView.mas_right).offset(2);
        make.top.equalTo(self.userNameBgImgView.mas_top).offset(2);
        make.bottom.equalTo(self.userNameBgImgView.mas_bottom).offset(-2);
        make.right.equalTo(self.userNameBgImgView.mas_right).offset(-2);
    }];
}
- (void)initMoneyBgView{
    _moneyBgView=[[UIView alloc] init];
    _moneyBgView.backgroundColor=[UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_moneyBgView addGestureRecognizer:tapGesture];
    _moneyBgView.userInteractionEnabled=YES;
    [self.view addSubview:_moneyBgView];
    
    [_moneyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.userNameBgImgView.mas_centerX).offset(0);
        make.top.equalTo(self.userNameBgImgView.mas_bottom).offset(2);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(20);
    }];
}
- (void)initMoneyImgView{
    _moneyImgView=[[UIImageView alloc] init];
    _moneyImgView.image=[UIImage imageNamed:@"balance_icon"];
    
    [self.moneyBgView addSubview:_moneyImgView];
    [_moneyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyBgView.mas_left).offset(5);
        make.top.equalTo(self.moneyBgView.mas_top).offset(0);
        make.width.mas_equalTo(20);
        make.bottom.equalTo(self.moneyBgView.mas_bottom).offset(0);
    }];
}
- (void)initMoneyLab{
    _moneyLab=[[UILabel alloc] init];
    _moneyLab.text=[NSString stringWithFormat:@"%ld",[LoginUserInfo share].userModel.goldcoins];
    _moneyLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
    _moneyLab.font=[UIFont systemFontOfSize:12];
    [self.moneyBgView addSubview:_moneyLab];
    [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyImgView.mas_right).offset(5);
        make.top.equalTo(self.moneyBgView.mas_top).offset(5);
        make.bottom.equalTo(self.moneyBgView.mas_bottom).offset(-5);
        make.right.equalTo(self.moneyBgView.mas_right).offset(-5);
    }];
}
- (void)initHeadImgView{
    _headImgView=[[UIImageView alloc] init];
    _headImgView.image=[UIImage imageNamed:@"headerImg"];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToUserInfoVC)];
    //点击次数（默认1）
    
    tapGesture.numberOfTapsRequired = 1;
    
    //手指的个数（默认1）
    
    tapGesture.numberOfTouchesRequired = 1;
    //3.把手势与视图相关联
    
    [_headImgView addGestureRecognizer:tapGesture];
    _headImgView.userInteractionEnabled=YES;
    [self.view addSubview:_headImgView];
    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.userNameBgImgView.mas_left).offset(-5);
        make.centerY.equalTo(self.menuBtn.mas_centerY).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(0);
    }];
}
-(void)pushToUserInfoVC{
    UserInfoVC *userInfoVC=[[UserInfoVC alloc] init];
    [self presentViewController:userInfoVC animated:YES completion:^{
        
    }];
}
- (void)initZhuangWenLuGridView{
    _zhuangWenLuGridView=[[ZhuangWenLuGridView alloc] init];
    //_zhuangWenLuGridView.backgroundColor=[UIColor whiteColor];
    _zhuangWenLuGridView.delegate=self;
    [self.view addSubview:_zhuangWenLuGridView];
    [_zhuangWenLuGridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(self.leftF);
        make.top.equalTo(self.backBtn.mas_bottom).offset(30);
        make.height.mas_equalTo(6*bigW+30+30);
        make.width.mas_equalTo(4*bigW+18*smallW+30);
    }];
    
    [self setGrid];
    _isReach=YES;
}
-(void)setGrid{
    [self.zhuangWenLuGridView updateGridAll:_gridData];
}
-(void)ZhuangWenLuGridViewDelegateBackAction{
    if(!_isReach){
        [_zhuangWenLuGridView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(self.leftF);
            make.top.equalTo(self.backBtn.mas_bottom).offset(30);
            make.height.mas_equalTo(6*bigW+30+30);
            make.width.mas_equalTo(4*bigW+18*smallW+30);
        }];
        _isReach=YES;
        _isReachLong=NO;
    }else if (_isReachLong) {
        [_zhuangWenLuGridView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(self.leftF);
            make.top.equalTo(self.backBtn.mas_bottom).offset(30);
            make.height.mas_equalTo(6*bigW+30+30);
            make.width.mas_equalTo(4*bigW+18*smallW+30);
        }];
        _isReachLong=NO;
        [_zhuangWenLuGridView updateGridView:GridTypeShort];
    }else if (_isReach) {
        [_zhuangWenLuGridView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(-4*bigW-18*smallW-self.leftF);
            make.top.equalTo(self.backBtn.mas_bottom).offset(30);
            make.height.mas_equalTo(6*bigW+30+30);
            make.width.mas_equalTo(4*bigW+18*smallW+30);
        }];
        _isReach=NO;
    }
}
-(void)initLongBaolBtn{
    _longBaoBtn=[[UIButton alloc] init];
    //[_longBaoBtn setTitle:[HelperHandle getLanguage:@"龙宝"] forState:UIControlStateNormal];
    [_longBaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_longBaoBtn setBackgroundImage:[UIImage imageNamed:@"dragonbonus_btn_pressed"] forState:UIControlStateNormal];
    _longBaoBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _longBaoBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_longBaoBtn addTarget:self action:@selector(longBaoBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_longBaoBtn];
    [_longBaoBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        //make.height.mas_equalTo(30);
        make.height.mas_equalTo(0);
        make.width.mas_equalTo(80);
    }];
}
-(void)longBaoBtnAction:(UIButton *)btn{
    
}
-(void)initCancelBtn{
    _canCelBtn=[[UIButton alloc] init];
    _canCelBtn.enabled=NO;
    
    [self.view addSubview:_canCelBtn];
    _canCelBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [_canCelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _canCelBtn.backgroundColor=[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    [_canCelBtn setImage:[UIImage imageNamed:@"icon_bet_cancel"] forState:UIControlStateNormal];
    //_canCelBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_canCelBtn setTitle:[HelperHandle getLanguage:@"取消"] forState:UIControlStateNormal];
    _canCelBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    _canCelBtn.imageEdgeInsets=UIEdgeInsetsMake(5, 10, 5, 50);
    [_canCelBtn addTarget:self action:@selector(canCelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_canCelBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.bottom.equalTo(self.longBaoBtn.mas_top).offset(-10);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(80);
    }];
}

- (void)initJunHaoView{
    _junHaoView=[[JunHaoView alloc] init];
    _junHaoView.backgroundColor=[UIColor clearColor];
    [self.view insertSubview:_junHaoView atIndex:1];
    [_junHaoView mas_updateConstraints:^(MASConstraintMaker *make) {
        //make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.right.equalTo(self.sureBtn.mas_left).offset(-10);
        make.left.equalTo(self.canCelBtn.mas_right).offset(10);
        make.height.mas_equalTo(self.view.mas_height).multipliedBy(1/3.0);
        //make.width.mas_equalTo(350);
    }];
}
-(void)initZhuang6DianImgView:(BOOL)b{
    if (_zhuang6DianImgView==nil) {
        UIImageView *zhuang6DianImgView=[[UIImageView alloc] init];
        zhuang6DianImgView.image=[UIImage imageNamed:[HelperHandle getLanguage:@"nocomm_v2"]];
        _zhuang6DianImgView=zhuang6DianImgView;
    }
    if (b) {
        [self.view insertSubview:_zhuang6DianImgView atIndex:1];
        [_zhuang6DianImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.junHaoView.mas_top).offset(0);
            make.right.equalTo(self.junHaoView.mas_right).offset(-15);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(20);
            
        }];
    }else{
        [_zhuang6DianImgView removeFromSuperview];
    }
    
}
-(void)initChipBgView{
    _chipBgView=[[ChipBgView alloc] init];
    [self.view insertSubview:_chipBgView atIndex:1];
    [_chipBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.width.mas_equalTo(70);
    }];
}
-(void)initSureBtn{
    _sureBtn=[[UIButton alloc] init];
    _sureBtn.enabled=NO;
    _sureBtn.titleLabel.font=[UIFont systemFontOfSize:10];
    _sureBtn.titleLabel.numberOfLines = 2;
    _sureBtn.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_sureBtn setTitle:[HelperHandle getLanguage:@"确定"] forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureBtn setImage:[UIImage imageNamed:@"icon_bet_confirm"] forState:UIControlStateNormal];
    _sureBtn.backgroundColor=[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    _sureBtn.imageEdgeInsets=UIEdgeInsetsMake(5, 10, 5, 50);
    _sureBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -30, 0, 0);
    _sureBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:_sureBtn];
    [_sureBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.right.equalTo(self.chipBgView.mas_left).offset(-10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
}
#pragma mark-是否免佣
-(void)initMaidFreeBtn{
    _maidFreeBtn=[[UIButton alloc] init];
    _maidFreeBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    _maidFreeBtn.titleLabel.font=[UIFont systemFontOfSize:10];
    _maidFreeBtn.titleLabel.numberOfLines = 2;
     //_maidFreeBtn.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_maidFreeBtn setBackgroundImage:[UIImage imageNamed:@"commission_off"] forState:UIControlStateNormal];
    [_maidFreeBtn setTitle:[HelperHandle getLanguage:@"非免佣"] forState:UIControlStateNormal];
    [_maidFreeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _maidFreeBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    _maidFreeBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 30, 0, 0);
    [_maidFreeBtn addTarget:self action:@selector(maidFreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_maidFreeBtn];
    [_maidFreeBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.sureBtn.mas_top).offset(-10);
        make.right.equalTo(self.chipBgView.mas_left).offset(-10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
}
-(void)maidFreeBtnAction:(UIButton *)btn{
    if (_isMaidFree) {
        _isMaidFree=NO;
        _junHaoView.isMaidFree=_isMaidFree;
        [_maidFreeBtn setBackgroundImage:[UIImage imageNamed:@"commission_off"] forState:UIControlStateNormal];
        [_maidFreeBtn setTitle:[HelperHandle getLanguage:@"非免佣"] forState:UIControlStateNormal];
        _maidFreeBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 30, 0, 0);
        [_junHaoView.zhuangImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"banker_1_0_95_v2"]] forState:UIControlStateNormal];
        [self initZhuang6DianImgView:NO];
    }else{
        _isMaidFree=YES;
        _junHaoView.isMaidFree=_isMaidFree;
        [_maidFreeBtn setBackgroundImage:[UIImage imageNamed:@"commission_on"] forState:UIControlStateNormal];
        [_maidFreeBtn setTitle:[HelperHandle getLanguage:@"免佣"] forState:UIControlStateNormal];
        _maidFreeBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 30);
         [_junHaoView.zhuangImgView setImage:[UIImage imageNamed:[HelperHandle getLanguage:@"banker_1_1_v2"]] forState:UIControlStateNormal];
        [self initZhuang6DianImgView:YES];
    }
}
-(void)initVideoOptionsBtn{
    _videoOptionsBtn=[[UIButton alloc] init];
    _videoOptionsBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    _videoOptionsBtn.titleLabel.font=[UIFont systemFontOfSize:10];
    _videoOptionsBtn.titleLabel.numberOfLines = 2;
     //_videoOptionsBtn.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_videoOptionsBtn setBackgroundImage:[UIImage imageNamed:@"video_btn"] forState:UIControlStateNormal];
    [_videoOptionsBtn setTitle:[HelperHandle getLanguage:@"视频选项"] forState:UIControlStateNormal];
    [_videoOptionsBtn setImage:[UIImage imageNamed:@"video_arrow"] forState:UIControlStateNormal];
    [_videoOptionsBtn setTitleColor:[UIColor colorWithRed:238/255.0 green:194/255.0 blue:164/255.0 alpha:1] forState:UIControlStateNormal];
    _videoOptionsBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    _videoOptionsBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -20, 0, 20);
    _videoOptionsBtn.imageEdgeInsets=UIEdgeInsetsMake(5, 60, 5, 5);
    [_videoOptionsBtn addTarget:self action:@selector(videoOptionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_videoOptionsBtn];
    [_videoOptionsBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.maidFreeBtn.mas_top).offset(-10);
        make.right.equalTo(self.chipBgView.mas_left).offset(-10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
}
-(void)videoOptionBtnAction:(UIButton *)btn{
    if (_videoOptionView==nil) {
        _videoOptionView=[[VideoOptionView alloc] init];
        _videoOptionView.delegate=self;
    }
    if (_isVideoOption) {
        _isVideoOption=NO;
         [_videoOptionView removeFromSuperview];
    }else{
        _isVideoOption=YES;
        [self.view addSubview:_videoOptionView];
        [_videoOptionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.videoOptionsBtn.mas_top).offset(0);
            make.right.equalTo(self.chipBgView.mas_left).offset(-10);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(110);
        }];
    }
    
}
-(void)VideoOptionViewdelegate:(VideoType)videoType{
    if (videoType==VideoTypeHigh) {
        _palyerView.playback_url_=[_palyerView.playback_url_ stringByReplacingCharactersInRange:NSMakeRange(_palyerView.playback_url_.length-1, 1) withString:@"a"];
        [_palyerView UnInitPlayer];
        [_palyerView InitPlayer];
        [_palyerView StartPlayer];
        [self videoOptionBtnAction:nil];
    }else if (videoType==VideoTypeStandard) {
        _palyerView.playback_url_=[_palyerView.playback_url_ stringByReplacingCharactersInRange:NSMakeRange(_palyerView.playback_url_.length-1, 1) withString:@"b"];
        [_palyerView UnInitPlayer];
        [_palyerView InitPlayer];
        [_palyerView StartPlayer];
        [self videoOptionBtnAction:nil];
    }else if (videoType==VideoTypeClose) {
        [_palyerView UnInitPlayer];
        [self videoOptionBtnAction:nil];
    }
}
-(void)initDisplayCardView{
    if (_dispalayCardView==nil) {
        _dispalayCardView=[[DisplayCardView alloc] init];
    }
    [self.view insertSubview:_dispalayCardView aboveSubview:_junHaoView];
    [_dispalayCardView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.sureBtn.mas_left).offset(-10);
        make.left.equalTo(self.canCelBtn.mas_right).offset(10);
        make.height.mas_equalTo(self.junHaoView.frame.size.height+11);
    }];
}
-(void)removeDisPlayCard{
    [_dispalayCardView removeFromSuperview];
    self.xianNum=0;
    self.zhuangNum=0;
    self.dispalayCardView.num1Lab.text=@"0";
    self.dispalayCardView.num2Lab.text=@"0";
    _dispalayCardView.cardLeft1.image=[UIImage imageNamed:@""];
    _dispalayCardView.cardLeft2.image=[UIImage imageNamed:@""];
    _dispalayCardView.cardLeft3.image=[UIImage imageNamed:@""];
    _dispalayCardView.cardRight1.image=[UIImage imageNamed:@""];
    _dispalayCardView.cardRight2.image=[UIImage imageNamed:@""];
    _dispalayCardView.cardRight3.image=[UIImage imageNamed:@""];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setRight];
}

-(void)setRight{
    //设置状态栏方向，超级重要。（只有设置了这个方向，才能改变弹出键盘的方向）
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    
    //设置状态栏横屏
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    
    //    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];//这句话是防止手动先把设备置为横屏,导致下面的语句失效.
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:@(UIInterfaceOrientationLandscapeRight)];
        
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return  UIInterfaceOrientationLandscapeRight;
    //return  UIDeviceOrientationPortrait;
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
