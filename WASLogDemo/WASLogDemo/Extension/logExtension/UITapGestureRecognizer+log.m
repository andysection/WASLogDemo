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
#import <objc/runtime.h>

@implementation UITapGestureRecognizer (log)

+ (void)load {
    [self swizzleInstanceOwnMethod:@selector(initWithTarget:action:) with:@selector(myInitWithTarget:action:)];
    [self swizzleInstanceOwnMethod:@selector(addTarget:action:) with:@selector(myAddTarget:action:)];
//    [self swizzleInstanceMethod:@selector(addTarget:action:) with:@selector(myAddTarget:action:)];
    //以上方法就是交换了父类方法，影响其他的手势log 解决方法 重新父类的addTarget:action:方法 即可或者通过添加方法的方式解决
}

- (instancetype)myInitWithTarget:(nullable id)target action:(nullable SEL)action {
    UITapGestureRecognizer *instance = [self myInitWithTarget:[WASStatisticInterceptionManager shareInstance] action:@selector(gestureRecognizerDidAction:)];
    [instance myAddTarget:target action:action];
    return instance;
}

- (void)myAddTarget:(id)target action:(SEL)action {
    [self myAddTarget:target action:action];
    [self myAddTarget:[WASStatisticInterceptionManager shareInstance] action:@selector(gestureRecognizerDidAction:)];
}


@end

@implementation UIGestureRecognizer (log)


@end
