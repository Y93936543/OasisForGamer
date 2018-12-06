//
//  JNURLUtil.h
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/22.
//  Copyright © 2018年 junion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JNURLUtil : NSObject

// base64 编码
+ (NSString *)base64Encode:(NSString *)string;
+ (NSString *)base64Decode:(NSString *)string;

// 中文编码
+ (NSString *)base64ChineseEncode:(NSString *)string;

//获取手机型号
+ (NSString *)iphoneType;

@end

NS_ASSUME_NONNULL_END
