//
//  UIControl+Log.m
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UIControl+Log.h"
#import "NSObject+runtime.h"
#import "WASStatisticInterceptionManager.h"

@implementation UIControl (Log)

+ (void)load {
    [self swizzleInstanceMethod:@selector(sendAction:to:forEvent:) with:@selector(mySendAction:to:forEvent:)];
}

- (void)mySendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    
    [[WASStatisticInterceptionManager shareInstance] control:self sendAction:action to:target forEvent:event];
    [self mySendAction:action to:target forEvent:event];
}
@end
