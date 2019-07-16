//
//  QuotaRecordVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/19.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "QuotaRecordVC.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"
#import "SettingNetWork.h"
#import "QuotaRecordCell.h"
#import "SelectDateView.h"
@interface QuotaRecordVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *navView;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *selectBtn;
@property (nonatomic,strong) UIView *topLine;
@property (nonatomic,strong) UILabel *noRecordLab;
@property (nonatomic,strong) UIView *headerBgView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) SelectDateView *selectDateView;
@property (nonatomic,assign) BOOL isShow;
@end

@implementation QuotaRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    _dataSource=[NSMutableArray array];
    [self initNavView];
    [self initBackBtn];
    [self initTitleLab];
    [self initSelectBtn];
    [self initTopLine];
    [self initNoRecordLab];
    [self initHeaderBgView];
    [self initHeaderTitleLabs];
    [self initTableView];
    [self initDataWithDate:0];
}
-(void)initDataWithDate:(NSInteger)date{
    __weak __typeof(self)weakSelf = self;
    [SettingNetWork expenseRecordTime:[NSString stringWithFormat:@"%ld",date] Thispage:@"1" Blcok:^(id data) {
        [weakSelf.dataSource removeAllObjects];
        [weakSelf.dataSource addObjectsFromArray:data[@"data"][@"content"]];
        [weakSelf.tableView reloadData];
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
        make.top.equalTo(self.headerBgView.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    [_tableView registerClass:[QuotaRecordCell class] forCellReuseIdentifier:@"QuotaRecordCell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QuotaRecordCell *cell=[tableView dequeueReusableCellWithIdentifier:@"QuotaRecordCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row%2==0) {
        cell.contentView.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
        cell.backgroundColor=[UIColor colorWithRed:44/255.0 green:44/255.0 blue:44/255.0 alpha:1];
    }else{
        cell.contentView.backgroundColor=[UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1];
        cell.backgroundColor=[UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1];
    }
    [cell setCellWithDic:_dataSource[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)initNavView{
    _navView=[[UIView alloc] init];
    _navView.backgroundColor=[UIColor colorWithRed:46/255.0 green:46/255.0 blue:46/255.0 alpha:1];
    [self.view addSubview:_navView];
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
    }];
}
-(void)initBackBtn{
    _backBtn=[[UIButton alloc] init];
    [_backBtn setImage:[UIImage imageNamed:@"backbtn"] forState:UIControlStateNormal];
    _backBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 10, 10, 10);
    [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_top).offset(0);
        make.left.equalTo(self.navView.mas_left).offset(0);
        make.bottom.equalTo(self.navView.mas_bottom).offset(0);
        make.width.mas_equalTo(60);
    }];
}
-(void)initTitleLab{
    _titleLab=[[UILabel alloc] init];
    _titleLab.text=[HelperHandle getLanguage:@"额度记录"];
    _titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _titleLab.textAlignment=NSTextAlignmentCenter;
    [_navView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_top).offset(0);
        make.centerX.equalTo(self.navView.mas_centerX).offset(0);
        make.bottom.equalTo(self.navView.mas_bottom).offset(0);
        make.width.mas_equalTo(150);
    }];
}
-(void)initSelectBtn{
    _selectBtn=[[UIButton alloc] init];
    [_selectBtn setTitle:[HelperHandle getLanguage:@"今天"] forState:UIControlStateNormal];
    [_selectBtn setTitleColor:[UIColor colorWithRed:242/255.0 green:196/255.0 blue:163/255.0 alpha:1] forState:UIControlStateNormal];
    _selectBtn.backgroundColor=[UIColor colorWithRed:59/255.0 green:59/255.0 blue:59/255.0 alpha:1];
    [_selectBtn setImage:[UIImage imageNamed:@"ac_spinner_down_arrow"] forState:UIControlStateNormal];
    _selectBtn.layer.cornerRadius = 2.0;
    _selectBtn.layer.borderWidth = 1;
    _selectBtn.layer.borderColor = [[UIColor colorWithRed:212/255.0 green:144/255.0 blue:63/255.0 alpha:1] CGColor];
    _selectBtn.imageEdgeInsets=UIEdgeInsetsMake(10, 90, 10, 10);
    _selectBtn.titleEdgeInsets=UIEdgeInsetsMake(0, -90, 0, 0);
    [_selectBtn addTarget:self action:@selector(selectBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_selectBtn];
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_top).offset(15);
        make.right.equalTo(self.navView.mas_right).offset(-10);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-15);
        make.width.mas_equalTo(130);
    }];
}
-(void)backBtnAction{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)selectBtnAction{
    __weak __typeof(self)weakSelf = self;
    if (_selectDateView==nil) {
        _selectDateView=[[SelectDateView alloc] init];
        [_selectDateView selectDateBlock:^(NSInteger tag) {
            [weakSelf initDataWithDate:tag];
            weakSelf.isShow=NO;
            [weakSelf.selectBtn setImage:[UIImage imageNamed:@"ac_spinner_down_arrow"] forState:UIControlStateNormal];
        }];
    }
    if (_isShow) {
        _isShow=NO;
        [_selectDateView removeFromSuperview];
        [_selectBtn setImage:[UIImage imageNamed:@"ac_spinner_down_arrow"] forState:UIControlStateNormal];
    }else{
        [_selectBtn setImage:[UIImage imageNamed:@"ac_spinner_up_arrow"] forState:UIControlStateNormal];
        _isShow=YES;
        [self.view addSubview:_selectDateView];
        [_selectDateView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.selectBtn.mas_bottom).offset(0);
            make.left.equalTo(self.selectBtn.mas_left).offset(0);
            make.height.mas_equalTo(150);
            make.width.mas_equalTo(100);
        }];
    }
}
-(void)initTopLine{
    _topLine=[[UIView alloc] init];
    _topLine.backgroundColor=[UIColor colorWithRed:137/255.0 green:112/255.0 blue:90/255.0 alpha:1];
    [self.view addSubview:_topLine];
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_bottom).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.mas_equalTo(3);
    }];
}
-(void)initNoRecordLab{
    _noRecordLab=[[UILabel alloc] init];
    _noRecordLab.text=[HelperHandle getLanguage:@"没有记录"];
    _noRecordLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
    _noRecordLab.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:_noRecordLab];
    [_noRecordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY).offset(50);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
    }];
}

