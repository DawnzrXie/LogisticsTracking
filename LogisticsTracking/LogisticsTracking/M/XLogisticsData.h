//
//  XLogisticsData.h
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/28.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLogisticsData : NSObject

/* 物流信息 */
@property (nonatomic, copy) NSString *contentStr;

/* 物流时间——年月日 */
@property (nonatomic, copy) NSString *dayStr;

/* 物流时间——时分秒 */
@property (nonatomic, copy) NSString *secondsStr;

@end
