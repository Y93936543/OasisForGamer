//
//  JNCollectionNotify.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/12/4.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JNCollectionNotify : NSObject

+ (instancetype)sharedInstance;

#pragma mark - 文本框改变通知
- (void)addTexitFieldChangeObserver:(id)target selector:(SEL)selector;
- (void)removeTexitFieldChangeObserver:(id)target;

@end

NS_ASSUME_NONNULL_END
