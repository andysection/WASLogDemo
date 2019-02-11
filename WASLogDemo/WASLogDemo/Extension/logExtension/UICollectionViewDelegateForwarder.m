//
//  UICollectionViewDelegateForwarder.m
//  WASLogDemo
//
//  Created by Tory on 11/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UICollectionViewDelegateForwarder.h"
#import "WASStatisticInterceptionManager.h"

@implementation UICollectionViewDelegateForwarder

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL selector = [invocation selector];
    if([_delegate respondsToSelector:selector])
    {
        [invocation invokeWithTarget:_delegate];
        
        WASStatisticInterceptionManager *manager = [WASStatisticInterceptionManager shareInstance];
        if ([manager respondsToSelector:selector]) {
            [invocation invokeWithTarget:manager];
        }
    }
}

- (BOOL)respondsToSelector:(SEL)selector
{
    BOOL resule = [_delegate respondsToSelector:selector];
    return resule;
}

- (id)methodSignatureForSelector:(SEL)selector
{
    return [(NSObject *)_delegate methodSignatureForSelector:selector];
}

@end
