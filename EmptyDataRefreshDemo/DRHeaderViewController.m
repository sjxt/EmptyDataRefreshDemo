//
//  DRHeaderViewController.m
//  EmptyDataRefreshDemo
//
//  Created by chenzhen on 2017/4/7.
//  Copyright © 2017年 幽灵鲨. All rights reserved.
//

#import "DRHeaderViewController.h"
#import "UIScrollView+DRRefresh.h"
#import "UIScrollView+DREmptyDataSet.h"

@interface DRHeaderViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tabView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation DRHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void) setupTableView{
    
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor redColor];
    headerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    [self.tabView setTableHeaderView:headerView];

    self.tabView.rowHeight = 44;
    [self.tabView setRefreshWithHeaderBlock:^{
        [self head];
    } footerBlock:^{
        [self foot];
    }];
    
    [self.tabView setupEmptyDataText:nil verticalOffset:100 tapBlock:^{
        [self head];
    }];
}


- (void) head{
    
    [self.dataArray removeAllObjects];
    
    for (int i = 1; i<6; i++) {
        [self.dataArray addObject:@(i)];
    }
    
    [self.tabView headerEndRefreshing];
    
    [self.tabView reloadData];
}


- (void) foot{
    
    for (int i = 1; i<6; i++) {
        [self.dataArray addObject:@(i)];
    }
    [self.tabView footerEndRefreshing];
    
    [self.tabView reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *SimpleTableViewIdentifier = @"SimpleTableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableViewIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableViewIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row %ld",(long)indexPath.row];
    
    return cell;
}

#pragma mark Getter Setter

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
