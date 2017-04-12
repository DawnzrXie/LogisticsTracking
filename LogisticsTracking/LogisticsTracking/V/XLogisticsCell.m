//
//  XLogisticsCell.m
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/28.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import "XLogisticsCell.h"
#import "XLogisticsData.h"
#import "XStatusTextView.h"
#import "XStatus.h"
#import "XFrame.h"

@interface XLogisticsCell ()

@property (nonatomic, strong) XStatusTextView *textView;

@end

@implementation XLogisticsCell

+ (XLogisticsCell *)cellWithTableView:(UITableView *)tableView {
    
    XLogisticsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[XLogisticsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat )refreshWithData:(XLogisticsData *)data andIsGreen:(BOOL)isGreen{
    
    //删除复用的
    for (id obj in self.contentView.subviews) {
        
        [obj removeFromSuperview];
    }
    
    //Content
    _textView = [[XStatusTextView alloc] initWithFrame:CGRectMake(SCALE750(150), SCALE750(64), SCALE750(460), SCALE750(30))];
    XStatus *status = [[XStatus alloc]init];
    status.text = data.contentStr;
    
    XFrame *xframe =[[XFrame alloc]init];
    xframe.frameX = _textView.frame.origin.x;
    xframe.frameY = _textView.frame.origin.y;
    xframe.maxWidth = _textView.frame.size.width;
    xframe.status = status;
    
    self.textView.xframe = xframe;
    [self.contentView addSubview:self.textView];
    
    //年月日 精确到日
    UILabel *dayLab = [[UILabel alloc] initWithFrame:CGRectMake(SCALE750(150), SCALE750(22), SCALE750(200), SCALE750(32))];
    dayLab.textColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0];
    dayLab.font = [UIFont systemFontOfSize:SCALE750(26)];
    dayLab.text = data.dayStr;
    [self.contentView addSubview:dayLab];
    
    //一天的时间 精确到秒
    UILabel *secondsLab = [[UILabel alloc] initWithFrame:CGRectMake(SCALE750(350), SCALE750(22), SCALE750(200), SCALE750(32))];
    secondsLab.textColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1.0];
    secondsLab.font = [UIFont systemFontOfSize:SCALE750(26)];
    secondsLab.text = data.secondsStr;
    [self.contentView addSubview:secondsLab];
    
    //竖线
    CGFloat selfHeight = _textView.xframe.contentLabelF.size.height + SCALE750(90);
    UIView *verticalLine = [[UIView alloc] initWithFrame:CGRectMake(SCALE750(75), 0, SCALE750(1), selfHeight)];
    verticalLine.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1.0];
    [self.contentView addSubview:verticalLine];
    
    //圆
    UIImageView *roundImgV = [[UIImageView alloc] initWithFrame:CGRectMake(SCALE750(60), SCALE750(50), SCALE750(30), SCALE750(30))];
    if (!isGreen) {
        roundImgV.image = [UIImage imageNamed:@"select_NO"];
        roundImgV.backgroundColor = [UIColor whiteColor];
    } else {
        roundImgV.image = [UIImage imageNamed:@"select_YES"];
    }
    [self.contentView addSubview:roundImgV];
    
    //横线
    UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(SCALE750(150), selfHeight-SCALE750(1), SCREEN_WIDTH - SCALE750(150), SCALE750(1))];
    horizontalLine.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1.0];
    [self.contentView addSubview:horizontalLine];
    
    return selfHeight;
}


@end
