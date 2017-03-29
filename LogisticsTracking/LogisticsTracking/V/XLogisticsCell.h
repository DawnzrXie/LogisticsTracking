//
//  XLogisticsCell.h
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/28.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLogisticsData;

@interface XLogisticsCell : UITableViewCell

+ (XLogisticsCell *)cellWithTableView:(UITableView *)tableView;

- (CGFloat )refreshWithData:(XLogisticsData *)data andIsGreen:(BOOL )isGreen;

@end
