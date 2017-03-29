//
//  GlobalValus.h
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/29.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalValus : NSObject

@property (nonatomic, copy) NSArray *xLogisticsArr;

+ (instancetype)sharedInstance;

@end
