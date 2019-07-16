//
//  BigCollectionViewCell.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/20.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "BigCollectionViewCell.h"

@implementation BigCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor=[UIColor redColor];
    }
    return self;
}
@end
