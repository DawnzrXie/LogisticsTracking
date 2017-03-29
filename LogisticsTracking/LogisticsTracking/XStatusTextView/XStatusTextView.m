//
//  XStatusTextView.m
//  TheRichText
//
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import "XStatusTextView.h"
#import "XSpecial.h"
#import "XFrame.h"

@implementation XStatusTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.editable = NO;
        self.textContainerInset = UIEdgeInsetsMake(0, -5, 0, -5);
        self.scrollEnabled = NO;
        
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo)];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPressToDo)];
        tapGesture.numberOfTapsRequired = 2;
        [self addGestureRecognizer:longGesture];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - touch的代理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 触摸对象
    UITouch *touch = [touches anyObject];
    
    // 触摸点
    CGPoint point = [touch locationInView:self];
    
    NSArray *specials = [self.attributedText attribute:@"specials" atIndex:0 effectiveRange:NULL];
    BOOL contains = NO;
    
    for (XSpecial *special in specials) {
        self.selectedRange = special.range;
        // self.selectedRange --影响--> self.selectedTextRange
        // 获得选中范围的矩形框
        NSArray *rects = [self selectionRectsForRange:self.selectedTextRange];
        // 清空选中范围
        self.selectedRange = NSMakeRange(0, 0);
        
        for (UITextSelectionRect *selectionRect in rects) {
            CGRect rect = selectionRect.rect;
            if (rect.size.width == 0 || rect.size.height == 0) continue;
            
            if (CGRectContainsPoint(rect, point)) { // 点中了电话号码
                contains = YES;
                break;
            }
        }
        
        break;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 触摸对象
        UITouch *touch = [touches anyObject];
        
        // 触摸点
        CGPoint point = [touch locationInView:self];
        
        NSArray *specials = [self.attributedText attribute:@"specials" atIndex:0 effectiveRange:NULL];
        BOOL contains = NO;
        
        for (XSpecial *special in specials) {
            self.selectedRange = special.range;
            // self.selectedRange --影响--> self.selectedTextRange
            // 获得选中范围的矩形框
            NSArray *rects = [self selectionRectsForRange:self.selectedTextRange];
            // 清空选中范围
            self.selectedRange = NSMakeRange(0, 0);
            
            for (UITextSelectionRect *selectionRect in rects) {
                CGRect rect = selectionRect.rect;
                if (rect.size.width == 0 || rect.size.height == 0) continue;
                
                if (CGRectContainsPoint(rect, point)) { // 点中了电话号码
                    contains = YES;
                    break;
                }
            }
            
            if (contains) {
                for (UITextSelectionRect *selectionRect in rects) {
                    CGRect rect = selectionRect.rect;
                    if (rect.size.width == 0 || rect.size.height == 0) continue;
                    
                    if (special.text) {
                        
#if TARGET_IPHONE_SIMULATOR//模拟器
                        NSLog(@"模拟器不能拨号！！！！\n请换真机！！！！");
#elif TARGET_OS_IPHONE//真机
                        NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt:%@",special.text];
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:nil];
#endif
                        
                    }
                }
                
                break;
            }
        }
        
        [self touchesCancelled:touches withEvent:event];
    });
}

#pragma mark - setMethods
- (void)setXframe:(XFrame *)xframe {
    _xframe = xframe;
    self.attributedText = xframe.status.attributedText;
    self.frame = xframe.contentLabelF;
}

#pragma mark - 屏蔽长按和双击手势
-(void)longPressToDo {
    
}

- (void)tapPressToDo {
    
}

@end
