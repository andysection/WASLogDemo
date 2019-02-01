//
//  WASStatisticInterceptionManager.m
//  WASLogDemo
//
//  Created by Tory on 1/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "WASStatisticInterceptionManager.h"
#import "NSObject+runtime.h"

@implementation WASStatisticInterceptionManager

+ (instancetype)shareInstance {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)tapGestureRecognizerDidTap:(UITapGestureRecognizer *) sender {
    ///监听tap手势
    NSLog(@"TAPGESTURE: %@", sender);
}

@end
