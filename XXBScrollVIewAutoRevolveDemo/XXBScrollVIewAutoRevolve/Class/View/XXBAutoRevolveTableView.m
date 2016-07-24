//
//  XXBAutoRevolveTableView.m
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/19.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBAutoRevolveTableView.h"
#import "XXBRefresh.h"
#import "XXBRefreshHeaderPicView.h"

@interface XXBAutoRevolveTableView () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic , strong) UITableView           *tableView;
@property(nonatomic , strong) NSMutableArray        *dataSouceArray;
@end

@implementation XXBAutoRevolveTableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupTableView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView {
    self.backgroundColor = [UIColor myRandomColor];
    [self _initData];
    [self _creatTableView];
}

- (void)removeNotifaction {
    
}

- (void)_initData {
    _dataSouceArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [_dataSouceArray addObject:[NSString stringWithFormat:@"cell >>> %@",@(_dataSouceArray.count)]];
    }
}

- (void) _creatTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.autoresizingMask = (1 << 6) - 1;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.rowHeight = 80;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [_tableView addHeaderWithTarget:self action:@selector(headerRefresh)];
    [_tableView addFooterWithTarget:self action:@selector(footerRefresh)];
    XXBAutoRefreshFooterUIView *footer = [[XXBAutoRefreshFooterUIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    footer.triggerAutoRefreshMarginBottom  = 1;
    _tableView.footer = footer;
    
    
    XXBRefreshHeaderPicView *refreshHeaderPicView = [[XXBRefreshHeaderPicView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    _tableView.header = refreshHeaderPicView;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UINavigationController *selfNavigationController = [self navigationController];
    UINavigationBar *navigationBar = selfNavigationController.navigationBar;
    if (navigationBar) {
        CGRect navigationBarFrame = navigationBar.frame;
        self.tableView.contentInset = UIEdgeInsetsMake(navigationBarFrame.size.height + navigationBarFrame.origin.y, 0, self.tableView.contentInset.bottom, 0);
    }
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UINavigationController *)navigationController {
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)responder;
        } else {
            responder = responder.nextResponder;
        }
    }
    return nil;
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

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}
@end
