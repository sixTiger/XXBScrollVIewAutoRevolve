//
//  XXBScrollViewAutoRevolveView.h
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXBAutoRevolveCell.h"
@class XXBAutoRevolveView;

@protocol XXBAutoRevolveViewDataSource <NSObject>

@optional
/**
 *  autoRevolveView的cell个数 如果设置了
 *
 *  @param autoRevolveView autoRevolveView pageCount 这个代理可以不用实现
 *
 *  @return 个数
 */
- (NSInteger)numberOfAutoRevolveCellForViewPage:(XXBAutoRevolveView *)autoRevolveView;

@required
/**
 *  XXBAutoRevolveView 对应index的cell
 *
 *  @param autoRevolveView autoRevolveView
 *  @param index           index
 *
 *  @return XXBAutoRevolveCell
 */
- (XXBAutoRevolveCell *)autoRevolveView:(XXBAutoRevolveView *)autoRevolveView cellForIndex:(NSUInteger)index;
@end

@interface XXBAutoRevolveView : UIScrollView

@property(nonatomic ,weak) id<XXBAutoRevolveViewDataSource>     dataSource;

/**
 *  总用有多少个page
 */
@property(nonatomic ,assign) NSUInteger                         pageCount;

/**
 *  每个怕个距离左右的边距
 */
@property(nonatomic ,assign) CGFloat                            margin;

/**
 *  当前的下表
 */
@property(nonatomic ,assign) NSUInteger                         currentIndex;

@property(nonatomic ,assign) BOOL                               shouldChangeIndex;

- (XXBAutoRevolveCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

- (void)reloadData;
- (void)reloadPageFrames;
- (void)scrollToIndex:(NSUInteger)index;
@end
