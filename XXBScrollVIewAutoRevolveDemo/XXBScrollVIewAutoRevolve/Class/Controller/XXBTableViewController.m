//
//  XXBTableViewController.m
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBTableViewController.h"
#import <XXBRefresh.h>
#import "XXBRefreshHeaderPicView.h"

@interface XXBTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic , strong) UITableView           *tableView;
@property(nonatomic , strong) NSMutableArray        *dataSouceArray;
@end

@implementation XXBTableViewController

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self _initData];
    [self _creatTableView];
}

- (void)_initData {
    _dataSouceArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        [_dataSouceArray addObject:[NSString stringWithFormat:@"cell >>> %@",@(_dataSouceArray.count)]];
    }
}

- (void) _creatTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor myRandomColor];
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.rowHeight = 80;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(150, 0, 150, 0);
    [_tableView addHeaderWithTarget:self action:@selector(headerRefresh)];
    [_tableView addFooterWithTarget:self action:@selector(footerRefresh)];
    XXBAutoRefreshFooterUIView *footer = [[XXBAutoRefreshFooterUIView alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    footer.triggerAutoRefreshMarginBottom  = 1;
    _tableView.footer = footer;
    
    
    XXBRefreshHeaderPicView *refreshHeaderPicView = [[XXBRefreshHeaderPicView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    _tableView.header = refreshHeaderPicView;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = self.dataSouceArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSouceArray.count;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"*************************");
}


- (void)headerRefresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView headerEndRefreshing];
    });
    NSLog(@"下拉刷新了");
}
- (void)footerRefresh {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger count = self.dataSouceArray.count;
        
        for (NSInteger i = count; i < count + 5; i++) {
            [_dataSouceArray addObject:[NSString stringWithFormat:@"cell >>> %@",@(_dataSouceArray.count)]];
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:count inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
        }
        [self.tableView footerEndRefreshing];
    });
}
@end
