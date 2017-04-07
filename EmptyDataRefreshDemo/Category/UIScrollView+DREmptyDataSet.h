//
//  UIScrollView+DREmptyDataSet.h
//  EmptyDataRefreshDemo
//
//  Created by chenzhen on 2017/4/7.
//  Copyright © 2017年 幽灵鲨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>


typedef void(^ClickBlock)();

@interface UIScrollView (DREmptyDataSet)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic) ClickBlock clickBlock;                // 点击事件
@property (nonatomic, strong) NSString *offset;             // 垂直偏移量
@property (nonatomic, strong) NSString *emptyText;          // 空数据显示内容

- (void)setupEmptyData:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text tapBlock:(ClickBlock)clickBlock;
- (void)setupEmptyDataText:(NSString *)text verticalOffset:(NSString *)offset tapBlock:(ClickBlock)clickBlock;

@end
