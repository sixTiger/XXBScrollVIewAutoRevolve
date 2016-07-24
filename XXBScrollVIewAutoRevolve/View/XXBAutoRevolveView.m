//
//  XXBScrollViewAutoRevolveView.m
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBAutoRevolveView.h"

@interface XXBAutoRevolveView() {
    NSUInteger _currentIndex;
}

/**
 *  所有cell的frame数据
 */
@property (nonatomic, strong) NSMutableArray        *cellFrames;

/**
 *  正在展示的cell
 */
@property (nonatomic, strong) NSMutableDictionary   *displayingCells;

/**
 *  缓存池用字典包裹一层Set
 */
@property(nonatomic , strong) NSMutableDictionary   *reusableCellDict;

/**
 *  frame发生改变的时候的计算上一次的宽度
 */
@property(nonatomic ,assign) CGRect                 lastFrame;

@property(nonatomic ,assign) NSUInteger             realIndex;
@end

@implementation XXBAutoRevolveView
@dynamic delegate;
static NSString *contentOffset = @"contentOffset";

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupAutoRevolveView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupAutoRevolveView];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (self.superview) {
        [self removeObserver];
    }
    [self addobserver];
    [self reloadData];
}

/**
 *  当UIScrollView滚动的时候也会调用这个方法
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    if(self.lastFrame.size.width != CGRectGetWidth(self.frame) || self.lastFrame.size.height != CGRectGetHeight(self.frame)) {
        self.lastFrame = self.frame;
        /**
         *  屏幕旋转，或者view的大小发生变化的时候
         */
        [self reloadPageFrames];
    } else {
        //     向数据源索要对应位置的cell
        NSUInteger numberOfCells = self.cellFrames.count;
        for (NSUInteger i = 0; i < numberOfCells; i++) {
            // 取出i位置的frame
            CGRect cellFrame = [self.cellFrames[i] CGRectValue];
            
            // 优先从字典中取出i位置的cell
            XXBAutoRevolveCell *cell = self.displayingCells[@(i)];
            
            // 判断i位置对应的frame在不在屏幕上（能否看见）
            if ([self isInScreen:cellFrame]) { // 在屏幕上
                if (cell == nil) {
                    cell = [self.dataSource autoRevolveView:self cellForIndex:i];
                    cell.frame = cellFrame;
                    [self addSubview:cell];
                    // 存放到字典中
                    self.displayingCells[@(i)] = cell;
                }
            } else {  // 不在屏幕上
                if (cell) {
                    // 从scrollView和字典中移除
                    [cell removeFromSuperview];
                    [self.displayingCells removeObjectForKey:@(i)];
                    if(cell.reuseIdentifier) {
                        // 有标示的 存放进缓存池
                        NSMutableSet *cellSet = [self.reusableCellDict valueForKey:cell.reuseIdentifier];
                        if (cellSet == nil) {
                            cellSet = [NSMutableSet set];
                            [self.reusableCellDict setValue:cellSet forKey:cell.reuseIdentifier];
                        }
                        [cellSet addObject:cell];
                    }
                    
                }
            }
        }
        
    }
}

- (void)dealloc {
    [self removeObserver];
}

- (void) setupAutoRevolveView {
    self.shouldChangeIndex = YES;
}

#pragma mark - KVO

