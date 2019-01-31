//
//  NSObject+runtime.m
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "NSObject+runtime.h"
#import <objc/runtime.h>

@implementation NSObject (runtime)

+ (void)swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector {
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@end
