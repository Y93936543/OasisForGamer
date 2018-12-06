//
//  JNCollectionNotify.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/4.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNCollectionNotify.h"

@interface JNCollectionNotify ()

@property NSNotificationCenter* center;

@end

@implementation JNCollectionNotify

+ (instancetype)sharedInstance {
    static JNCollectionNotify *_instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[JNCollectionNotify alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _center = [NSNotificationCenter defaultCenter];
    }
    return self;
}

#pragma mark - 文本框改变通知

- (void)addTexitFieldChangeObserver:(id)target selector:(SEL)selector{
    [_center addObserver:target selector:selector name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)removeTexitFieldChangeObserver:(id)target{
    [_center removeObserver:target name:UITextFieldTextDidChangeNotification object:nil];
}



@end
