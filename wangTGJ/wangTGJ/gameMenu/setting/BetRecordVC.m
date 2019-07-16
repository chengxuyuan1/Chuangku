//
//  BetRecordVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/6.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "BetRecordVC.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "TableViewCell.h"
#import "CardResultCell.h"
#import "SettingNetWork.h"
#import "BankResultCell.h"
#import "SelectDateView.h"
@interface BetRecordVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UILabel *orderLab;
@property (nonatomic,strong) UIView *line1;
@property (nonatomic,strong) UILabel *BettingTimeLab;
@property (nonatomic,strong) UIView *line2;
@property (nonatomic,strong) UILabel *bureauNumberLab;
@property (nonatomic,strong) UIView *line3;
@property (nonatomic,strong) UILabel *palyWayLab;
@property (nonatomic,strong) UIView *line4;
@property (nonatomic,strong) UILabel *bettingLab;
@property (nonatomic,strong) UIView *line5;
@property (nonatomic,strong) UILabel *payoutLab;
@property (nonatomic,strong) UIView *line6;
@property (nonatomic,strong) UILabel *videoPlaybackLab;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) SelectDateView *selectDateView;
@property (nonatomic,assign) BOOL isShow;
@end

@implementation BetRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    _dataSource=[NSMutableArray array];
    //_dataSource=@[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    _dateBtn.layer.cornerRadius = 8;
    _dateBtn.layer.borderWidth =1;
    _dateBtn.layer.borderColor =[UIColor colorWithRed:228/255.0 green:203/255.0 blue:176/255.0 alpha:1].CGColor;
    [_dateBtn setTitle:[HelperHandle getLanguage:@"今天"] forState:UIControlStateNormal];
//    [_dateBtn addTarget:self action:@selector(dateBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _titleLab.text=[HelperHandle getLanguage:@"下注记录"];
    [self initHeaderView];
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
    [self initTableView];
    [self initDataWithDate:0];
}
-(void)initDataWithDate:(NSInteger)date{
    __weak __typeof(self)weakSelf = self;
    [SettingNetWork gameRecordTime:[NSString stringWithFormat:@"%ld",date] Thispage:@"1" Blcok:^(id data) {
        [weakSelf.dataSource removeAllObjects];
        [weakSelf.dataSource addObjectsFromArray:data[@"data"][@"content"]];
        for (int i=0; i<weakSelf.dataSource.count; i++) {
            NSMutableDictionary *mudic=[[NSMutableDictionary alloc] initWithDictionary:weakSelf.dataSource[i]];
            weakSelf.dataSource[i]=mudic;
            [mudic setObject:[NSNumber numberWithInt:i] forKey:@"row"];
            [mudic setObject:[NSNumber numberWithInt:50] forKey:@"height"];
        }
        [weakSelf.tableView reloadData];
    }];
}
- (IBAction)backBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)dateBtnAction:(id)sender {
    __weak __typeof(self)weakSelf = self;
    if (_selectDateView==nil) {
        _selectDateView=[[SelectDateView alloc] init];
        [_selectDateView selectDateBlock:^(NSInteger tag) {
            [weakSelf initDataWithDate:tag];
            weakSelf.isShow=NO;
            [weakSelf.dateBtn setImage:[UIImage imageNamed:@"ac_spinner_down_arrow"] forState:UIControlStateNormal];
        }];
    }
    if (_isShow) {
        _isShow=NO;
        [_selectDateView removeFromSuperview];
        [_dateBtn setImage:[UIImage imageNamed:@"ac_spinner_down_arrow"] forState:UIControlStateNormal];
    }else{
        [_dateBtn setImage:[UIImage imageNamed:@"ac_spinner_up_arrow"] forState:UIControlStateNormal];
        _isShow=YES;
        [self.view addSubview:_selectDateView];
        [_selectDateView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.dateBtn.mas_bottom).offset(0);
            make.left.equalTo(self.dateBtn.mas_left).offset(0);
            make.height.mas_equalTo(150);
            make.width.mas_equalTo(100);
        }];
    }
}
-(void)initHeaderView{
    _headerView=[[UIView alloc] init];
    _headerView.backgroundColor=[UIColor colorWithRed:53/255.0 green:45/255.0 blue:40/255.0 alpha:1];
    [self.view addSubview:_headerView];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(isIphoneX);
        make.right.equalTo(self.view.mas_right).offset(-isIphoneX);
        make.height.mas_equalTo(50);
    }];
}
-(void)initOderLab{
    _orderLab=[[UILabel alloc] init];
    _orderLab.text=[HelperHandle getLanguage:@"订单号"];
    _orderLab.font=[UIFont systemFontOfSize:12];
    _orderLab.textAlignment=NSTextAlignmentCenter;
    _orderLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [_headerView addSubview:_orderLab];
    
}
-(void)initLine1{
    _line1=[[UIView alloc] init];
    _line1.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [_headerView addSubview:_line1];
    
}
-(void)initBetingTimeLab{
    _BettingTimeLab=[[UILabel alloc] init];
    _BettingTimeLab.text=[HelperHandle getLanguage:@"下注时间(美东)"];
    _BettingTimeLab.font=[UIFont systemFontOfSize:12];
    _BettingTimeLab.textAlignment=NSTextAlignmentCenter;
    _BettingTimeLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [_headerView addSubview:_BettingTimeLab];
    
}
-(void)initLine2{
    _line2=[[UIView alloc] init];
    _line2.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [_headerView addSubview:_line2];
    
}
-(void)initBureauNumberLab{
    _bureauNumberLab=[[UILabel alloc] init];
    _bureauNumberLab.text=[HelperHandle getLanguage:@"局号"];
    _bureauNumberLab.font=[UIFont systemFontOfSize:12];
    _bureauNumberLab.textAlignment=NSTextAlignmentCenter;
    _bureauNumberLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [_headerView addSubview:_bureauNumberLab];
    
}
-(void)initLine3{
    _line3=[[UIView alloc] init];
    _line3.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [_headerView addSubview:_line3];
    
}
-(void)initPlayWayLab{
    _palyWayLab=[[UILabel alloc] init];
    _palyWayLab.text=[HelperHandle getLanguage:@"玩法"];
    _palyWayLab.font=[UIFont systemFontOfSize:12];
    _palyWayLab.textAlignment=NSTextAlignmentCenter;
    _palyWayLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [_headerView addSubview:_palyWayLab];
    
}
-(void)initLine4{
    _line4=[[UIView alloc] init];
    _line4.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [_headerView addSubview:_line4];
   
}
-(void)initBettingLab{
    _bettingLab=[[UILabel alloc] init];
    _bettingLab.text=[HelperHandle getLanguage:@"下注"];
    _bettingLab.font=[UIFont systemFontOfSize:12];
    _bettingLab.textAlignment=NSTextAlignmentCenter;
    _bettingLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [_headerView addSubview:_bettingLab];
    
}
-(void)initLine5{
    _line5=[[UIView alloc] init];
    _line5.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [_headerView addSubview:_line5];
    
}
-(void)initPayoutLab{
    _payoutLab=[[UILabel alloc] init];
    _payoutLab.text=[HelperHandle getLanguage:@"派彩"];
    _payoutLab.font=[UIFont systemFontOfSize:12];
    _payoutLab.textAlignment=NSTextAlignmentCenter;
    _payoutLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [_headerView addSubview:_payoutLab];
    
}
-(void)initLine6{
    _line6=[[UIView alloc] init];
    _line6.backgroundColor=[UIColor colorWithRed:199/255.0 green:176/255.0 blue:156/255.0 alpha:1];
    [_headerView addSubview:_line6];
    [_line6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.payoutLab.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(1);
    }];
}
-(void)initVideoPlaybackLab{
    _videoPlaybackLab=[[UILabel alloc] init];
    _videoPlaybackLab.text=[HelperHandle getLanguage:@"视频回放"];
    _videoPlaybackLab.font=[UIFont systemFontOfSize:12];
    _videoPlaybackLab.textAlignment=NSTextAlignmentCenter;
    _videoPlaybackLab.textColor=[UIColor colorWithRed:193/255.0 green:163/255.0 blue:133/255.0 alpha:1];
    [_headerView addSubview:_videoPlaybackLab];
    [_videoPlaybackLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.line6.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.right.equalTo(self.headerView.mas_right).offset(0);
    }];
}

