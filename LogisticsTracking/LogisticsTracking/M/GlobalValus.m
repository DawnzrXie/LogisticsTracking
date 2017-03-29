//
//  GlobalValus.m
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/29.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import "GlobalValus.h"

@implementation GlobalValus

static GlobalValus *_gloVal;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _gloVal = [super allocWithZone:zone];
    });
    return _gloVal;
    
}

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _gloVal = [[self alloc] init];
    });
    return _gloVal;
}

- (id)copyWithZone:(NSZone *)zone {
    
    return _gloVal;
}

- (NSArray *)xLogisticsArr {
    
    if (!_xLogisticsArr) {
        
        _xLogisticsArr = @[@{@"content" : @"[昆明穿金路] [昆明市] [昆明穿金路] 电话:18987111247", @"day" : @"2017年3月2日", @"seconds" : @"下午5:27:48"},
                        @{@"content" : @"[昆明穿金路] [昆明市] 快件离开 [昆明穿金路]已发往[昆明中转]", @"day" : @"2017年3月2日", @"seconds" : @"下午7:51:16"},
                        @{@"content" : @"[昆明中转] [昆明市] 快件到达 [昆明中转]", @"day" : @"2017年3月3日", @"seconds" : @"下午9:55:39"},
                        @{@"content" : @"[昆明中转] [昆明市] [昆明中转] [昆明市][昆明中转] [昆明市][昆明中转] [昆明市][昆明中转] [昆明市][昆明中转] [昆明市][昆明中转] [昆明市][昆明中转] [昆明市]快件离开 [昆明中转]已发往[深圳中心]", @"day" : @"2017年3月7日", @"seconds" : @"上午1:13:03"},
                        @{@"content" : @"[深圳中心] [深圳市] 快件离开 [深圳中心]已发往[深圳西乡]", @"day" : @"2017年3月9日", @"seconds" : @"上午6:50:53"},
                        @{@"content" : @"快件到达 [深圳西乡]", @"day" : @"2017年3月12日", @"seconds" : @"上午9:06:37"},
                        @{@"content" : @"[深圳西乡] [深圳市] [深圳西乡]的盐田林良佳正在第1次派件 电话:13613065030 请保持电话畅通、耐心等待", @"day" : @"2017年12月22日", @"seconds" : @"下午1:55:03"}];
    }
    return _xLogisticsArr;
}

@end