- (void)addobserver {
    [self addObserver:self forKeyPath:contentOffset options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)removeObserver {
    [self removeObserver:self forKeyPath:contentOffset];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (keyPath == contentOffset && self.shouldChangeIndex) {
        CGPoint newContentoffset = [change[@"new"] CGPointValue];
        _realIndex = (NSUInteger)(newContentoffset.x / CGRectGetWidth(self.bounds) + 0.5);
        if (_realIndex >= self.pageCount && self.pageCount > 0) {
            _realIndex = self.pageCount - 1;
        }
    }
}

#pragma mark - function
- (void)reloadData {
    [self reloadPageFrames];
    //    清空之前的所有数据
    [self.displayingCells.allValues makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //     移除正在正在显示cell
    [self.displayingCells removeAllObjects];
    [self.reusableCellDict removeAllObjects];
    [self layoutIfNeeded];
}

- (void)reloadPageCount {
    if ([self.dataSource respondsToSelector:@selector(numberOfAutoRevolveCellForViewPage:)]) {
        self.pageCount = [self.dataSource numberOfAutoRevolveCellForViewPage:self];
    }
}

- (void)reloadPageFrames {
    [self reloadPageCount];
    self.contentSize = [self contentSizeOfAutoRevolve];
    [self scrollPageToIndex:self.realIndex];
    [self.cellFrames removeAllObjects];
    // 计算所有cell的frame
    for (NSUInteger i = 0; i < self.pageCount; i++) {
        // 添加frame到数组中
        CGRect pageFrame = [self frameOfPageViewWithIndex:i];
        [self.cellFrames addObject:[NSValue valueWithCGRect:pageFrame]];
        XXBAutoRevolveCell *cell = (XXBAutoRevolveCell *)[self.displayingCells objectForKey:@(i)];
        if (cell) {
            cell.frame = pageFrame;
        }
    }
}

- (XXBAutoRevolveCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    __block XXBAutoRevolveCell *reusableAutoRevolveCell = nil;
    NSMutableSet *cellSet = [self.reusableCellDict valueForKey:identifier];
    if (cellSet.count > 0) {
        reusableAutoRevolveCell = [cellSet anyObject];
        if (reusableAutoRevolveCell) { // 从缓存池中移除
            [cellSet removeObject:reusableAutoRevolveCell];
            return reusableAutoRevolveCell;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

#pragma mark - Pirvate function

- (void)scrollPageToIndex:(NSUInteger)index {
    self.contentOffset = CGPointMake([self frameOfPageViewWithIndex:index].origin.x - self.margin, 0);
}

- (CGSize)contentSizeOfAutoRevolve {
    return CGSizeMake(CGRectGetWidth(self.bounds) * self.pageCount, self.contentOffset.y);
}

- (CGRect)frameOfPageViewWithIndex:(NSUInteger) index {
    
    CGFloat pageX = 0;
    CGFloat pageY = 0;
    CGFloat pageW = CGRectGetWidth(self.bounds) - self.margin * 2;
    CGFloat pageH = CGRectGetHeight(self.bounds);
    CGFloat selfWidth = pageW + self.margin * 2;
    pageX = selfWidth * index + self.margin;
    // 添加frame到数组中
    CGRect pageFrame = CGRectMake(pageX, pageY, pageW, pageH);
    return pageFrame;
}

/**
 *  判断一个frame有无显示在屏幕上
 */
- (BOOL)isInScreen:(CGRect)frame {
    return ((CGRectGetMaxY(frame) > self.contentOffset.y)&&(CGRectGetMinY(frame) < self.contentOffset.y + CGRectGetHeight(self.bounds))) && ((CGRectGetMaxX(frame) > self.contentOffset.x) &&(CGRectGetMinX(frame) < self.contentOffset.x + CGRectGetWidth(self.bounds))) ;
}

#pragma mark - layzload

- (void)setMargin:(CGFloat)margin {
    _margin = margin;
    CGRect selfFrame = self.frame;
    self.frame = CGRectMake(- margin, selfFrame.origin.y, selfFrame.size.width + margin * 2, selfFrame.size.height);
}

- (void)setDataSource:(id<XXBAutoRevolveViewDataSource>)dataSource {
    _dataSource = dataSource;
    [self reloadData];
}

- (void)setCurrentIndex:(NSUInteger)currentIndex {
    _currentIndex = currentIndex;
    _realIndex = currentIndex;
    [self scrollPageToIndex:_currentIndex];
}

- (NSUInteger)currentIndex {
    return self.realIndex;
}

- (NSMutableArray *)cellFrames {
    if (_cellFrames == nil) {
        self.cellFrames = [NSMutableArray array];
    }
    return _cellFrames;
}

- (NSMutableDictionary *)displayingCells {
    if (_displayingCells == nil) {
        self.displayingCells = [NSMutableDictionary dictionary];
    }
    return _displayingCells;
}

- (NSMutableDictionary *)reusableCellDict {
    if (_reusableCellDict == nil) {
        _reusableCellDict = [NSMutableDictionary dictionary];
    }
    return _reusableCellDict;
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}
@end
