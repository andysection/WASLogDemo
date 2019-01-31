//
//  UITapGestureRecognizer+log.m
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UITapGestureRecognizer+log.h"
#import "NSObject+runtime.h"

@implementation UITapGestureRecognizer (log)

+ (void)load {
    [self swizzleInstanceMethod:@selector(initWithTarget:action:) with:@selector(myInitWithTarget:action:)];
    [self swizzleInstanceMethod:@selector(addTarget:action:) with:@selector(myAddTarget:action:)];
}

- (instancetype)myInitWithTarget:(nullable id)target action:(nullable SEL)action {
    id instance = [self myInitWithTarget:target action:action];
    return instance;
}

- (void)myAddTarget:(id)target action:(SEL)action {
    NSString *strAction = NSStringFromSelector(action);
    NSLog(@"ACTION:%@\nTARGET:%@\nEVENT:%@\n", strAction, target, self);
    [self myAddTarget:target action:action];
}

@end
