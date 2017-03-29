//
//  XFrame.h
//  TheRichText
//
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XStatus.h"

@interface XFrame : NSObject

@property (nonatomic, strong) XStatus *status;
@property (nonatomic, assign) CGFloat frameX;
@property (nonatomic, assign) CGFloat frameY;
@property (nonatomic, assign) CGFloat maxWidth;

@property (nonatomic, assign) CGRect contentLabelF;
@end
