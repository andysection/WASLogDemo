//
//  UITableViewDelegateForwarder.h
//  WASLogDemo
//
//  Created by Tory on 11/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewDelegateForwarder : NSObject <UITableViewDelegate>

@property (strong, nonatomic) id delegate;

@end
