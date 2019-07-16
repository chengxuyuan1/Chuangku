//
//  GridSmallView.m
//  wangTGJ
//
//  Created by 许传信 on 2018/8/18.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import "GridSmallView.h"
#import <Masonry/Masonry.h>
#import "BigCollectionViewCell.h"
#import "GridBgView.h"
@implementation GridSmallView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        //[self initCollectionView];
        //[self initGird];
    }
    return self;
}
-(void)initGirdWithWNumber:(NSInteger)wNumber With:(NSInteger)w Count:(NSInteger)count{
    for (UIView *bgview in _section0Array) {
        [bgview removeFromSuperview];
    }
    [_section0Array removeAllObjects];
    _section0Array=[[NSMutableArray alloc] init];
    for (int i=0; i<count; i++) {
        UIView *bgview=[[GridBgView alloc] initWithFrame:CGRectMake(i%wNumber*w, i/wNumber*w, w, w)];
        bgview.layer.borderWidth = 0.5;
        bgview.layer.borderColor =[_lineColor CGColor];
        [self addSubview:bgview];
        [_section0Array addObject:bgview];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}












@end
