//
//  UITableView+Log.m
//  WASLogDemo
//
//  Created by Tory on 11/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UITableView+Log.h"
#import "NSObject+runtime.h"
#import "UITableViewDelegateForwarder.h"
#import <objc/runtime.h>

@implementation UITableView (Log)

+ (void)load {
    [self swizzleInstanceMethod:@selector(setDelegate:) with:@selector(setMyDelegate:)];
}

- (void)setMyDelegate:(id<UITableViewDelegate>)delegate {
    if (!delegate) {
        [self setMyDelegate:nil];
        return;
    }
    
    UITableViewDelegateForwarder *delegateForwarder = [[UITableViewDelegateForwarder alloc] init];
    delegateForwarder.delegate = delegate;
    self.delegateForward = delegateForwarder;
    
    [self setMyDelegate:nil];
    [self setMyDelegate:delegateForwarder];
}

- (void)setDelegateForward:(UITableViewDelegateForwarder *)delegateForward {
    objc_setAssociatedObject(self, @selector(delegateForward), delegateForward, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UITableViewDelegateForwarder *)delegateForward {
    return objc_getAssociatedObject(self, @selector(delegateForward));
}

@end
