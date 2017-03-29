//
//  XSpecial.h
//  TheRichText
//
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSpecial : NSObject

/* 这段特殊文字的内容 */
@property (nonatomic, copy) NSString *text;
/* 这段特殊文字的范围 */
@property (nonatomic, assign) NSRange range;

@end
