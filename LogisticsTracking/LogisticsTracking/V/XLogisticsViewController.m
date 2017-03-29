//
//  XLogisticsViewController.m
//  LogisticsTracking
//
//  Created by 三维度 on 2017/3/28.
//  Copyright © 2017年 三维度. All rights reserved.
//

#import "XLogisticsViewController.h"
#import "XLogisticsCell.h"
#import "GlobalValus.h"
#import "XLogisticsData.h"
#import "SetClassData.h"

@interface XLogisticsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *logisticsTableView;

@property (nonatomic, strong) NSMutableArray *informationArr;
@end

@implementation XLogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
}


- (void)setUI {
    
    self.navigationItem.title = @"物流跟踪";
    _logisticsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _logisticsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _logisticsTableView.dataSource = self;
    _logisticsTableView.delegate = self;
    [self.view addSubview:_logisticsTableView];
    
}


#pragma mark - tableView Delegate
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.informationArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XLogisticsCell *cell = [XLogisticsCell cellWithTableView:tableView];
    XLogisticsData *data = self.informationArr[indexPath.row];
    if (indexPath.row == 0) {
        [cell refreshWithData:data andIsGreen:YES];
    } else {
        [cell refreshWithData:data andIsGreen:NO];
    }
    return cell;
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XLogisticsCell *cell = (XLogisticsCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    XLogisticsData *data = self.informationArr[indexPath.row];
    CGFloat height = [cell refreshWithData:data andIsGreen:YES];
    return height;
    
}

#pragma mark - getMethods
- (NSMutableArray *)informationArr {
    
    if (!_informationArr) {
        NSArray *xLogisticsArr = [GlobalValus sharedInstance].xLogisticsArr;
        
        _informationArr = [[NSMutableArray alloc] initWithArray:[SetClassData XLogisticsDataWithArray:xLogisticsArr]];
    }
    return _informationArr;
    
}

@end