-(void)initHeaderBgView{
    _headerBgView=[[UIView alloc] init];
    _headerBgView.backgroundColor=[UIColor colorWithRed:53/255.0 green:45/255.0 blue:40/255.0 alpha:1];
    [self.view addSubview:_headerBgView];
    [_headerBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(self.topLine.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
    }];
}
-(void)initHeaderTitleLabs{
    NSArray *titles=@[@"交易单号",@"操作时间(美东)",@"类别",@"收入",@"支出",@"交易后额度"];
    NSArray *mutis=@[[NSNumber numberWithFloat:0.23],[NSNumber numberWithFloat:0.22],[NSNumber numberWithFloat:0.1],[NSNumber numberWithFloat:0.1],[NSNumber numberWithFloat:0.15],[NSNumber numberWithFloat:0.2]];
    NSMutableArray *lines=[NSMutableArray array];
    for (int i=0; i<titles.count; i++) {
        CGFloat muti=[mutis[i] floatValue];
       UILabel * titleLab=[[UILabel alloc] init];
        titleLab.text=[HelperHandle getLanguage:titles[i]];
        //titleLab.backgroundColor=[UIColor redColor];
        titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
        titleLab.textAlignment=NSTextAlignmentCenter;
        titleLab.font=[UIFont systemFontOfSize:12];
        [_headerBgView addSubview:titleLab];
        
        if (i>0) {
            UIView *kline=lines[i-1];
            [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.headerBgView.mas_top).offset(0);
                make.left.equalTo(kline.mas_left).offset(0);
                make.bottom.equalTo(self.headerBgView.mas_bottom).offset(0);
                make.width.mas_equalTo(self.view.mas_width).multipliedBy(muti);
            }];
        }else{
            [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.headerBgView.mas_top).offset(0);
                make.left.equalTo(self.headerBgView.mas_left).offset(0);
                make.bottom.equalTo(self.headerBgView.mas_bottom).offset(0);
                make.width.mas_equalTo(self.view.mas_width).multipliedBy(muti);
            }];
        }
        UIView *line=[[UIView alloc] init];
        line.backgroundColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:109/255.0 alpha:1];
        [self.headerBgView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headerBgView.mas_top).offset(0);
            make.left.equalTo(titleLab.mas_right).offset(0);
            make.bottom.equalTo(self.headerBgView.mas_bottom).offset(0);
            make.width.mas_equalTo(1);
        }];
        [lines addObject:line];
    }
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

@end
