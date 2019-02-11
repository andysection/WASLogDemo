//
//  NSObject+runtime.h
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (runtime)
/**
 方法交换

 @param originalSelector 原方法
 @param swizzledSelector 目标方法
 */
+ (void)swizzleInstanceMethod:(SEL)originalSelector with:(SEL)swizzledSelector;

/**
 本身方法交换(范围为本身类或者实例方法)

 @param originalSelector 原方法
 @param swizzledSelector 目标方法
 */
+ (void)swizzleInstanceOwnMethod:(SEL)originalSelector with:(SEL)swizzledSelector;

- (void)LogIvarList;

//遍历获取所有属性Property
- (void)logAllProperty;

@end
