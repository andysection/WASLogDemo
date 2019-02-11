//
//  WASStatisticInterceptionManager.h
//  WASLogDemo
//
//  Created by Tory on 1/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WASStatisticInterceptionManager : NSObject

+ (instancetype)shareInstance;

- (void)gestureRecognizerDidAction:(UIGestureRecognizer *)sender;

//UIControl 方法打点
- (void)control:(UIControl *)control sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event;

@end
