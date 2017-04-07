//
//  UIScrollView+DRRefresh.h
//  EmptyDataRefreshDemo
//
//  Created by chenzhen on 2017/4/7.
//  Copyright © 2017年 幽灵鲨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (DRRefresh)


- (void)setRefreshWithHeaderBlock:(void(^)())headerBlock
                      footerBlock:(void(^)())footerBlock;


- (void)headerBeginRefreshing;
- (void)headerEndRefreshing;
- (void)footerEndRefreshing;
- (void)footerNoMoreData;

- (void)hideHeaderRefresh;
- (void)hideFooterRefresh;


@end
