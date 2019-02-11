//
//  UITableViewDelegateForwarder.m
//  WASLogDemo
//
//  Created by Tory on 11/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UITableViewDelegateForwarder.h"
#import "WASStatisticInterceptionManager.h"

@implementation UITableViewDelegateForwarder

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
    return [_delegate respondsToSelector:selector];
}

- (id)methodSignatureForSelector:(SEL)selector
{
    return [(NSObject *)_delegate methodSignatureForSelector:selector];
}

@end
