//
//  LanguageTableViewCell.m
//  万通国际
//
//  Created by 许传信 on 2018/8/13.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "LanguageTableViewCell.h"
#import <Masonry/Masonry.h>
@implementation LanguageTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor=[UIColor colorWithRed:64/255.0 green:69/255.0 blue:78/255.0 alpha:1];
        
        _titleLab=[[UILabel alloc] init];
        _titleLab.textColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
        _titleLab.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLab];
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left).offset(10);
            make.right.equalTo(self.mas_right).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(0);
        }];
       
        _line=[[UIView alloc] init];
        _line.backgroundColor=[UIColor colorWithRed:242/255.0 green:200/255.0 blue:116/255.0 alpha:1];
        [self.contentView addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(0);
            make.left.equalTo(self.mas_left).offset(0);
            make.right.equalTo(self.mas_right).offset(0);
            make.height.mas_equalTo(1);
        }];
        
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
