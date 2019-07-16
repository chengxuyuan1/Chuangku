//
//  TableViewCell.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/7.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor=[UIColor colorWithRed:53/255.0 green:45/255.0 blue:40/255.0 alpha:1];
        [self initOderLab];
        [self initLine1];
        [self initBetingTimeLab];
        [self initLine2];
        [self initBureauNumberLab];
        [self initLine3];
        [self initPlayWayLab];
        [self initLine4];
        [self initBettingLab];
        [self initLine5];
        [self initPayoutLab];
        //[self initLine6];
        //[self initVideoPlaybackLab];
        [self initDisplayCardView];
    }
    
    return self;
}

-(void)setCellWithDic:(NSDictionary *)dic{
    _orderLab.text=[HelperHandle isStrOrIsNum:dic[@"id"]];
    NSString *time=[HelperHandle isStrOrIsNum:dic[@"gameTime"]];
    time=[HelperHandle timeStamp:time];
    _BettingTimeLab.text=time;
    
    _bureauNumberLab.text=[HelperHandle isStrOrIsNum:dic[@"numberId"]];
    
    _palyWayLab.text=[HelperHandle isStrOrIsNum:dic[@"gamePlayName"]];
    
    _bettingLab.text=[HelperHandle isStrOrIsNum:dic[@"betCoin"]];
    
    _payoutLab.text=[HelperHandle isStrOrIsNum:dic[@"betResult"]];
    
    //_videoPlaybackLab.text=dic[@""];
}

