//
//  SetClassData.m
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/29.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import "SetClassData.h"
#import "XLogisticsData.h"

@implementation SetClassData

+ (NSArray *)XLogisticsDataWithArray:(NSArray *)dataArr {
    
    NSMutableArray *mutableArr = [[NSMutableArray alloc] initWithCapacity:0];
    if ([dataArr isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary *)dataArr;
        [mutableArr addObject:[SetClassData setXLogisticsDataWithDictionary:dic]];
        return mutableArr;
    }
    
    for (NSDictionary *dic in dataArr) {
        [mutableArr addObject:[SetClassData setXLogisticsDataWithDictionary:dic]];
    }
    return mutableArr;
    
}

+ (XLogisticsData *)setXLogisticsDataWithDictionary:(NSDictionary *)dataDic {
    
    XLogisticsData *data = [[XLogisticsData alloc] init];
    data.contentStr = dataDic[@"content"];
    data.dayStr = dataDic[@"day"];
    data.secondsStr = dataDic[@"seconds"];
    return data;
    
}








@end