-(void)initTableView{
    _tableView=[[UITableView alloc] init];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.bounces=NO;
    _tableView.backgroundColor=[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    [_tableView registerClass:[BankResultCell class] forCellReuseIdentifier:@"BankResultCell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[_dataSource[indexPath.row] objectForKey:@"height"] integerValue];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:1];
    NSDictionary *dic=_dataSource[indexPath.row];
    NSInteger h=[[dic objectForKey:@"height"] integerValue];
    if (h==50) {
        [cell remvoeCard];
    }else{
        [cell showCard];
    }
    [cell setBankCard:dic[@"bankCard"]];
    [cell setPlayCard:dic[@"playCard"]];
    NSNumber *row=dic[@"row"];
    if (row) {
        if ([dic[@"row"] integerValue]%2==0) {
            cell.contentView.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
        }else{
            cell.contentView.backgroundColor=[UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1];
        }
        [cell setCellWithDic:_dataSource[indexPath.row]];
  }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSMutableDictionary *mudic=_dataSource[indexPath.row];
    NSInteger h=[[mudic objectForKey:@"height"] integerValue];
    if (h==50) {
        h=150;
    }else{
        h=50;
    }
    [mudic setObject:[NSNumber numberWithInteger:h] forKey:@"height"];
    for (int i=0; i<_dataSource.count; i++) {
        if (indexPath.row==i) {
            continue;
        }
        NSMutableDictionary *mudic=_dataSource[i];
        [mudic setObject:[NSNumber numberWithInteger:50] forKey:@"height"];
    }
    [_tableView reloadData];
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    CGFloat selfW=self.view.frame.size.width-2*isIphoneX;
    [_orderLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.headerView.mas_left).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(selfW*0.19);
    }];
    [_line1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.orderLab.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(1);
    }];
    [_BettingTimeLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.line1.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(selfW*0.18);
    }];
    [_line2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.BettingTimeLab.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(1);
    }];
    [_bureauNumberLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.line2.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(selfW*0.17);
    }];
    [_line3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.bureauNumberLab.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(1);
    }];
    [_palyWayLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.line3.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(selfW*0.14);
    }];
    [_line4 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.palyWayLab.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(1);
    }];
    [_bettingLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.line4.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(selfW*0.14);
    }];
    [_line5 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.bettingLab.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.mas_equalTo(1);
    }];
    [_payoutLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(0);
        make.left.equalTo(self.line5.mas_right).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        //make.width.mas_equalTo(selfW*0.12);
        make.right.equalTo(self.headerView.mas_right).offset(0);
    }];
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
