//
//  QuotaRecordCell.h
//  wangTGJ
//
//  Created by 许传信 on 2018/9/30.
//  Copyright © 2018年 zhifu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuotaRecordCell : UITableViewCell
@property (nonatomic,strong) NSArray *mutis;
@property (nonatomic,strong) NSMutableArray *labs;
@property (nonatomic,strong) NSMutableArray *lines;
-(void)setCellWithDic:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
