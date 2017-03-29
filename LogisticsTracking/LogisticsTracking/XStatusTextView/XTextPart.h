//
//  XTextPart.h
//  TheRichText
//
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTextPart : NSObject
/** 这段文字的内容 */
@property (nonatomic, copy) NSString *text;
/** 这段文字的范围 */
@property (nonatomic, assign) NSRange range;
/** 是否为特殊文字 */
@property (nonatomic, assign, getter = isSpecical) BOOL special;

@end
