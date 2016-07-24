//
//  XXBScrollViewAutoRevolveController.m
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBScrollViewAutoRevolveController.h"
#import "XXBTableViewController.h"
#import "XXBTableView.h"

@interface XXBScrollViewAutoRevolveController ()<UIScrollViewDelegate>
@property(nonatomic ,weak) UIScrollView     *titleScrollView;
@property(nonatomic ,weak) UIScrollView     *mainScrollView;
@property(nonatomic , strong)NSArray        *iteamArray;
/**
 * 当前的真实下表
 */
@property(nonatomic , assign)NSUInteger     currentIndex;
@property(nonatomic , assign)NSUInteger     priventIndex;
@property(nonatomic , assign)NSUInteger     nextIndex;
@property(nonatomic , assign)NSUInteger     willShowIndex;

@property(nonatomic ,assign) NSUInteger     currentIndexBeforeRotation;
@end

@implementation XXBScrollViewAutoRevolveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    [self setupScrollView];
}

- (void)setupScrollView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor myRandomColor];
    self.allowRevolve = YES;
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self layoutVisiblePages];
}


- (void)setupFrameWithCurrentIndex {
    
    int count = (int)self.iteamArray.count;
    UIView *currentView  = self.iteamArray[_currentIndex];
    CGRect frame = currentView.frame;
    frame.origin.x = frame.size.width;
    frame.origin.y = 0;
    currentView.frame = frame;
    [self.mainScrollView addSubview:currentView];
    if (count == 1) {
        return;
    }
    
    if (self.mainScrollView.contentOffset.x >= self.mainScrollView.frame.size.width) {
        _willShowIndex = (_currentIndex + count +1) %count;
    } else {
        _willShowIndex = (_currentIndex + count - 1) %count;
    }
    UIView *willShowtView  = self.iteamArray[_willShowIndex];
    frame = willShowtView.frame;
    frame.origin.x = self.mainScrollView.contentOffset.x <= self.mainScrollView.frame.size.width?  0 : 2 * frame.size.width;
    ;
    willShowtView.frame = frame;
    [self.mainScrollView addSubview:willShowtView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.mainScrollView) {
        if(self.allowRevolve) {
            BOOL shouldSetupFrame = NO;
            NSInteger realIndex = (scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5 )  ;
            CGFloat moveX = 0.0;
            if (realIndex != 1) {
                NSLog(@"需要刷新页面了 需要刷新页面了 %@",@(realIndex));
                if (realIndex == 0 ) {
                    if ((int)(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.6 ) == 0) {
                        shouldSetupFrame = YES;
                        moveX = scrollView.bounds.size.width ;
                        _currentIndex += (realIndex + self.iteamArray.count -1);
                        _currentIndex %= self.iteamArray.count;
                    }
                } else {
                    
                    if ( (int)(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.4 ) == 2) {
                        shouldSetupFrame = YES;
                        moveX = -scrollView.bounds.size.width ;
                        _currentIndex += (realIndex + self.iteamArray.count -1);
                        _currentIndex %= self.iteamArray.count;
                    }
                }
            }
            if (shouldSetupFrame) {
                [self.mainScrollView setContentOffset:CGPointMake(self.mainScrollView.contentOffset.x + moveX, self.mainScrollView.contentOffset.y)];
                [self setupFrameWithCurrentIndex];
            }
            [self setupFrameWithCurrentIndex];
            
        } else {
            _currentIndex = (scrollView.contentOffset.x / scrollView.bounds.size.width) + 0.5;

        }
    }
}

#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    _currentIndexBeforeRotation = _currentIndex;
    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    // Perform layout
    _currentIndex = _currentIndexBeforeRotation;
    [self layoutVisiblePages];
    
}

- (void)layoutVisiblePages {
    
    self.mainScrollView.contentSize = [self contentSizeForPagingScrollView];
    for (NSUInteger index = 0; index < self.iteamArray.count; index++) {
        UIView *view = self.iteamArray[index];
        view.frame = [self frameForPageAtIndex:index];
        [view layoutIfNeeded];
    }
    self.mainScrollView.contentOffset = [self contentOffsetForPageAtIndex:self.currentIndex];
    
}

- (CGRect)frameForPageAtIndex:(NSUInteger)index {
    CGRect bounds = self.mainScrollView.bounds;
    CGRect pageFrame = bounds;
    pageFrame.origin.x = bounds.size.width * index;
    //    pageFrame.size.width -= (2 * PADDING);
    //    pageFrame.origin.x = (bounds.size.width * index) + PADDING;
    return CGRectIntegral(pageFrame);
    return CGRectMake(0, 0, 0, 0);
}

- (CGRect)frameForMainScrollView {
    CGRect frame = self.view.bounds;// [[UIScreen mainScreen] bounds];
    //    frame.origin.x -= PADDING;
    //    frame.size.width += (2 * PADDING);
    return CGRectIntegral(frame);
}

- (CGSize)contentSizeForPagingScrollView {
    CGRect bounds = self.mainScrollView.bounds;
    return self.allowRevolve? CGSizeMake(bounds.size.width * 3, 0) : CGSizeMake(bounds.size.width * [self numberOfPage], 0);
}

- (CGPoint)contentOffsetForPageAtIndex:(NSUInteger)index {
    CGFloat pageWidth = self.mainScrollView.bounds.size.width;
    CGFloat newOffset = index * pageWidth;
    return CGPointMake(newOffset, 0);
}

- (NSUInteger)numberOfPage {
    return self.iteamArray.count;
}
#pragma mark - layzLoad

-  (void)setAllowRevolve:(BOOL)allowRevolve {
    _allowRevolve = allowRevolve ;
    [self layoutVisiblePages];
}

- (UIScrollView *)titleScrollView {
    if (_titleScrollView == nil) {
        UIScrollView *titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self.view addSubview:titleScrollView];
        _titleScrollView = titleScrollView;
    }
    return _titleScrollView;
}

- (UIScrollView *)mainScrollView {
    if (_mainScrollView == nil) {
        UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        mainScrollView.pagingEnabled = YES;
        mainScrollView.delegate = self;
        [self.view addSubview:mainScrollView];
        mainScrollView.autoresizingMask = (1 << 6) - 1;
        _mainScrollView = mainScrollView;
    }
    return _mainScrollView;
}

- (NSArray *)iteamArray {
    if (_iteamArray == nil) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i =0; i < 3; i++) {
            UIView *view = [[XXBTableView alloc] initWithFrame:self.mainScrollView.frame];
            [self.mainScrollView addSubview:view];
            [array addObject:view];
        }
        _iteamArray = [array copy];
    }
    return _iteamArray;
}
@end
