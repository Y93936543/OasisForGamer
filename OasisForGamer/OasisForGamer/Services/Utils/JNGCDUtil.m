//
//  JNGCDUtil.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "JNGCDUtil.h"

@implementation JNGCDUtil
// 并发队列
+ (void)runInGlobalQueue:(GCDBlock)queue {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), queue);
}

// 主队列
+ (void)runInMainQueue:(GCDBlock)queue {
    dispatch_async(dispatch_get_main_queue(), queue);
}

// 延迟调用
+ (void)runAfterSecs:(float)secs block:(GCDBlock)queue {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, secs * NSEC_PER_SEC), dispatch_get_main_queue(), queue);
}

// 自定义串行队列
+(void)runSerialQueueParallel:(GCDBlock)queue charIden:(const char *)identifier {
    dispatch_async(dispatch_queue_create(identifier, DISPATCH_QUEUE_SERIAL), queue);
}
@end
