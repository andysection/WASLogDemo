//
//  UITapGestureRecognizer+log.m
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UITapGestureRecognizer+log.h"
#import "NSObject+runtime.h"
#import "WASStatisticInterceptionManager.h"

@implementation UITapGestureRecognizer (log)

+ (void)load {
    [self swizzleInstanceMethod:@selector(initWithTarget:action:) with:@selector(myInitWithTarget:action:)];
    [self swizzleInstanceMethod:@selector(addTarget:action:) with:@selector(myAddTarget:action:)];
    [self swizzleInstanceMethod:@selector(sendAction:to:forEvent:) with:@selector(mySendAction:to:forEvent:)];
}

- (instancetype)myInitWithTarget:(nullable id)target action:(nullable SEL)action {
    UITapGestureRecognizer *instance = [self myInitWithTarget:[WASStatisticInterceptionManager shareInstance] action:@selector(tapGestureRecognizerDidTap:)];
    [instance myAddTarget:target action:action];
    return instance;
}

- (void)myAddTarget:(id)target action:(SEL)action {
    [self myAddTarget:target action:action];
    [self myAddTarget:[WASStatisticInterceptionManager shareInstance] action:@selector(tapGestureRecognizerDidTap:)];
}


@end
