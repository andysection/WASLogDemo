//
//  UICollectionView+Log.m
//  WASLogDemo
//
//  Created by Tory on 11/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UICollectionView+Log.h"
#import "UICollectionViewDelegateForwarder.h"
#import <objc/runtime.h>
#import "NSObject+runtime.h"

@implementation UICollectionView (Log)

+ (void)load {
    [self swizzleInstanceMethod:@selector(setDelegate:) with:@selector(setMyDelegate:)];
}

- (void)setMyDelegate:(id<UICollectionViewDelegate>)delegate {
    [self setDelegateForward:nil];
    if (!delegate) {
        [self setMyDelegate:nil];
        return;
    }
    
    UICollectionViewDelegateForwarder *delegateForwarder = [[UICollectionViewDelegateForwarder alloc] init];
    delegateForwarder.delegate = delegate;
    [self setDelegateForward:delegateForwarder];
    
    [self setMyDelegate:nil];
    [self setMyDelegate:delegateForwarder];
}

- (void)setDelegateForward:(UICollectionViewDelegateForwarder *)delegateForward {
    objc_setAssociatedObject(self, @selector(delegateForward), delegateForward, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UICollectionViewDelegateForwarder *)delegateForward {
    return objc_getAssociatedObject(self, @selector(delegateForward));
}

@end
