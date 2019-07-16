//
//  GameHallVC.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GameHallVC.h"
#import "NavView.h"
#import <Masonry/Masonry.h>
#import "GameHallCell.h"
#import "GameNetWorker.h"
#import "GameVC.h"
#import "LoginUserInfo.h"
#import "NetworkingAdress.h"
#import "HelperHandle.h"

@interface GameHallVC ()<NavViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *whiteLine;
@property (nonatomic,strong) NavView *navView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *cellArr;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic, strong) SocketIOClient *clientSocket;
@end

@implementation GameHallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    _dataSource=[NSMutableArray array];
    [self initNavView];
    [self initWhiteLine];
    [self initTableView];
    [self initData];

    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
   // [self.view insertSubview:btn aboveSubview:_tableView];
}
-(void)initData{
    NSString *urlStr=[NSString stringWithFormat:@"%@:9081",kIPAdree];
    NSURL *url = [NSURL URLWithString:urlStr];
    _clientSocket = [[SocketIOClient alloc]initWithSocketURL:url
                                                      config:@{@"log": @YES, @"forcePolling": @YES}];
    
    
    //    // 2.连接服务器
    [self.clientSocket connect];
    [self.clientSocket on:@"connect" callback:^(NSArray * array, SocketAckEmitter * emitter) {
        NSLog(@"connect success");
        NSString *str=@"{'game':'baccarat'}";
        [self.clientSocket emit:@"joingame" with:@[str]];
    }];
    [self.clientSocket once:@"disconnect" callback:^(NSArray * arr, SocketAckEmitter * emitter) {
        NSLog(@"disconnect");
    }];
    [self.clientSocket on:@"hall" callback:^(NSArray * array, SocketAckEmitter * emitter) {
        NSLog(@"connect success");
        NSString *json=[self jsonWithArr:array];
        NSLog(@"%@",json);
        if (array.count>0) {
            NSDictionary *dic=array.firstObject;
            NSArray *karr=dic[@"record"];
           
            if (karr.count>1) {
                [self.dataSource removeAllObjects];
                [self.dataSource addObjectsFromArray:karr];
                NSInteger count=self.dataSource.count;
                self.navView.titleLab.text=[NSString stringWithFormat:@"%@(%@：%ld%@)",[HelperHandle getLanguage:self.titleStr],[HelperHandle getLanguage:@"总台数"],count,[HelperHandle getLanguage:@"台"]];
                [self.tableView reloadData];
                [self initCell];
            }
        }
    }];
    
}
-(void)btnAction{

    //    // 传递数据格式
    //NSString *nstr=@"{'token':'6833957e99fe48a0b4ea012ae89571fc','room':'room1'}";
    //,{'token':'6833957e99fe48a0b4ea012ae89571fc','room':'room1'}
    // 直接发送
    //[self.clientSocket emit:@"joinroom" with:@[nstr]];
    NSString *str=@"{'game':'baccarat'}";
     [self.clientSocket emit:@"joingame" with:@[str]];
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
- (void)initCell{
    if (_dataSource==nil) {
        _dataSource=[[NSMutableArray alloc] init];
    }
    if (_cellArr==nil) {
        _cellArr=[[NSMutableArray alloc] init];
    }
    [_cellArr removeAllObjects];
    for (NSDictionary *data in _dataSource) {
        GameHallCell *cell=[[GameHallCell alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *gameroom=data[@"gameroom"];
        NSString *room=[NSString stringWithFormat:@"room%ld",[[gameroom substringFromIndex:1] integerValue]];
        cell.bottomBgView.numLab.text=room;
        NSArray *boardMessage=data[@"boardMessage"];
        [cell updataGridSmallViewWithArr:boardMessage];
        [cell updateGrid2ViewWith:boardMessage];
        [cell updateGrid3ViewWith:boardMessage];
        [cell updateGrid4ViewInitWithArr:boardMessage];
        [cell updateGrid5ViewInitWithArr:boardMessage];
        [cell.rightBgView zhuangXiangNumWithArr:boardMessage];
        cell.bottomBgView.peopleNumLab.text=[NSString stringWithFormat:@"%@：%ld",[HelperHandle getLanguage:@"人数"],[data[@"proplenumber"] integerValue]];
        [_cellArr addObject:cell];
    }
    if (_cellArr.count>0) {
        [_tableView reloadData];
    }
}
- (void)initNavView{
    NavView *navView=[[NavView alloc] init];
    navView.comand=@"back";
    navView.delegate=self;
    navView.vc=self;
    navView.titleLab.text=[NSString stringWithFormat:@"%@(%@：%@%@)",[HelperHandle getLanguage:_titleStr],[HelperHandle getLanguage:@"总台数"],@"0",[HelperHandle getLanguage:@"台"]];
    _navView=navView;
    [self.view addSubview:navView];
    
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(60);
    }];
}
- (void)initWhiteLine{
    _whiteLine=[[UIView alloc] init];
    _whiteLine.backgroundColor=[UIColor colorWithRed:127/255.0 green:103/255.0 blue:81/255.0 alpha:1];
    [self.view addSubview:_whiteLine];
    
//    [_whiteLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.navView.mas_bottom).offset(0);
//        make.left.equalTo(self.view.mas_left).offset(0);
//        make.right.equalTo(self.view.mas_right).offset(0);
//        make.height.mas_equalTo(1);
//    }];
}
- (void)initTableView{
    _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
//    if (@available(iOS 11.0, *)) {
//        _tableView.contentInsetAdjustmentBehavior =  UIScrollViewContentInsetAdjustmentAutomatic;
//    } else {
//        // Fallback on earlier versions
//    }
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.whiteLine.mas_bottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GameHallCell *cell=_cellArr[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GameVC *gameVC=[[GameVC alloc] init];
    NSDictionary *dic=_dataSource[indexPath.row];
    NSString *room=dic[@"gameroom"];
    gameVC.room=room;
    gameVC.gridData=dic[@"boardMessage"];
    [self presentViewController:gameVC animated:YES completion:^{
        
    }];
}
-(void)NavViewDelegateComand:(NSString *)comand{
    if ([comand isEqualToString:@"back"]) {
        [_clientSocket disconnect];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _whiteLine.frame=CGRectMake(0,60, self.view.frame.size.width,1);
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setRight];
    NSString *str=@"{'game':'baccarat'}";
    [self.clientSocket emit:@"joingame" with:@[str]];
    
    _navView.moneyLab.text=[NSString stringWithFormat:@"%ld",[LoginUserInfo share].userModel.goldcoins];
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
