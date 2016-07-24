//
//  XXBAutoRevolveVC.m
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/19.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "XXBAutoRevolveVC.h"
#import "XXBAutoRevolveTableView.h"

@interface XXBAutoRevolveVC ()

@end

@implementation XXBAutoRevolveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfAutoRevolveCellForViewPage:(XXBAutoRevolveView *)autoRevolveView {
    return 3;
}

- (XXBAutoRevolveCell *)autoRevolveView:(XXBAutoRevolveView *)autoRevolveView cellForIndex:(NSUInteger)index {
    XXBAutoRevolveTableView *cell = [[XXBAutoRevolveTableView alloc] initWithFrame:self.view.bounds];
    cell.backgroundColor = [UIColor myRandomColor];
    return cell;
}
@end
