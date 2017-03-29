//
//  XStatus.h
//  TheRichText
//
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XStatus : NSObject

//源内容
@property (nonatomic, copy) NSString *text;

/**	string	信息内容 -- 带有属性的*/
@property (nonatomic, copy) NSAttributedString *attributedText;

@end
