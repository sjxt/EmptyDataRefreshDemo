//
//  ViewController.m
//  EmptyDataRefreshDemo
//
//  Created by chenzhen on 2017/4/7.
//  Copyright © 2017年 chenzhen. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+DREmptyDataSet.h"
#import "UIScrollView+DRRefresh.h"
#import "DRHeaderViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tabView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabView setRefreshWithHeaderBlock:^{
        [self head];
    } footerBlock:^{
        [self foot];
    }];

    if (@available(iOS 11.0, *)){
        [[UIScrollView appearanceWhenContainedInInstancesOfClasses:@[[ViewController class]]] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.tabView setupEmptyDataText:@"点击查看更多" verticalOffset:1 tapBlock:^{
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


- (IBAction)clearAction:(id)sender {
    
    // 防止由于上拉加载多次更多数据   空数据展示丢失的问题
    [self.tabView setContentOffset:CGPointZero];
    
    
    [self.dataArray removeAllObjects];
    [self.tabView reloadData];
}


- (IBAction)nextAction:(id)sender {
    
    DRHeaderViewController *head = [[DRHeaderViewController alloc] initWithNibName:@"DRHeaderViewController" bundle:nil];
    [self.navigationController pushViewController:head animated:YES];
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



#pragma mark - Getter Setter

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
