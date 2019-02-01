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

- (void)tapGestureRecognizerDidTap:(id) sender;

@end
