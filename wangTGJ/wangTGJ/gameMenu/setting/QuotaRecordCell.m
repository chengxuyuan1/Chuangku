//
//  QuotaRecordCell.m
//  wangTGJ
//
//  Created by 许传信 on 2018/9/30.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "QuotaRecordCell.h"
#import <Masonry/Masonry.h>
#import "HelperHandle.h"

@implementation QuotaRecordCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLab];
    }
    return self;
}
-(void)setCellWithDic:(NSDictionary *)dic{
    
    NSMutableArray *titles=[NSMutableArray array];
    [titles addObject:[HelperHandle isStrOrIsNum:dic[@"id"]]];
    NSString *time=[HelperHandle isStrOrIsNum:dic[@"gameTime"]];
    time=[HelperHandle timeStamp:time];
    [titles addObject:time];
   [titles addObject:[HelperHandle isStrOrIsNum:dic[@"type"]]];
    [titles addObject:[HelperHandle isStrOrIsNum:dic[@"earning"]]];
    [titles addObject:[HelperHandle isStrOrIsNum:dic[@"expend"]]];
    [titles addObject:[HelperHandle isStrOrIsNum:dic[@"wage"]]];
    
    for (NSInteger i=0; i<titles.count; i++) {
        UILabel *lab=_labs[i];
        lab.text=titles[i];
    }
}
-(void)initLab{
    //NSArray *titles=@[@"交易单号",@"操作时间(美东)",@"类别",@"收入",@"支出",@"交易后额度"];
    NSArray *mutis=@[[NSNumber numberWithFloat:0.23],[NSNumber numberWithFloat:0.22],[NSNumber numberWithFloat:0.1],[NSNumber numberWithFloat:0.1],[NSNumber numberWithFloat:0.15],[NSNumber numberWithFloat:0.2]];
    _mutis=mutis;
    NSMutableArray *lines=[NSMutableArray array];
    _lines=lines;
    _labs=[NSMutableArray array];
    for (int i=0; i<mutis.count; i++) {
        CGFloat muti=[mutis[i] floatValue];
        UILabel * titleLab=[[UILabel alloc] init];
        //titleLab.text=[HelperHandle getLanguage:titles[i]];
        //titleLab.backgroundColor=[UIColor redColor];
        titleLab.numberOfLines=2;
        titleLab.lineBreakMode=NSLineBreakByWordWrapping;
        titleLab.textColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:110/255.0 alpha:1];
        titleLab.textAlignment=NSTextAlignmentCenter;
        titleLab.font=[UIFont systemFontOfSize:12];
        [self addSubview:titleLab];
        [_labs addObject:titleLab];
        
        if (i>0) {
            UIView *kline=lines[i-1];
            [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).offset(0);
                make.left.equalTo(kline.mas_left).offset(0);
                make.bottom.equalTo(self.mas_bottom).offset(0);
                make.width.mas_equalTo(self.mas_width).multipliedBy(muti);
            }];
        }else{
            [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).offset(0);
                make.left.equalTo(self.mas_left).offset(0);
                make.bottom.equalTo(self.mas_bottom).offset(0);
                make.width.mas_equalTo(self.mas_width).multipliedBy(muti);
            }];
        }
        UIView *line=[[UIView alloc] init];
        line.backgroundColor=[UIColor colorWithRed:163/255.0 green:133/255.0 blue:109/255.0 alpha:1];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(titleLab.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(1);
        }];
        [lines addObject:line];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i=0; i<_mutis.count; i++) {
        CGFloat muti=[_mutis[i] floatValue];
        UILabel *titleLab=_labs[i];
        if (i>0) {
            UIView *kline=_lines[i-1];
            [titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).offset(0);
                make.left.equalTo(kline.mas_left).offset(0);
                make.bottom.equalTo(self.mas_bottom).offset(0);
                make.width.mas_equalTo(self.mas_width).multipliedBy(muti);
            }];
        }else{
            [titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).offset(0);
                make.left.equalTo(self.mas_left).offset(0);
                make.bottom.equalTo(self.mas_bottom).offset(0);
                make.width.mas_equalTo(self.mas_width).multipliedBy(muti);
            }];
        }
        UIView *line=_lines[i];
        [line mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(titleLab.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.width.mas_equalTo(1);
        }];
    }
}
@end
