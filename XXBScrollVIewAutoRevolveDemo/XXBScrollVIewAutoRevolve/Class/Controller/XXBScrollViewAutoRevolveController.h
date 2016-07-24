//
//  XXBScrollVIewAutoRevolveController.h
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XXBScrollViewAutoRevolveDataSource <NSObject>



@end

@interface XXBScrollViewAutoRevolveController : UIViewController

/**
 *  数据源
 */
@property(nonatomic ,weak) id<XXBScrollViewAutoRevolveDataSource> dataSource;

@property(nonatomic ,weak) id delegate;
/**
 *  页数
 */
@property(nonatomic ,assign) NSUInteger pageCount;

/**
 *  是否支持循环滚动
 */
@property(nonatomic ,assign) BOOL allowRevolve;
@end
