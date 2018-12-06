//
//  JNAppPreference.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 * App 信息 （缓存到文件中）
 */
@interface JNAppPreference : NSObject

+ (instancetype)sharedInstance;

#pragma mark - 账户
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *password;

#pragma mark - 配置
@property (nonatomic, assign) BOOL isFirstOpen;
@property (nonatomic, assign) BOOL isLoginSuccess;
@property (nonatomic, assign) BOOL isFirstEnterExam;

@property (nonatomic, assign) BOOL isQuickRegister;   // 是否是快速注册

#pragma mark - DeviceToken
@property (nonatomic, copy) NSString *deviceToken;

@end

NS_ASSUME_NONNULL_END
