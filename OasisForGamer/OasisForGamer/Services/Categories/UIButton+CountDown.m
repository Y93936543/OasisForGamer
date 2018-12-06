//
//  UIButton+CountDown.m
//  倒计时
//
//  Created by Mac1 on 2017/4/5.
//  Copyright © 2017年 Mac1. All rights reserved.

#import "UIButton+CountDown.h"
#import <objc/runtime.h>

@interface UIButton ()

/**
 *  nn
 */
@property(nonatomic,strong)dispatch_source_t timer;

/**
 *  记录外边的时间
 */
@property(nonatomic,assign)NSInteger userTime;


@end


@implementation UIButton (CountDown)

static const char kButtonTime;
static const char kButtonTitle;
static const char kTimer;
static const char kUserTime;

static NSInteger const TimeInterval = 60; // 默认时间
static NSString * const ButtonTitleFormat = @"剩余%ld秒";
static NSString * const RetainTitle = @"重新获取";

- (void)setTime:(NSInteger)time
{
    objc_setAssociatedObject(self, &kButtonTime, @(time), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)time
{
    return  [objc_getAssociatedObject(self, (&kButtonTime)) integerValue];
}

- (void)setFormat:(NSString *)format
{
    objc_setAssociatedObject(self, &kButtonTitle, format, OBJC_ASSOCIATION_COPY);
}

- (NSString *)format
{
    return objc_getAssociatedObject(self, &kButtonTitle);
}

- (void)setUserTime:(NSInteger)userTime
{
    objc_setAssociatedObject(self, &kUserTime, @(userTime), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)userTime
{
    return  [objc_getAssociatedObject(self, &kUserTime) integerValue];
}

- (void)setTimer:(dispatch_source_t)timer
{
    objc_setAssociatedObject(self, &kTimer, timer, OBJC_ASSOCIATION_RETAIN);
}

- (dispatch_source_t)timer
{
    return objc_getAssociatedObject(self, &kTimer);
}

- (void)startTimer
{
    
    if (!self.time) {
        self.time = TimeInterval;
    }
    if (!self.format) {
        self.format = ButtonTitleFormat;
    }
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalQueue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
        if (self.time <= 1) {
            dispatch_source_cancel(self.timer);
        }else
        {
            self.time --;
            dispatch_async(mainQueue, ^{
                self.enabled = NO;
                [self setTitle:[NSString stringWithFormat:self.format,self.time] forState:UIControlStateNormal];
                [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                //ALOGDebug(@"width:%f",self.bounds.size.width);
                //self.mj_w = 90.0;
            });
        }
    });
    dispatch_source_set_cancel_handler(self.timer, ^{
        dispatch_async(mainQueue, ^{
            self.enabled = YES;
            [self setTitle:RetainTitle forState:UIControlStateNormal];
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (self.userTime) {
                self.time = self.userTime;
            }else
            {
                self.time = TimeInterval;
            }
        });
    });
    dispatch_resume(self.timer);
}

- (void)endTimer
{
    dispatch_source_cancel(self.timer);
}




@end
