//
//  UIGestureRecognizer+log.m
//  WASLogDemo
//
//  Created by Tory on 11/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UIGestureRecognizer+log.h"
#import "NSObject+runtime.h"
#import "WASStatisticInterceptionManager.h"

@implementation UIGestureRecognizer (log)

+ (void)load {
    [self swizzleInstanceMethod:@selector(initWithTarget:action:) with:@selector(myInitWithTarget:action:)];
    [self swizzleInstanceMethod:@selector(addTarget:action:) with:@selector(myAddTarget:action:)];
}

- (instancetype)myInitWithTarget:(nullable id)target action:(nullable SEL)action {
    UIGestureRecognizer *instance = [self myInitWithTarget:[WASStatisticInterceptionManager shareInstance] action:@selector(gestureRecognizerDidAction:)];
    [instance myAddTarget:target action:action];
    return instance;
}

- (void)myAddTarget:(id)target action:(SEL)action {
    [self myAddTarget:target action:action];
    [self myAddTarget:[WASStatisticInterceptionManager shareInstance] action:@selector(gestureRecognizerDidAction:)];
}

@end
