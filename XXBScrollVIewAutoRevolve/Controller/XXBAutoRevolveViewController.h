//
//  XXBAutoRevolveViewController.h
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXBAutoRevolveView.h"

@interface XXBAutoRevolveViewController : UIViewController<XXBAutoRevolveViewDataSource>
@property(nonatomic ,weak) XXBAutoRevolveView   *autoRevolveView;
@end
