# EmptyDataRefreshDemo

是对三方刷新框架MJRefresh 、空数据框架DZNEmptyDataSet 的再次封装，这样能减少很多重复的代码

```ruby
[self.tabView setRefreshWithHeaderBlock:^{
        [self head];
    } footerBlock:^{
        [self foot];
    }];
```

```ruby
[self.tabView setupEmptyDataText:nil verticalOffset:100 emptyImage:[UIImage imageNamed:@"emp"] tapBlock:^{
            [self head];
        }];

```








 <img src="http://ovlabegmw.bkt.clouddn.com/EmptyDataRefreshDemo.gif" width="50%" alt="还在路上，稍等..."/>