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

//遍历获取Person类所有的成员变量IvarList
- (void)LogIvarList {
    unsigned int methodCount = 0;
    Ivar * ivars = class_copyIvarList([self class], &methodCount);
    for (unsigned int i = 0; i < methodCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        NSLog(@"%@拥有的成员变量的类型为%s，名字为 %s ", [self class],type, name);
    }
    free(ivars);
}

//遍历获取所有属性Property
- (void)logAllProperty {
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyCount);
    for (unsigned int i = 0; i < propertyCount; i++ ) {
        const char* propertyName = property_getName(propertyList[i]);
        NSLog(@"%@拥有的属性为: '%s'", [self class], propertyName);
    }
}

@end
