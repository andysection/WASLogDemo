//
//  UIControl+Log.m
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UIControl+Log.h"
#import "NSObject+runtime.h"

@implementation UIControl (Log)

+ (void)load {
    [self swizzleInstanceMethod:@selector(sendAction:to:forEvent:) with:@selector(mySendAction:to:forEvent:)];
}

- (void)mySendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    NSString *strAction = NSStringFromSelector(action);
    NSLog(@"ACTION:%@\nTARGET:%@\nEVENT:%@\nSELF:%@", strAction, target, event, self);
    
    [self mySendAction:action to:target forEvent:event];
}
@end
