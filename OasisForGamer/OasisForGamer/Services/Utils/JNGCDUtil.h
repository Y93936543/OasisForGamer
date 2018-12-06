//
//  JNGCDUtil.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GCDBlock)(void);

@interface JNGCDUtil : NSObject
// 并发队列
+ (void)runInGlobalQueue:(GCDBlock)queue;

// 主队列
+ (void)runInMainQueue:(GCDBlock)queue;

// 延迟调用
+ (void)runAfterSecs:(float)secs block:(GCDBlock)queue;

// 自定义串行队列
+(void)runSerialQueueParallel:(GCDBlock)queue charIden:(const char *)identifier;
@end

NS_ASSUME_NONNULL_END