-(void)initOderLab{
    _orderLab=[[UILabel alloc] init];
    _orderLab.text=@"1888r999r9r99r9r9r9";
    _orderLab.font=[UIFont systemFontOfSize:10];
    _orderLab.textAlignment=NSTextAlignmentCenter;
    _orderLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    _orderLab.numberOfLines=2;
    _orderLab.lineBreakMode=NSLineBreakByWordWrapping;
    [self.contentView addSubview:_orderLab];
    
}
-(void)initDisplayCardView{
    if (_dispalayCardView==nil) {
        _dispalayCardView=[[DisplayCardView alloc] init];
    }
    if (_cardBgView==nil) {
        _cardBgView=[[UIView alloc] init];
        _cardBgView.backgroundColor=[UIColor blackColor];
    }
}
-(void)showCard{
    [self.contentView addSubview:_cardBgView];
    [_cardBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.top.equalTo(self.orderLab.mas_bottom);
    }];
    [self.contentView addSubview:_dispalayCardView];
    [_dispalayCardView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
        make.width.mas_equalTo(300);
        make.top.equalTo(self.orderLab.mas_bottom);
    }];
}
-(void)remvoeCard{
    [_cardBgView removeFromSuperview];
    [_dispalayCardView removeFromSuperview];
}
-(void)setBankCard:(NSString *)bankCard{
    _zhuangNum=0;
    NSArray *arr=[bankCard componentsSeparatedByString:@","];
    if (arr.count>0) {
        for (int i=0; i<arr.count; i++) {
            NSString *card=arr[i];
            NSInteger num=0;
            if (i==0) {
                num=4;
            }else if (i==1) {
                num=5;
            }if (i==2) {
                num=6;
            }
            NSString *poc=[NSString stringWithFormat:@"0%ld",num];
            [self switch_resultCard:card Pos:poc];
        }
    }
}
-(void)setPlayCard:(NSString *)playCard{
    _xianNum=0;
    NSArray *arr=[playCard componentsSeparatedByString:@","];
    if (arr.count>0) {
        for (int i=0; i<arr.count; i++) {
            NSString *card=arr[i];
            NSInteger num=0;
            if (i==0) {
                num=1;
            }else if (i==1) {
                num=2;
            }if (i==2) {
                num=3;
            }
            NSString *poc=[NSString stringWithFormat:@"0%ld",num];
            [self switch_resultCard:card Pos:poc];
        }
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
        
    }else if ([pos isEqualToString:@"02"]) {
        if ([kcard integerValue]<10) {
            _xianNum+=[kcard integerValue];
            _dispalayCardView.num1Lab.text=[NSString stringWithFormat:@"%ld",_xianNum%10];
        }
        _dispalayCardView.cardLeft2.image=[UIImage imageNamed:nowCardStr];
        
    }else if ([pos isEqualToString:@"03"]) {
        if ([kcard integerValue]<10) {
            _xianNum+=[kcard integerValue];
            _dispalayCardView.num1Lab.text=[NSString stringWithFormat:@"%ld",_xianNum%10];
        }
        _dispalayCardView.cardLeft3.image=[UIImage imageNamed:nowCardStr];
        
        
    }else if ([pos isEqualToString:@"04"]) {
        if ([kcard integerValue]<10) {
            _zhuangNum+=[kcard integerValue];
            _dispalayCardView.num2Lab.text=[NSString stringWithFormat:@"%ld",_zhuangNum%10];
        }
        _dispalayCardView.cardRight1.image=[UIImage imageNamed:nowCardStr];
        
    }else if ([pos isEqualToString:@"05"]) {
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
        
    }
    
}
-(void)initLine1{
    _line1=[[UIView alloc] init];
    _line1.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [self.contentView addSubview:_line1];
    
}
-(void)initBetingTimeLab{
    _BettingTimeLab=[[UILabel alloc] init];
    _BettingTimeLab.text=@"2018-09-03 06:51:46";
    _BettingTimeLab.font=[UIFont systemFontOfSize:10];
    _BettingTimeLab.textAlignment=NSTextAlignmentCenter;
    _BettingTimeLab.lineBreakMode = NSLineBreakByCharWrapping;
    _BettingTimeLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [self.contentView addSubview:_BettingTimeLab];
    
}
-(void)initLine2{
    _line2=[[UIView alloc] init];
    _line2.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [self.contentView addSubview:_line2];
    
}
-(void)initBureauNumberLab{
    _bureauNumberLab=[[UILabel alloc] init];
    _bureauNumberLab.text=@"GC003189030";
    _bureauNumberLab.font=[UIFont systemFontOfSize:10];
    _bureauNumberLab.textAlignment=NSTextAlignmentCenter;
    _bureauNumberLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    _bureauNumberLab.numberOfLines=2;
    _bureauNumberLab.lineBreakMode=NSLineBreakByWordWrapping;
    [self.contentView addSubview:_bureauNumberLab];
    
}
-(void)initLine3{
    _line3=[[UIView alloc] init];
    _line3.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [self.contentView addSubview:_line3];
    
}
-(void)initPlayWayLab{
    _palyWayLab=[[UILabel alloc] init];
    _palyWayLab.text=[HelperHandle getLanguage:@"庄(百家乐)"];
    _palyWayLab.font=[UIFont systemFontOfSize:10];
    _palyWayLab.textAlignment=NSTextAlignmentCenter;
    _palyWayLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [self.contentView addSubview:_palyWayLab];
  
}
-(void)initLine4{
    _line4=[[UIView alloc] init];
    _line4.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [self.contentView addSubview:_line4];
    
}
-(void)initBettingLab{
    _bettingLab=[[UILabel alloc] init];
    _bettingLab.text=[HelperHandle getLanguage:@"1452.0000"];
    _bettingLab.font=[UIFont systemFontOfSize:10];
    _bettingLab.textAlignment=NSTextAlignmentCenter;
    _bettingLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [self.contentView addSubview:_bettingLab];
  
}
-(void)initLine5{
    _line5=[[UIView alloc] init];
    _line5.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [self.contentView addSubview:_line5];
    
}
-(void)initPayoutLab{
    _payoutLab=[[UILabel alloc] init];
    _payoutLab.text=[HelperHandle getLanguage:@"-1452.0000"];
    _payoutLab.font=[UIFont systemFontOfSize:10];
    _payoutLab.textAlignment=NSTextAlignmentCenter;
    _payoutLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [self.contentView addSubview:_payoutLab];
    
}
-(void)initLine6{
    _line6=[[UIView alloc] init];
    _line6.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [self.contentView addSubview:_line6];
    
}
-(void)initVideoPlaybackLab{
    _videoPlaybackLab=[[UILabel alloc] init];
    _videoPlaybackLab.text=[HelperHandle getLanguage:@"播放"];
    _videoPlaybackLab.font=[UIFont systemFontOfSize:10];
    _videoPlaybackLab.textAlignment=NSTextAlignmentCenter;
    _videoPlaybackLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [self.contentView addSubview:_videoPlaybackLab];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_orderLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.contentView.mas_left).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(self.contentView.frame.size.width*0.19);
    }];
    [_line1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.orderLab.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(1);
    }];
    
    [_BettingTimeLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.line1.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(self.contentView.frame.size.width*0.18);
    }];
    
    [_line2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.BettingTimeLab.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(1);
    }];
    
    [_bureauNumberLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.line2.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(self.contentView.frame.size.width*0.17);
    }];
    
    [_line3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.bureauNumberLab.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(1);
    }];
    
    [_palyWayLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.line3.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(self.contentView.frame.size.width*0.14);
    }];
    
    [_line4 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.palyWayLab.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(1);
    }];
    
    [_bettingLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.line4.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(self.contentView.frame.size.width*0.14);
    }];
    
    [_line5 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.bettingLab.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(1);
    }];
    
    [_payoutLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.left.equalTo(self.line5.mas_right).offset(0);
        //make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
         make.right.equalTo(self.contentView.mas_right).offset(0);
        //make.width.mas_equalTo(self.contentView.frame.size.width*0.12);
    }];
    
//    [_line6 mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView.mas_top).offset(0);
//        make.left.equalTo(self.payoutLab.mas_right).offset(0);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
//        make.width.mas_equalTo(1);
//    }];
    
//    [_videoPlaybackLab mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView.mas_top).offset(0);
//        make.left.equalTo(self.line6.mas_right).offset(0);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
//        make.right.equalTo(self.contentView.mas_right).offset(0);
//    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
