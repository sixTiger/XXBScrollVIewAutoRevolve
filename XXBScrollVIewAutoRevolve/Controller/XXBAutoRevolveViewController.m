//
//  XXBAutoRevolveViewController.m
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBAutoRevolveViewController.h"

@interface XXBAutoRevolveViewController ()<UIScrollViewDelegate>
@property(nonatomic ,assign)NSUInteger currentPageIndexBeforeRotation;
@end

@implementation XXBAutoRevolveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAutoRevolveViewController];
}

- (void)setupAutoRevolveViewController {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.clipsToBounds = YES;
    self.autoRevolveView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
}


#pragma mark - layzLoad

- (XXBAutoRevolveView *)autoRevolveView {
    if (_autoRevolveView == nil) {
        XXBAutoRevolveView *autoRevolveView = [[XXBAutoRevolveView alloc] initWithFrame:self.view.bounds];
        autoRevolveView.scrollsToTop = NO;
        autoRevolveView.delegate = self;
        autoRevolveView.pagingEnabled = YES;
        autoRevolveView.margin = 5;
        autoRevolveView.autoresizingMask = (1 << 6) - 1;
        [self.view addSubview:autoRevolveView];
        _autoRevolveView = autoRevolveView;
    }
    return _autoRevolveView;
}

- (XXBAutoRevolveCell *)autoRevolveView:(XXBAutoRevolveView *)autoRevolveView cellForIndex:(NSUInteger)index {
    NSAssert(false, @"子类实现");
    return nil;
}

#pragma mark - Rotate

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    _currentPageIndexBeforeRotation = self.autoRevolveView.currentIndex;
    self.autoRevolveView.shouldChangeIndex = NO;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    self.autoRevolveView.shouldChangeIndex = YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    self.autoRevolveView.currentIndex = self.currentPageIndexBeforeRotation;
    [self.autoRevolveView reloadPageFrames];
}

@end
