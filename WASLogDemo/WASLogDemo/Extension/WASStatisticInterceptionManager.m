//
//  WASStatisticInterceptionManager.m
//  WASLogDemo
//
//  Created by Tory on 1/2/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "WASStatisticInterceptionManager.h"
#import "NSObject+runtime.h"

@interface WASStatisticInterceptionManager() <UITableViewDelegate, UICollectionViewDelegate>

@end

@implementation WASStatisticInterceptionManager

+ (instancetype)shareInstance {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (void)control:(UIControl *)control sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    NSString *strAction = NSStringFromSelector(action);
    NSLog(@"WASLOG------ACTION:%@ TARGET:%@ EVENT:%@ SELF:%@", strAction, target, event, control);
}

- (void)gestureRecognizerDidAction:(UIGestureRecognizer *)sender {
    ///监听tap手势
    NSLog(@"WASLOG------GESTURE: %@", sender);
}

#pragma mark -TableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"WASLOG------TABLEVIEW DATASOURCE:%@, DID SELECT SECTION:%zd, ROW:%zd ", tableView.dataSource, indexPath.section, indexPath.row);
}

#pragma mark -CollectionView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"WASLOG------COLLECTIONVIEW DATASOURCE:%@, DID SELECT SECTION:%zd, ROW:%zd ", collectionView.dataSource, indexPath.section, indexPath.row);
}

@end
