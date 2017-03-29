//
//  XStatus.m
//  TheRichText
//
//  Created by 三维度 on 2017/3/16.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import "XStatus.h"
#import "XSpecial.h"
#import "XTextPart.h"
#import "RegexKitLite.h"

@implementation XStatus
- (void)setText:(NSString *)text
{
    _text = [text copy];
    
    // 利用text生成attributedText
    self.attributedText = [self attributedTextWithText:text];
}
/**
 *  普通文字 --> 属性文字
 *
 *  @param text 普通文字
 *
 *  @return 属性文字
 */
- (NSAttributedString *)attributedTextWithText:(NSString *)text
{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    
    
    NSString *phoneNumber = @"(1)\\d{10}";
    NSString *pattern = [NSString stringWithFormat:@"%@",phoneNumber];
    
    //遍历所有的特殊字符串
    NSMutableArray *parts = [NSMutableArray array];
    [text enumerateStringsMatchedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        if ((*capturedRanges).length == 0) return;
        
        XTextPart *part = [[XTextPart alloc] init];
        part.special = YES;
        part.text = *capturedStrings;
        part.range = *capturedRanges;
        [parts addObject:part];
    }];
    //遍历所有的非特殊字符
    [text enumerateStringsSeparatedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        if ((*capturedRanges).length == 0) return;
        
        XTextPart *part = [[XTextPart alloc] init];
        part.text = *capturedStrings;
        part.range = *capturedRanges;
        [parts addObject:part];
    }];
    
    //排序
    //系统是按照从小 -> 大的顺序排列对象
    [parts sortUsingComparator:^NSComparisonResult(XTextPart *part1, XTextPart *part2) {
        //NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
        //返回NSOrderedSame:两个一样大
        //NSOrderedAscending(升序):part2>part1
        //NSOrderedDescending(降序):part1>part2
        if (part1.range.location > part2.range.location) {
            //part1>part2
            //part1放后面, part2放前面
            return NSOrderedDescending;
        }
        //part1<part2
        //part1放前面, part2放后面
        return NSOrderedAscending;
    }];
    
    NSMutableArray *specials = [NSMutableArray array];
    //按顺序拼接每一段文字
    for (XTextPart *part in parts) {
        // 等会需要拼接的子串
        NSAttributedString *substr = nil;
        if (part.special) { //电话号码
            NSLog(@"tel:%@",part.text);
            substr = [[NSAttributedString alloc] initWithString:part.text attributes:@{
                                                                                       NSForegroundColorAttributeName : [UIColor blueColor]
                                                                                       }];
            //创建特殊对象
            XSpecial *s = [[XSpecial alloc] init];
            s.text = part.text;
            NSUInteger loc = attributedText.length;
            NSUInteger len = part.text.length;
            s.range = NSMakeRange(loc, len);
            [specials addObject:s];
            
        } else { //普通文字
            substr = [[NSAttributedString alloc] initWithString:part.text attributes:@{
                                                                                       NSForegroundColorAttributeName : [UIColor colorWithRed:76.0/255 green:76.0/255 blue:76.0/255 alpha:1.0]
                                                                                       }];
            
        }
        if (substr) {
            [attributedText appendAttributedString:substr];
        }
        
    }
    
    //一定要设置字体,保证计算出来的尺寸是正确的
    UIFont *font = [UIFont systemFontOfSize:SCALE750(26)];
    [attributedText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedText.length)];
    [attributedText addAttribute:@"specials" value:specials range:NSMakeRange(0, 1)];
    
    return attributedText;
}

@end
