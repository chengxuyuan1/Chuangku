//
//  languageVC.m
//  万通国际
//
//  Created by 许传信 on 2018/8/13.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "LanguageVC.h"
#import "LanguageTableViewCell.h"
@interface LanguageVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation LanguageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataSource=@[@"简体中文",@"中文繁體",@"English"];
    [self initTableView];
}
- (void)initTableView{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[LanguageTableViewCell class] forCellReuseIdentifier:@"LanguageTableViewCell"];
    [self.view addSubview:_tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LanguageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LanguageTableViewCell" forIndexPath:indexPath];
    cell.titleLab.text=_dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    if ([_dataSource[indexPath.row] isEqualToString:@"简体中文"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else if ([_dataSource[indexPath.row] isEqualToString:@"中文繁體"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else if ([_dataSource[indexPath.row] isEqualToString:@"English"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
   
     [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
    
}
-(void)selectLanguageBlcok:(Block)block{
    _block=block;
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
