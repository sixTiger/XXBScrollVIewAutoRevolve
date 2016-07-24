//
//  ViewController.m
//  XXBScrollVIewAutoRevolve
//
//  Created by baidu on 16/7/15.
//  Copyright © 2016年 com.baidu. All rights reserved.
//

#import "ViewController.h"
#import "XXBScrollViewAutoRevolveController.h"
#import "XXBAutoRevolveVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    XXBAutoRevolveVC *autoRevolveVC = [[XXBAutoRevolveVC alloc] init];
    [self.navigationController pushViewController:autoRevolveVC animated:YES];
//    XXBScrollViewAutoRevolveController *scrollViewAutoRevolveController = [[XXBScrollViewAutoRevolveController alloc] init];
//    [self.navigationController pushViewController:scrollViewAutoRevolveController animated:YES];
}
@end
