//
//  XFrame.m
//  TheRichText
//
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import "XFrame.h"
#import <UIKit/UIKit.h>


@implementation XFrame

-(void)setStatus:(XStatus *)status{
    _status = status;
    CGSize contentSize = [status.attributedText boundingRectWithSize:CGSizeMake(self.maxWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  context:nil].size;
    self.contentLabelF = (CGRect){{self.frameX , self.frameY}, contentSize};
    
}

-(void)setFrameX:(CGFloat)frameX{
    _frameX = frameX;
}

-(void)setFrameY:(CGFloat)frameY{
    _frameY = frameY;
}

-(void)setMaxWidth:(CGFloat)maxWidth{
    _maxWidth = maxWidth;
}


@end
