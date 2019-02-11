//
//  UISwitch+Description.m
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "UISwitch+Description.h"

@implementation UISwitch (Description)

- (NSString *)description {
    NSString *originDescription = [super description];
    NSString *strIsOn = self.isOn ? @"ON": @"OFF";
    NSString *newDescription = [NSString stringWithFormat:@"%@ SwitchIsOn: %@", originDescription, strIsOn];
    return newDescription;
}

@end
