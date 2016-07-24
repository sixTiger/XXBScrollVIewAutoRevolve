//
//  XXBRefreshRseources.m
//  XXBRefreshDemo
//
//  Created by baidu on 16/7/13.
//  Copyright © 2016年 xiaobing. All rights reserved.
//

#import "XXBRefreshRseources.h"

@implementation XXBRefreshRseources
static NSString *const ResourcesBundleName = @"XXBRefresh";
+ (NSBundle *)resourceBundle {
    static NSBundle *_bundle = nil;
    static dispatch_once_t _onceToken;
    dispatch_once(&_onceToken, ^{
        NSBundle * classBundle = [NSBundle bundleForClass:[self class]];
        NSString * bundlePath = [classBundle pathForResource:ResourcesBundleName ofType:@"bundle"];
        _bundle = [NSBundle bundleWithPath:bundlePath];
        if (_bundle == nil) {
            _bundle = [NSBundle mainBundle];
        }
    });
    return _bundle;
}

+ (UIImage *)imageNamed:(NSString *)imageName withExtension:(NSString *)extension {
    int scale = [[UIScreen mainScreen] scale];
    NSString *scaleAdjustedImageName = [imageName copy];
    UIImage *image = nil;
    do {
        if (scale > 1) {
            scaleAdjustedImageName = [NSString stringWithFormat:@"%@@%ix",imageName, scale];
        } else {
            scaleAdjustedImageName = [imageName copy];
        }
        NSString *path = [[self resourceBundle] pathForResource:scaleAdjustedImageName ofType:extension];
        image = [UIImage imageWithContentsOfFile:path];
        if (!image) {
            scale--;
        }
    } while (scale > 0 && !image);
    return image;
}
@end
