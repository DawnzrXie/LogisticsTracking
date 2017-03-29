//
//  SetClassData.h
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/29.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XLogisticsData;

@interface SetClassData : NSObject

+ (NSArray *)XLogisticsDataWithArray:(NSArray *)dataArr;

+ (XLogisticsData *)setXLogisticsDataWithDictionary:(NSDictionary *)dataDic;

@end
