//
//  XStatusTextView.h
//  TheRichText
//  识别电话号码的富文本控件
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XFrame, OrderSelectViewController;

@interface XStatusTextView : UITextView
/** 所有的特殊字符串(里面存放着XSpecial) */
@property (nonatomic, copy) NSArray *specials;
@property (nonatomic, strong) XFrame *xframe;

@end
