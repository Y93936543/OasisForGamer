//
//  UIButton+CountDown.h
//  倒计时(获取短信验证码)
//
//  Created by Mac1 on 2017/4/5.
//  Copyright © 2017年 Mac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)


/**
 *  计时时间
 */
@property(nonatomic,assign,readwrite)NSInteger time;

/**
 *  format
 */
@property(nonatomic,copy)NSString *  format;

/**
 开启计时器
 */
- (void)startTimer;

/**
 干掉计时器
 */
- (void)endTimer;


@end
